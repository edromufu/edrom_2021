#!/usr/bin/env python3
#coding=utf-8

import rospy
from controller import Supervisor

#Importações para os tópicos do ROS
from modularized_bhv_msgs.srv import headReqSrv, headReqSrvResponse #Srv associado ao service utilizado para requisitar movimento dos motores da cabeça ao movimento
from modularized_bhv_msgs.msg import simMovMsg #Mensagem associada ao tópico utilizado para receber info dos motores

#Limites relacionados aos motores da cabeça em radianos
hor_increment = (1.7+1.7)/10 #Valores de incremento obtidos através do step
ver_increment = (2.272-0.212)/10 #dos motores do pescoço na neck_interpreter.py

#Setando a grafia correta das requisições para a cabeça
RIGHT = 'Right'
LEFT = 'Left'
UP = 'Up'
DOWN = 'Down'

class BhvIndependentSim(object):
    
    def __init__(self):
        """
        Construtor:
        - Faz a chamada de funções para definir as variáveis de node, field e ros de cada componente da simulação:
            -> Motores da cabeça;
            -> Acelerômetro;
            -> Câmera;
            -> Movimentação 3D da robô.
        """
        self.general_supervisor = Supervisor()
        
        self.init_head()
        self.init_accel()

    def start(self):
        while self.general_supervisor.step(32) != -1 and not rospy.is_shutdown():
            self.motorUpdate()

    #Função chamada pelo construtor para habilitação de todos recursos da cabeça
    def init_head(self):
        """
        -> Funcao:
        Inicializar todos as variáveis necessárias para manipulação dos motores da cabeça, atraves de:
            - Capturar os nodes de Transform de cada motor;
            - Capturar seus campos de rotação;
            - Iniciar as variáveis que indica as posições dos motores da cabeça;
            - Inicializa as variáveis do ROS para requisição de movimento e publicação da posição dos motores.
        """
        sim_horizontal_head_motor_node = self.general_supervisor.getFromDef('HorizontalMotor')
        sim_vertical_head_motor_node = self.general_supervisor.getFromDef('VerticalMotor')

        self.sim_hor_head_motor = sim_horizontal_head_motor_node.getField('rotation')
        self.sim_ver_head_motor = sim_vertical_head_motor_node.getField('rotation')

        self.hor_head_pos = self.sim_hor_head_motor.getSFRotation()[3]
        self.ver_head_pos = self.sim_ver_head_motor.getSFRotation()[3]

        rospy.Service('/bhv2mov_communicator/head_requisitions', headReqSrv, self.moveSimHead)
        self.response = response = headReqSrvResponse()

        self.head_pos_publisher = rospy.Publisher('/webots/motors', simMovMsg, queue_size=100)
        self.head_pos_msg = simMovMsg()

    #Função chamada pelo construtor para habilitação de todos recursos do acelerômetro
    def init_accel(self):
        pass

    #Função chamada no loop para publicar continuamente a posição atual dos motores da cabeça
    def motorUpdate(self):
        """
        -> Funcao:
        Publicar via ROS a posição dos motores da cabeça, atraves de:
            - Capturar a posição no momento através do campo da rotação dos motores;
            - Criar um vetor que armazena a posição como mensagem;
            - Publicar esta mensagem.
        """
        self.hor_head_pos = self.sim_hor_head_motor.getSFRotation()[3]
        self.ver_head_pos = self.sim_ver_head_motor.getSFRotation()[3]

        self.head_pos_msg.positions = [self.hor_head_pos,self.ver_head_pos]

        self.head_pos_publisher.publish(self.head_pos_msg)

    #Função responsável pela movimentação da cabeça de acordo com as requisições
    def moveSimHead(self, request):
        """
        -> Funcao:
        Alterar o campo de rotação dos nodes da cabeça para simular o movimento do pescoço, atraves de:
            - Verificar a requisição de direção do movimento para determinar o sentido de rotação;
            - Verificar a requisição de direção do movimento para determinar o motor a ser utilizado;
            - Construir o novo vetor de rotação, atraves de campos já existentes e um incremento no último index;
            - Enviar a nova rotação ao simulador.
        """
        direction = request.headRequest

        if direction == RIGHT or direction == UP:
            increment = 1
        elif direction == LEFT or direction == DOWN:
            increment = -1

        if direction == RIGHT or direction == LEFT:
            increment *= hor_increment
            rotation = self.sim_hor_head_motor.getSFRotation()[:3]+[self.hor_head_pos+increment]
            self.sim_hor_head_motor.setSFRotation(rotation)
        elif direction == UP or direction == DOWN:
            increment *= ver_increment
            rotation = self.sim_ver_head_motor.getSFRotation()[:3]+[self.ver_head_pos+increment]
            self.sim_ver_head_motor.setSFRotation(rotation)
        
        self.response.success = True
        return self.response
    
if __name__ == '__main__':
    rospy.init_node('Bhv_independent_simulator_node', anonymous=False)
    simulator = BhvIndependentSim()

    simulator.start()
    rospy.spin()



    
