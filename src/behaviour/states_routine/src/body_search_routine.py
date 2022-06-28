#!/usr/bin/env python3
#coding=utf-8

import rospy
from modularized_bhv_msgs.msg import currentStateMsg, stateMachineMsg
from modularized_bhv_msgs.srv import moveRequest

#Setando a grafia correta das requisições para movimento de caminhada
CLOCKWISE = 'rotate_clockwise'
COUNTER_CLOCKWISE = 'rotate_counter_clockwise'

class BodySearchRoutine():

    def __init__(self):
        
        self.move_request = rospy.ServiceProxy('/bhv2mov_communicator/3D_move_requisitions', moveRequest)
        rospy.Subscriber('/transitions_and_states/state_machine', currentStateMsg, self.flagUpdate)
        rospy.Subscriber('/sensor_observer/state_machine_vars', stateMachineMsg, self.varsUpdate)

        self.flag = False
        self.current_ball_position = 'Left'

        while not rospy.is_shutdown():
            self.createRequest()
    
    def flagUpdate(self, msg):
        if msg.currentState == 'body_search':
            self.flag = True
        else:
            self.flag = False

    def varsUpdate(self, msg):
        self.current_ball_position = msg.ballRelativePosition
        
    def createRequest(self):

        if 'Left' in self.current_ball_position:
            request = COUNTER_CLOCKWISE
        elif 'Right' in self.current_ball_position:
            request = CLOCKWISE
        else:
            request = None

        if self.flag:
            self.move_request(request)


if __name__ == '__main__':
    rospy.init_node('Body_search_node', anonymous=False)

    routine = BodySearchRoutine()
    rospy.spin()