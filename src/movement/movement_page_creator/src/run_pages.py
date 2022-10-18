#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy, os

from movement_msgs.msg import OpencmRequestMsg, OpencmResponseMsg
from movement_msgs.srv import CommandToOpenCMSrv
from std_msgs.msg import String

MOTOR_OFFSET = 50

class PageRun():

    def __init__(self):
        
        self.pub_to_opencm = rospy.Publisher('opencm/request_move', OpencmRequestMsg, queue_size=10)
        self.pub_to_opencm_msg = OpencmRequestMsg()
        self.pub_to_opencm_msg.motors_velocity = [10]*20

        self.client_request_response = rospy.ServiceProxy('opencm/request_command', CommandToOpenCMSrv)

        rospy.Subscriber('opencm/response', OpencmResponseMsg, self.opencmResponse)        
        rospy.Subscriber('/approved_movement_prep/run_pages', String, self.newPageRequest)
        
        self.current_page_running = [] 
        self.rate = rospy.Rate(10)

    def newPageRequest(self, msg):
        try:
            with open(os.getenv('HOME')+'/edrom/src/movement/movement_utils/pages/'+msg.data+'.txt', 'r') as file:
                file_lines = file.read().split('\n')

            # Iterando até penúltimo elemento pois último elemento é vazio
            for line in file_lines[:-1]:
                row = (line.split(' '))
                row = [int(coordinate) for coordinate in row]

                self.current_page_running.append(row)
            
            self.sendPageMovement()
        except Exception as e:
            print(e)
        
    def sendPageMovement(self):
        for pose in self.current_page_running:
            self.pub_to_opencm_msg.motors_position = pose
            self.pub_to_opencm.publish(self.pub_to_opencm_msg)
            self.checkGoalPosition()
        
        self.current_page_running = [] 
    
    def opencmResponse(self, msg):
        self.current_position = msg.motors_position

    def checkGoalPosition(self):

        still_moving = True

        while(still_moving):
            still_moving = False
            print(f'________ Chamando feedback _________')
            self.client_request_response('feedback')
            print(f'________ Após chamada de feedback _________')
            self.rate.sleep()

            for index in range(20):
                if(not (self.pub_to_opencm_msg.motors_position[index] - MOTOR_OFFSET <= self.current_position[index] <= self.pub_to_opencm_msg.motors_position[index] + MOTOR_OFFSET)):
                    still_moving = True
                    print(f'Motor {index} tentando chegar na posição {self.pub_to_opencm_msg.motors_position[index]}, está em {self.current_position[index]}.')
                    break
        print(f'________ O movimento da Page terminou _________')
            
            

if __name__ == "__main__":
    rospy.init_node('Page_run_node', anonymous=False)

    page_runner = PageRun()

    rospy.spin()
    #page_runner.start()