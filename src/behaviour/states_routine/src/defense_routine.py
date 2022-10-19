#!/usr/bin/env python3
#coding=utf-8

import rospy
from modularized_bhv_msgs.msg import currentStateMsg, stateMachineMsg
from movement_msgs.msg import ApprovedMovementMsg
LEFT = 'Left'
RIGHT = 'Right'

class DefenseRoutine():

    def __init__(self):

        rospy.Subscriber('/transitions_and_states/state_machine', currentStateMsg, self.flagUpdate)
        rospy.Subscriber('/sensor_observer/state_machine_vars', stateMachineMsg, self.varsUpdate)

        self.flag = False
        self.request= ApprovedMovementMsg()
        self.request=None
        self.last_decision=None
        self.movement_request_topic = rospy.Publisher('/movement/approved_movement', ApprovedMovementMsg, queue_size=10)

        while not rospy.is_shutdown():            
            if self.last_decision != self.request:
                self.last_decision = self.request
                self.movement_request_topic.publish(self.request)

    def flagUpdate(self, msg):
        if msg.currentState == 'defense':
            self.flag = True
        else:
            self.flag = False

    def varsUpdate(self, msg):
        self.current_ball_position = msg.ballRelativePosition
        
    def createRequest(self):
        if self.flag:
            if 'Left' in self.current_ball_position:
                self.request = LEFT
            elif 'Right' in self.current_ball_position:
                self.request = RIGHT
        else:
            self.request = None


if __name__ == '__main__':
    rospy.init_node('Defense_node', anonymous=False)

    routine = DefenseRoutine()
    rospy.spin()
