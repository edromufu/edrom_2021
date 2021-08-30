#!/usr/bin/env python3
#coding=utf-8

import rospy
from std_msgs.msg import String
from behaviour_msgs.msg import simMovMsg

simMov2BhvTopic = '/webots/motors' #String do topico associado as infos dos motores, de onde sera tirada a posicao do pescoco
headBhvReqTopic = '/bhv2mov_communicator/head_requisitions' #String do topico associado as requisicoes sobre a cabeca do bhv para o movimento

class NeckInterpreter():

    def __init__(self):
        """
        Construtor:
        - Define as variaveis do ROS
        - Define e inicializa variaveis do código
        """

        #Variaveis do ROS
        rospy.Subscriber(simMov2BhvTopic, simMovMsg, self.callback_positions)
        rospy.Subscriber(headBhvReqTopic, String, self.callback_vision)

        #Variaveis de código
        self.horLimitAccomplished = False
        self.verLimitAccomplished = False
        self.verAngleAccomplished = False

    def getValues(self):
        """
        -> Output:
            - horLimitAccomplished: Informa se o limite do motor, para a requisicao atual, foi atingido horizontalmente
            - verLimitAccomplished: Informa se o limite do motor, para a requisicao atual, foi atingido verticalmente
            - verAngleAccomplished: Informa se a cabeca esta suficientemente rotacionada verticalmente para um bom chute
            - horAngleValue: Valor atual de medicao do motor horizontal da cabeca em relacao a referencia
        """

        return self.horLimitAccomplished, self.verLimitAccomplished, self.verAngleAccomplished, self.horAngleValue