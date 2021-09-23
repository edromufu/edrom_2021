#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy

from movement_msgs.srv import behaviourReceiver
sys.path.append(os.path.abspath("../include"))
import interface4_checking

class MovementCommunication():

    def __init__(self):
        
        # Inicialização do service, no primeiro campo cria o service, no segundo coloca o nome do srv que utilizaremos
        
        rospy.Service('/movement/behaviourReceiver/commands2movement', behaviourReceiver, self.check_existence)
        
        # Variavel que armazena a resposta do service
        
        self.srv_comunication_beh = behaviourReceiverResponse()
        self.check = interface4_checking()

    def check_existence(self, requisition):
        
        if (self.check.existe_comando(requisition.description)):
            self.SrvComunication2Beh.response = True

        else:
            self.SrvComunication2Beh.response = False
            rospy.loginfo("Não existe o comando "+requisition.description)

        return self.SrvComunication

if __name__ == '__main__':
    rospy.init_node('Movement_node', anonymous=False)
    movement = Movement()
    rospy.spin()