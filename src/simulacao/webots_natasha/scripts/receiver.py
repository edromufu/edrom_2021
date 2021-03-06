#!/usr/bin/env python3
# -*- coding:utf-8 -*-

from __future__ import unicode_literals, print_function

"""
This code provides a gamecontroller client for the RoboCup Humanoid League.

.. moduleauthor:: Nils Rokita <0rokita@informatik.uni-hamburg.de>
.. moduleauthor:: Robert Kessler <8kessler@informatik.uni-hamburg.de>

"""

import socket
import time
import rospy

from construct import Container, ConstError

from behaviour_msgs.msg import GameState as GameStateMsg
from std_msgs.msg import Bool
from gamestate import GameState, ReturnData, GAME_CONTROLLER_RESPONSE_VERSION


class GameStateReceiver(object):
    """ This class puts up a simple UDP Server which receives the
    *addr* parameter to listen to the packages from the game_controller.

    If it receives a package it will be interpreted with the construct data
    structure and the :func:`on_new_gamestate` will be called with the content.

    After this we send a package back to the GC """

    def __init__(self):
        rospy.init_node('game_controller')

        # Information that is used when sending the answer to the game controller
        self.team = rospy.get_param('team_id')
        self.player = rospy.get_param('bot_id')
        rospy.loginfo('We are playing as player {} in team {}'.format(self.player, self.team))
        self.state_publisher = rospy.Publisher('gamestate', GameStateMsg, queue_size=1)

        self.man_penalize = False
        self.game_controller_lost_time = 20
        self.game_controller_connected_publisher = rospy.Publisher('game_controller_connected', Bool, queue_size=1)

        # The address listening on and the port for sending back the robots meta data
        self.addr = (rospy.get_param('~listen_host'), rospy.get_param('~listen_port'))
        self.answer_port = rospy.get_param('~answer_port')

        # The state and time we received last form the GC
        self.state = None
        self.time = time.time()

        # The socket and whether it is still running
        self.socket = None
        self.running = True

        self._open_socket()

    def _open_socket(self):
        """ Creates the socket """
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.socket.bind(self.addr)
        self.socket.settimeout(2)
        self.socket2 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
        self.socket2.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    def receive_forever(self):
        """ Waits in a loop that is terminated by setting self.running = False """
        while not rospy.is_shutdown():
            try:
                self.receive_once()
            except IOError as e:
                rospy.logwarn("Error while sending keepalive: " + str(e))

    def receive_once(self):
        """ Receives a package and interprets it.
            Calls :func:`on_new_gamestate`
            Sends an answer to the GC """
        try:
            data, peer = self.socket.recvfrom(GameState.sizeof())

            # Throws a ConstError if it doesn't work
            parsed_state = GameState.parse(data)

            # Assign the new package after it parsed successful to the state
            self.state = parsed_state
            self.time = time.time()

            # Publish that game controller received message
            msg = Bool()
            msg.data = True
            self.game_controller_connected_publisher.publish(msg)

            # Call the handler for the package
            self.on_new_gamestate(self.state)

            # Answer the GameController
            self.answer_to_gamecontroller(peer)

        except AssertionError as ae:
            rospy.logerr(ae.message)
        except socket.timeout:
            rospy.loginfo_throttle(5.0, "No GameController message received (socket timeout)")
        except ConstError:
            rospy.logwarn("Parse Error: Probably using an old protocol!")
        finally:
            if self.get_time_since_last_package() > self.game_controller_lost_time:
                self.time += 5  # Resend message every five seconds
                rospy.logwarn_throttle(5.0, 'No game controller messages received, allowing robot to move')
                msg = GameStateMsg()
                msg.gameState = 3  # PLAYING
                self.state_publisher.publish(msg)
                msg2 = Bool()
                msg2.data = False
                self.game_controller_connected_publisher.publish(msg2)

    def answer_to_gamecontroller(self, peer):
        """ Sends a life sign to the game controller """
        return_message = 0 if self.man_penalize else 2

        data = Container(
            header=b"RGrt",
            version=GAME_CONTROLLER_RESPONSE_VERSION,
            team=self.team,
            player=self.player,
            message=return_message)
        try:
            destination = peer[0], self.answer_port
            rospy.logdebug('Sending answer to {} port {}'.format(destination[0], destination[1]))
            self.socket.sendto(ReturnData.build(data), destination)
        except Exception as e:
            rospy.logerr("Network Error: %s" % str(e))

    def on_new_gamestate(self, state):
        """ Is called with the new game state after receiving a package.
            The information is processed and published as a standard message to a ROS topic.
            :param state: Game State
        """
        if state.teams[0].team_number == self.team:
            own_team = state.teams[0]
            rival_team = state.teams[1]
        elif state.teams[1].team_number == self.team:
            own_team = state.teams[1]
            rival_team = state.teams[0]
        else:
            rospy.logerr('Team {} not playing, only {} and {}'.format(self.team,
                                                                      state.teams[0].team_number,
                                                                      state.teams[1].team_number))
            return

        try:
            me = own_team.players[self.player - 1]
        except IndexError:
            rospy.logerr('Robot {} not playing'.format(self.player))
            return

        msg = GameStateMsg()
        msg.header.stamp = rospy.Time.now()
        msg.gameState = state.game_state.intvalue
        msg.secondaryState = state.secondary_state.intvalue
        msg.secondaryStateMode = state.secondary_state_info[1]
        msg.firstHalf = state.first_half
        msg.ownScore = own_team.score
        msg.rivalScore = rival_team.score
        msg.secondsRemaining = state.seconds_remaining
        msg.secondary_seconds_remaining = state.secondary_seconds_remaining
        msg.hasKickOff = state.kick_of_team == self.team
        msg.penalized = me.penalty != 0
        msg.secondsTillUnpenalized = me.secs_till_unpenalized
        msg.secondaryStateTeam = state.secondary_state_info[0]
        msg.secondaryStateMode = state.secondary_state_info[1]
        msg.teamColor = own_team.team_color.intvalue
        msg.dropInTeam = state.drop_in_team
        msg.dropInTime = state.drop_in_time
        msg.penaltyShot = own_team.penalty_shot
        msg.singleShots = own_team.single_shots
        msg.coach_message = own_team.coach_message
        penalties = []
        red_cards = []
        for i in range(6):
            penalties.append(own_team.players[i].penalty != 0)
            red_cards.append(own_team.players[i].number_of_red_cards != 0)
        msg.teamMatesWithPenalty = penalties
        msg.teamMatesWithRedCard = red_cards
        self.state_publisher.publish(msg)

    def get_last_state(self):
        return self.state, self.time

    def get_time_since_last_package(self):
        return time.time() - self.time

    def stop(self):
        self.running = False

    def set_manual_penalty(self, flag):
        self.man_penalize = flag


if __name__ == '__main__':
    rec = GameStateReceiver()
    rec.receive_forever()
