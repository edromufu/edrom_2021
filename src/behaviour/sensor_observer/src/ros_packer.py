#!/usr/bin/env python3
#coding=utf-8

import rospy, time
import fall_interpreter, ball_interpreter

class RosPacker():

    def __init__(self):
        """
        Construtor:
        - Inicializa os objeto dos interpretadores
        """

        #Inicialização dos interpretadores em variaveis deste objeto
        self.iBall = ball_interpreter.BallInterpreter()
        self.iFall = fall_interpreter.FallInterpreter()
    
    #Loopa e printa as interpretacoes
    def test(self):

        while not rospy.is_shutdown():
            print("----------------------------")
            print("Posicao da bola: ", self.iBall.getValues()[0])
            print("Encontrada: ", self.iBall.getValues()[2], "   | Bola proxima: ", self.iBall.getValues()[1])
            print("Posicao de robo (queda): ", self.iFall.getValues())
            print("----------------------------")
            time.sleep(0.2)

if __name__ == '__main__':
    rospy.init_node('ROS_packer_node', anonymous=False)

    packer = RosPacker() #Inicia o agrupador
    packer.test()  #Inicia o loop do agrupador

    rospy.spin()