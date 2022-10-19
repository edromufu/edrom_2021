#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
from movement_msgs.msg import OpencmResponseMsg, WalkingPositionsMsg, OpencmRequestMsg
from movement_msgs.srv import CommandToOpenCMSrv

MOTOR_ROTATION_ORIENTATION = [-1,-1,1,1,1,-1,-1,1,-1,-1,-1,1]
MOTORS_ZERO = [2081, 2080, 2249, 2065, 2093, 2069, 2215, 2110, 2026, 2078, 2018, 2029]

class Conversion2OpenCm():

    def __init__(self):
        self.current_position = [3246, 3569, 1964, 2136, 977, 2987] + MOTORS_ZERO + [0, 0]

        rospy.wait_for_service('opencm/request_command')
        self.client_to_request_opencm_command = rospy.ServiceProxy('opencm/request_command', CommandToOpenCMSrv)

        rospy.Subscriber('opencm/response', OpencmResponseMsg, self.currentMotorsPositionCapture)
        rospy.Subscriber('/walk_creator/positions', WalkingPositionsMsg, self.newPositionRequest)

        self.pub_to_opencm = rospy.Publisher('opencm/request_move', OpencmRequestMsg, queue_size=10)
        self.pub_to_opencm_msg = OpencmRequestMsg()

    def currentMotorsPositionCapture(self, msg):
        self.current_position = list(msg.motors_position)

    def newPositionRequest(self, msg):

        request_position_in_motor_position = self.convertRad2MotorPosition(msg.positions)

        self.pub_to_opencm_msg.motors_position = self.current_position[:6] + list(request_position_in_motor_position) + self.current_position[18:]
        
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