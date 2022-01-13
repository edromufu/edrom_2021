#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy

from movement_msgs.srv import BehRequestSrv, BehRequestSrvResponse



class MovementCommunication():

    def __init__(self):
        
        # Inicialização do service, no primeiro campo cria o service, no segundo coloca o nome do srv que utilizaremos
        
        rospy.Service('/movement/behaviourReceiver/commands2movement', BehRequestSrv, self.check_existence)
        
        # Variavel que armazena a resposta do service
        
        self.srv_comunication_beh = BehRequestSrvResponse()
        

    def check_existence(self, requisition):
        
        print(requisition)

        return self.srv_comunication_beh

if __name__ == "__main__":
    rospy.init_node('Movement_node', anonymous=False)
    movement = MovementCommunication()
    rospy.spin()