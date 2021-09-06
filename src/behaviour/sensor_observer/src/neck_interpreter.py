#!/usr/bin/env python3
#coding=utf-8

import rospy
from std_msgs.msg import String 
from behaviour_msgs.msg import simMovMsg as motorMsg  #Mensagem associada ao tópico utilizado para receber info dos motores

headBhvReqTopic = '/bhv2mov_communicator/head_requisitions' #String do topico associado as requisicoes sobre a cabeca do bhv para o movimento

#Limites relacionados aos motores da cabeça em radianos
[lookRightLimit, lookLeftLimit] = [-1.7,1.7] #Intervalos extremos 
[lookDownLimit, lookUpLimit] = [-1.36,0.7]  #dos motores do pescoço
ifBallCenteredKickable = -0.97 #Parâmetro que descreve angulação mínima da cabeça na vertical para que, caso a bola esteja centralizada, o chute irá bem

#Parametros da configuração do tópico das posições dos motores
simMov2BhvTopic = '/webots/motors' #String do topico associado as infos dos motores, de onde sera tirada a posicao do pescoco
[indexHorPosition, indexVerPosition] = [0,1] #Index da posição da informação dos motores no vetor

class NeckInterpreter():

    def __init__(self):
        """
        Construtor:
        - Define as variaveis do ROS
        - Define e inicializa variaveis do código
        """

        #Variaveis do ROS
        rospy.Subscriber(simMov2BhvTopic, motorMsg, self.callback_positions)
        rospy.Subscriber(headBhvReqTopic, String, self.callback_head_reqs)

        #Variaveis de código
        self.horLimitAccomplished = False
        self.verLimitAccomplished = False
        self.verAngleAccomplished = False

        self.verMotorPosition = 0
        self.horMotorPosition = 0

    #Funcao chamada pelo agrupador ROS quando necessitar saber 
    #a interpretacao dos motores da cabeça para alguma requisicao
    def getValues(self):
        """
        -> Output:
            - horLimitAccomplished: Informa se o limite do motor, para a requisicao atual, foi atingido horizontalmente
            - verLimitAccomplished: Informa se o limite do motor, para a requisicao atual, foi atingido verticalmente
            - verAngleAccomplished: Informa se a cabeca esta suficientemente rotacionada verticalmente para um bom chute
            - horAngleValue: Valor atual de medicao do motor horizontal da cabeca em relacao a referencia
        """

        return self.horLimitAccomplished, self.verLimitAccomplished, self.verAngleAccomplished, self.horAngleValue
    
    #Callback do tópico de infos dos motores da cabeça do ROS
    def callback_positions(self, msg):
        """
        -> Funcao:
        Repassar os valores dos motores da cabeça da robô para o variáveis de código 
        acessando os valores recebidos no tópico
        -> Input:
            - msg: Variavel associada a mensagem recebida no topico do ROS, contem as
            informacoes dos motores horizontal e vertical da cabeça   
        """

        #Captura das informações dos motores de forma mais customizável possível, no máximo será preciso mudar o nome do
        #campo da mensagem
        self.horMotorPosition = msg.positions[indexHorPosition]
        self.verMotorPosition = msg.positions[indexVerPosition]
    
    #Callback do tópico de requisições de movimentos da cabeça para o movimento
    def callback_head_reqs(self, msg):
        """
        -> Funcao:
        Analisar se os movimentos do pescoco são possíveis, capturar dados numéricos da cabeça e avaliar se as condições da
        cabeça estão boas para o chute atraves de:
            -
            -  
            -
        -> Input:
            - msg: Variavel associada a mensagem recebida no topico do ROS, contem as
            informacoes dos motores horizontal e vertical da cabeça   
        """        

        if(msg.data == 'Left'):
            deltaXPos = 0.15
        elif(msg.data == 'Right'):
            deltaXPos = -0.15
        
        if(self.horMotorPosition + deltaPos > lookLeftLimit or self.horMotorPosition - deltaPos < lookRightLimit):
            self.horLimitAccomplished = True