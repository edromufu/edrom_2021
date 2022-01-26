#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import rospy
import sys
import os
from movement_msgs.srv import BehRequestSrv, BehRequestSrvResponse
user_name = os.environ.get("HOME")
sys.path.append(user_name + "/edrom_2021/src/movement/behaviourRecives/include")

import statsManipulator



class MovementCommunication():

    def __init__(self):
        self.test = statsManipulator.StatsManipulator()
        rospy.Service('/movement/behaviourReceiver/commands2movement', BehRequestSrv, self.checkExistence)      
        self.srv_comunication_beh = BehRequestSrvResponse()
        

    def checkExistence(self, requisition):
        check_movement = self.test.isMovementListed(requisition.required_movement)
        print("O movimento solicitado existe:",check_movement)
        self.srv_comunication_beh.response = check_movement
        return self.srv_comunication_beh

if __name__ == "__main__":
    rospy.init_node('Movement_node', anonymous=False)
    movement = MovementCommunication()
    rospy.spin()