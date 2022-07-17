#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
from movement_msgs.msg import WalkingPositionsMsg, WebotsRequestMsg

TIME_STEP = 0.64

class Conversion2Webots():

    def __init__(self):
        self.current_position = None
        
        rospy.Subscriber('/webots/feedback', WebotsRequestMsg, self.currentMotorsPositionCapture)
        rospy.Subscriber('/walk_creator/positions', WalkingPositionsMsg, self.newPositionRequest)
        self.pub_to_webots = rospy.Publisher('webots/request_move', WebotsRequestMsg, queue_size=1)
        self.pub_to_webots_msg = WebotsRequestMsg()

    def currentMotorsPositionCapture(self, msg):
        self.current_position = msg.motors_position

    def newPositionRequest(self, msg):
        self.pub_to_webots_msg.motors_position = self.current_position[:6] + msg.positions + self.current_position[18:]
        
        self.pub_to_webots_msg.motors_velocity = self.calculateNewVelocity(self.current_position,self.pub_to_webots_msg.motors_position)

        self.pub_to_webots.publish(self.pub_to_webots_msg)

    def calculateNewVelocity(self, current_position, new_position):
        velocities = []

        for index, new_pos in enumerate(new_position):
            velocities.append(abs((new_pos-current_position[index])/TIME_STEP))
        
        return velocities

if __name__ == "__main__":
    rospy.init_node('Conversion_to_webots_node', anonymous=False)

    conversion = Conversion2Webots()

    rospy.spin()