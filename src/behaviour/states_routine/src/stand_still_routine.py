#!/usr/bin/env python3
#coding=utf-8

import rospy
from modularized_bhv_msgs.msg import currentStateMsg
from movement_msgs.msg import OpencmRequestMsg

#Setando a grafia correta das requisições para movimento de caminhada
STAND_POS = [0,0,1823,2350,0,0,1714,1980,1876,2151,1139,2938,3178,1053,1924,2204,2245,3306,0,0]
STAND_VEL = [10]*20

class WalkingRoutine():

    def __init__(self):
        
        self.movement_request_topic = rospy.Publisher('opencm/request_move', OpencmRequestMsg, queue_size=10)
        self.request = OpencmRequestMsg()

        self.request.motors_position = STAND_POS
        self.request.motors_velocity = STAND_VEL

        rospy.Subscriber('/transitions_and_states/state_machine', currentStateMsg, self.flagUpdate)

        self.flag = False

        while not rospy.is_shutdown():

            if self.flag:
                self.flag = False
                self.movement_request_topic.publish(self.request)
    
    def flagUpdate(self, msg):
        message = msg.currentState

        if message == 'stand_still':
            self.flag = True
        else:
            self.flag = False
            

if __name__ == '__main__':
    rospy.init_node('Walking_node', anonymous=False)

    routine = WalkingRoutine()
    rospy.spin()