#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import sys
import os
from movement_msgs.srv import BehRequestSrv, BehRequestSrvResponse, ApprovedMovementSrv
user_name = os.environ.get("HOME")
sys.path.append(user_name + "/edrom/src/movement/mov_bridge/include")

import statsManipulator

class MovementCommunication():

    def __init__(self):
        self.manipulator = statsManipulator.StatsManipulator()     
        self.srv_comunication_beh = BehRequestSrvResponse()

        rospy.Service('/movement/mov_bridge/commands2movement', BehRequestSrv, self.requestMovement)
        self.client = rospy.ServiceProxy('/movement/approved_movement', ApprovedMovementSrv)
    
    def requestMovement(self, requisition):
        movement_exists = self.checkExistence(requisition.required_movement)

        print("\nO movimento solicitado existe:",movement_exists)

        if movement_exists:
            service_response = self.changeStatus(requisition.required_movement,requisition.required_status)
            
            if requisition.required_status:
                service_response = self.sendMovement(requisition.required_movement)
        else:
            service_response = False
            
        self.srv_comunication_beh.response = service_response
        return self.srv_comunication_beh

    def checkExistence(self, movement):

        return self.manipulator.isMovementListed(movement)

    def changeStatus(self,movement,status):

        return self.manipulator.changeMovementStatus(movement,status)
    
    def sendMovement(self, movement):
        rospy.wait_for_service('/movement/approved_movement')

        try:
            client_call = self.client(movement)

            return client_call.response

        except rospy.ServiceException as e:
            return False

        
if __name__ == "__main__":
    rospy.init_node('Movement_bridge_node', anonymous=False)

    movement = MovementCommunication()

    rospy.spin()