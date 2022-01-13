#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
from movement_msgs.srv import *
from behaviour_msgs.srv import *

class MovementCommunication():

    def __init__(self):
        
        rospy.Service('nomeService', tipoService, self.receber_string)

        self.SrvComunication = tipoServiceResponse()

    def receber_string(self, acao):

        print(acao)
        
        self.SrvComunication.sucess = True

        # Retorna a resposta do serviço
        
        return self.SrvComunication

if __name__ == '__main__':
    rospy.init_node('Movement_node', anonymous=False)
    movement = MovementCommunication()
    rospy.spin()