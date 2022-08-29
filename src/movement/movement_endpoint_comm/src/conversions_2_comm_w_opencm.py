#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
from movement_msgs.msgs import OpencmResponseMsg, WalkingPositionsMsg, OpencmRequestMsg

class Conversion2OpenCm():

    def __init__(self):
        self.current_position = None
        
        rospy.Subscriber('opencm/response', OpencmResponseMsg, self.currentMotorsPositionCapture)
        rospy.Subscriber('/walk_creator/positions', WalkingPositionsMsg, self.newPositionRequest)
        self.pub_to_opencm = rospy.Publisher('opencm/request_move', OpencmRequestMsg, queue_size=1)
        self.pub_to_opencm_msg = OpencmRequestMsg()

    def currentMotorsPositionCapture(self, msg):
        self.current_position = msg.motors_position
    
    def newPositionRequest(self, msg):
        request_position_in_rad = msg.positions

        self.pub_to_opencm_msg.motors_position = self.convertRad2MotorPosition(request_position_in_rad)
        
        self.pub_to_opencm_msg.motors_velocity = self.calculateNewVelocity(self.current_position,self.pub_to_opencm_msg.motors_position)

    def convertRad2MotorPosition(self, position_in_rad):

        position_in_motor_position = []
        

        return position_in_motor_position

if __name__ == "__main__":
    rospy.init_node('Conversion_to_opencm_node', anonymous=False)

    conversion = Conversion2OpenCm()

    rospy.spin()