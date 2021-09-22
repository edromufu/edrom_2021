#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy

from movement_msgs.srv import behaviourReceiver
import Periclao

class MovementCommunication():

    def __init__(self):
        
        # Inicialização do service, no primeiro campo cria o service, no segundo coloca o nome do srv que utilizaremos
        
        rospy.Service('/movement/behaviourReceiver/commands2movement', behaviourReceiver, self.verificar_existencia)
        
        # Variavel que armazena a resposta do service
        
        self.SrvComunication2Beh = behaviourReceiverResponse()
        self.PericlaoBrabo = Periclao()
    def verificar_existencia(self, requisition):

        
        if (self.PericlaoBrabo.existe_comando(requisition.description)):
            self.SrvComunication2Beh.response = True
            BrenaoFunction(requisition.description)

        else:
            self.SrvComunication2Beh.response = False
            rospy.loginfo("Não existe o comando "+requisition.description)

        return self.SrvComunication

if __name__ == '__main__':
    rospy.init_node('Movement_node', anonymous=False)
    movement = Movement()
    rospy.spin()