#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
from movement_msgs.msg import OpencmResponseMsg, WalkingPositionsMsg, OpencmRequestMsg
from std_msgs.msg import Bool

MOTOR_ROTATION_ORIENTATION = [-1,-1,1,1,1,-1,-1,1,-1,-1,-1,1]
MOTORS_ZERO = [2060, 1919, 1959, 2016, 2075, 2048, 2152, 2053, 2022, 2051, 2076, 2009]

class Conversion2OpenCm():

    def __init__(self):
        self.current_position = None
        
        rospy.Subscriber('opencm/response', OpencmResponseMsg, self.currentMotorsPositionCapture)
        rospy.Subscriber('/walk_creator/positions', WalkingPositionsMsg, self.newPositionRequest)
        rospy.Subscriber('/mov_bridge/is_motion_stopped', Bool, self.updateIsMotionStopped)
        self.pub_to_opencm = rospy.Publisher('opencm/request_move', OpencmRequestMsg, queue_size=1)
        self.pub_to_opencm_msg = OpencmRequestMsg()

        self.allow_pub = True

    def updateIsMotionStopped(self, msg):
        if msg.data:
            self.allow_pub = False
        else:
            self.allow_pub = True

    def currentMotorsPositionCapture(self, msg):
        self.current_position = msg.motors_position
    
    def newPositionRequest(self, msg):
        if self.allow_pub:
            request_position_in_motor_position = self.convertRad2MotorPosition(msg.positions)

            self.pub_to_opencm_msg.motors_position = list(self.current_position[:6]) + list(request_position_in_motor_position) + list(self.current_position[18:])

            self.pub_to_opencm_msg.motors_velocity = [20]*20

            self.pub_to_opencm.publish(self.pub_to_opencm_msg)

    def convertRad2MotorPosition(self, position_in_rad):

        position_in_motor_position = []

        for index, position in enumerate(position_in_rad):
            position *= MOTOR_ROTATION_ORIENTATION[index]
            position /= 0.0015
            position += MOTORS_ZERO[index]
            position_in_motor_position.append(int(position))
        
        return position_in_motor_position

if __name__ == "__main__":
    rospy.init_node('Conversion_to_opencm_node', anonymous=False)

    conversion = Conversion2OpenCm()

    rospy.spin()