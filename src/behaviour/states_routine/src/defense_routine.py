#!/usr/bin/env python3
#coding=utf-8

import rospy
from modularized_bhv_msgs.msg import currentStateMsg, stateMachineMsg
from movement_msgs.msg import OpencmRequestMsg

LEFT_POS = [0,0,1830,486,0,0,1837,2171,1700,2020,1828,2619,2292,1384,1794,2010,2019,3367,0,0]
LEFT_VEL = [30]*6 +[70]*14
RIGHT_POS = [0,0,3786,2337,0,0,1699,1982,1860,2113,1275,2383,3113,1796,2118,2307,2289,3454,0,0]
RIGHT_VEL = [30]*6 +[70]*14

class DefenseRoutine():

    def __init__(self):

        rospy.Subscriber('/transitions_and_states/state_machine', currentStateMsg, self.flagUpdate)
        rospy.Subscriber('/sensor_observer/state_machine_vars', stateMachineMsg, self.varsUpdate)

        self.flag = False

        self.movement_request_topic = rospy.Publisher('opencm/request_move', OpencmRequestMsg, queue_size=10)
        self.request = OpencmRequestMsg()
        
        while not rospy.is_shutdown():   

            if self.flag:
                self.flag = False
                if 'Left' in self.current_ball_position:
                    self.request.motors_position = LEFT_POS
                    self.request.motors_velocity = LEFT_VEL
                elif 'Right' in self.current_ball_position:
                    self.request.motors_position = RIGHT_POS
                    self.request.motors_velocity = RIGHT_VEL

                self.movement_request_topic.publish(self.request)

    def flagUpdate(self, msg):
        if msg.currentState == 'defense':
            self.flag = True
        else:
            self.flag = False

    def varsUpdate(self, msg):
        self.current_ball_position = msg.ballRelativePosition
        
if __name__ == '__main__':
    rospy.init_node('Defense_node', anonymous=False)

    routine = DefenseRoutine()
    rospy.spin()
