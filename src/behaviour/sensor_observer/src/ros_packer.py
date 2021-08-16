#!/usr/bin/env python3
#coding=utf-8

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
            print(self.iBall.getValues())
            print(self.iFall.getValues())

if __name__ == '__main__':
    rospy.init_node('ROS_packer_node', anonymous=False)

    packer = RosPacker() #Inicia o agrupador
    packer.test()  #Inicia o loop do agrupador

    rospy.spin()