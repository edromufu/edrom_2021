#!/usr/bin/env python3
#coding=utf-8

import rospy
from modularized_bhv_msgs.msg import currentStateMsg, stateMachineMsg
from modularized_bhv_msgs.srv import moveRequest

#Setando a grafia correta das requisições para a cabeça
RIGHT = 'head_to_right'
LEFT = 'head_to_left'
UP = 'head_to_up'
DOWN = 'head_to_down'


class SearchBallRoutine():

    def __init__(self):
        
        self.move_request = rospy.ServiceProxy('/bhv2mov_communicator/head_requisitions', moveRequest)
        rospy.Subscriber('/transitions_and_states/state_machine', currentStateMsg, self.flagUpdate)
        rospy.Subscriber('/sensor_observer/state_machine_vars', stateMachineMsg, self.varsUpdate)

        self.flag = False
        self.current_ball_position = 'Left'

        while not rospy.is_shutdown():
            self.createRequest()
    
    def flagUpdate(self, msg):
        if msg.currentState == 'search_ball':
            self.flag = True
        else:
            self.flag = False

    def varsUpdate(self, msg):
        self.current_ball_position = msg.ballRelativePosition
        
    def createRequest(self):

        if 'Left' in self.current_ball_position:
            request = LEFT
        elif 'Right' in self.current_ball_position:
            request = RIGHT
        elif 'Bottom' in self.current_ball_position:
            request = DOWN
        elif 'Top' in self.current_ball_position:
            request = UP
        else:
            request = None

        if self.flag:
            self.move_request(request)


if __name__ == '__main__':
    rospy.init_node('Search_ball_node', anonymous=False)

    routine = SearchBallRoutine()
    rospy.spin()