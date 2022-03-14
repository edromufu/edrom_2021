#!/usr/bin/env python3
#coding=utf-8

import rospy, time
import fall_interpreter, ball_interpreter, neck_interpreter

from modularized_bhv_msgs.msg import stateMachineMsg

class RosPacker():

    def __init__(self):
        """
        Construtor:
        - Inicializa os objeto dos interpretadores
        """

        #Inicialização dos interpretadores em variaveis deste objeto
        self.iBall = ball_interpreter.BallInterpreter()
        self.iFall = fall_interpreter.FallInterpreter()
        self.iNeck = neck_interpreter.NeckInterpreter()

        #Inicialização das variáveis do ROS
        self.pub2StateMachine = rospy.Publisher('/sensor_observer/state_machine_vars', stateMachineMsg)
        self.stateMachineVars = stateMachineMsg()

        #Variáveis de interpretação para facilitação do fluxo
        self.pBallPosition = self.iBall.getValues()[0]
        self.pBallClose = self.iBall.getValues()[1]
        self.pBallFound = self.iBall.getValues()[2]
        self.pFallState = self.iFall.getValues()
        self.pHeadKickCheck = self.iNeck.getValues()[1]
        self.pPossibleHeadMovs = self.iNeck.getValues()[0]
        self.pHorMotorOutOfCenter = self.iNeck.getValues()[2]
        self.pHorMotorPosition = self.iNeck.getValues()[3]

        self.smVarsLastValue = [self.pFallState,self.pBallFound,self.pBallClose,
                                self.pBallPosition,self.pHeadKickCheck,self.pPossibleHeadMovs, self.pHorMotorOutOfCenter]

        self.publish2StateMachine()
    
    #Loopa capturando as novas interpretações para o código
    def run(self):

        while not rospy.is_shutdown():
            self.runValuesUpdate()
            self.runMethodsCalls()

    def runValuesUpdate(self):
        self.pBallPosition = self.iBall.getValues()[0]
        self.pBallClose = self.iBall.getValues()[1]
        self.pBallFound = self.iBall.getValues()[2]
        self.pFallState = self.iFall.getValues()
        self.pHeadKickCheck = self.iNeck.getValues()[1]
        self.pPossibleHeadMovs = self.iNeck.getValues()[0]
        self.pHorMotorOutOfCenter = self.iNeck.getValues()[2]
        self.pHorMotorPosition = self.iNeck.getValues()[3]

    def runMethodsCalls(self):
        self.stateMachineFlagger([self.pFallState,self.pBallFound,self.pBallClose,
                                self.pBallPosition,self.pHeadKickCheck,self.pPossibleHeadMovs, self.pHorMotorOutOfCenter])

    def stateMachineFlagger(self,smVarsCurrentValue):
        if not smVarsCurrentValue == self.smVarsLastValue:
            self.smVarsLastValue = smVarsCurrentValue
            self.runPrints()
            self.publish2StateMachine()

    def publish2StateMachine(self):
        self.stateMachineVars.fallState = self.pFallState
        self.stateMachineVars.ballFound = self.pBallFound
        self.stateMachineVars.ballClose = self.pBallClose
        self.stateMachineVars.ballRelativePosition = self.pBallPosition
        self.stateMachineVars.verAngleAccomplished = self.pHeadKickCheck
        self.stateMachineVars.headPossibleMovements = self.pPossibleHeadMovs
        self.stateMachineVars.horMotorOutOfCenter = self.pHorMotorOutOfCenter

        self.pub2StateMachine.publish(self.stateMachineVars)
    
    def runPrints(self):
        print("----------------------------")
        print("Posicao da bola: ", self.pBallPosition)
        print("Encontrada: ", self.pBallFound, "   | Bola proxima: ", self.pBallClose)
        print("Posicao de robo (queda): ", self.pFallState)
        print("Movimentos disponíveis: ", self.pPossibleHeadMovs)
        print("Cabeca confirma o chute: ", self.pHeadKickCheck)
        print("Motor horizontal fora do centro: ", self.pHorMotorOutOfCenter)
        print("----------------------------")

if __name__ == '__main__':
    rospy.init_node('ROS_packer_node', anonymous=False)

    packer = RosPacker() #Inicia o agrupador
    packer.run()  #Inicia o loop do agrupador

    rospy.spin()