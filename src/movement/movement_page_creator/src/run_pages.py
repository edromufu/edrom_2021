#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy, os

from movement_msgs.msg import OpencmRequestMsg
from std_msgs.msg import String

class PageRun():

    def __init__(self):
        
        self.pub_to_opencm = rospy.Publisher('opencm/request_move', OpencmRequestMsg, queue_size=10)
        self.pub_to_opencm_msg = OpencmRequestMsg()
        self.pub_to_opencm_msg.motors_velocity = [20]*20

        rospy.Subscriber('/approved_movement_prep/run_pages', String, self.newPageRequest)
        
        self.current_page_running = [] 
        self.rate = rospy.Rate(20)

    def newPageRequest(self, msg):
        try:
            with open(os.getenv('HOME')+'/edrom/src/movement/movement_utils/pages/'+msg.data+'.txt', 'r') as file:
                file_lines = file.read().split('\n')

            # Iterando até penúltimo elemento pois último elemento é vazio
            for line in file_lines[:-1]:
                row = (line.split(' '))
                row = [int(coordinate) for coordinate in row]

                self.current_page_running.append(row)
            
            self.sendPageMovement(self)
        except Exception as e:
            print(e)
        
    def sendPageMovement(self):
        for pose in self.current_page_running:
            self.pub_to_opencm_msg.motors_position = pose
            self.pub_to_opencm.publish(self.pub_to_opencm_msg)

            self.rate.sleep()
        
        self.current_page_running = [] 

if __name__ == "__main__":
    rospy.init_node('Page_run_node', anonymous=False)

    page_runner = PageRun()

    rospy.spin()
    #page_runner.start()