#!/usr/bin/env python3
#coding=utf-8

import rospy
from modularized_bhv_msgs.srv import headReqSrv #Srv associado ao service utilizado para requisitar movimento dos motores da cabeça ao movimento
from modularized_bhv_msgs.msg import simMovMsg as motorMsg  #Mensagem associada ao tópico utilizado para receber info dos motores

headBhvReqServer = '/bhv2mov_communicator/head_requisitions' #String do topico associado as requisicoes sobre a cabeca do bhv para o movimento

#Limites relacionados aos motores da cabeça em radianos
[lookRightLimit, lookLeftLimit] = [-1.7,1.7] #Intervalos extremos 
[lookDownLimit, lookUpLimit] = [-1.36,0.7]  #dos motores do pescoço
ifBallCenteredKickable = -0.97 #Parâmetro que descreve angulação mínima da cabeça na vertical para que, caso a bola esteja centralizada, o chute irá bem

#Parametros da configuração do tópico das posições dos motores
simMov2BhvTopic = '/webots/motors' #String do topico associado as infos dos motores, de onde sera tirada a posicao do pescoco
[indexHorPosition, indexVerPosition] = [0,1] #Index da posição da informação dos motores no vetor

#Parametros de variacao "por step" da cabeça
[horizontalStepsNumber,verticalStepsNumber] = [10,10] #Dita o quão divisível é o range dos motores
deltaX = abs((lookRightLimit - lookLeftLimit)/horizontalStepsNumber) #Valor em radianos da variação de 1 step no motor horizontal
deltaY = abs((lookDownLimit-lookUpLimit)/verticalStepsNumber) #Valor em radianos da variação de 1 step no motor vertical

class NeckInterpreter():

    def __init__(self):
        """
        Construtor:
        - Define as variaveis do ROS
        - Define e inicializa variaveis do código
        """

        #Variaveis do ROS
        rospy.Subscriber(simMov2BhvTopic, motorMsg, self.callback_positions)
        rospy.Service(headBhvReqServer, headReqSrv, self.server_head_reqs)

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

        return self.horLimitAccomplished, self.verLimitAccomplished, self.verAngleAccomplished, self.horMotorPosition
    
    #Callback do tópico de infos dos motores da cabeça do ROS
    def callback_positions(self, msg):
        """
        -> Funcao:
        Repassar os valores dos motores da cabeça da robô para as variáveis de código 
        acessando os valores recebidos no tópico e verificar dinamicamente se o motor
        vertical atingiu o estabelecido como "bom chute"
        -> Input:
            - msg: Variavel associada a mensagem recebida no topico do ROS, contem as
            informacoes dos motores horizontal e vertical da cabeça   
        """

        #Captura das informações dos motores de forma mais customizável possível, no máximo será preciso mudar o nome do
        #campo da mensagem
        self.horMotorPosition = msg.positions[indexHorPosition]
        self.verMotorPosition = msg.positions[indexVerPosition]

        #Avaliação se a cabeça verticalmente está boa para chute
        if(self.verMotorPosition < ifBallCenteredKickable):
            self.verAngleAccomplished = True
    
    #Callback do tópico de requisições de movimentos da cabeça para o movimento
    def server_head_reqs(self, req):
        """
        -> Funcao:
        Analisar se os movimentos do pescoco são possíveis para uma dada request é possível através de:
            - Atribuir um valor a um delta para as duas direções (x e y) dependendo do request
            - Verificar se a soma da posicao atual com o delta ultrapassa algum limite
        -> Input:
            - msg: Variavel associada a mensagem recebida no topico do ROS, contem as
            informacoes dos motores horizontal e vertical da cabeça   
        """        
        
        #Inicialização das variaveis internas da funcao
        deltaXInner = 0
        deltaYInner = 0

        ############################################VERIFICAÇÃO HORIZONTAL############################################
        #Atribuição aos possíveis request que causam 
        #variação plausível de chegar no limite
        if(msg.headRequest == 'Left'):
            deltaXInner = deltaX
        elif(msg.headRequest == 'Right'):
            deltaXInner = -deltaX
        
        #Cálculo para saber se passou do limite na horizontal
        if(self.horMotorPosition + deltaXInner > lookLeftLimit or self.horMotorPosition + deltaXInner < lookRightLimit):
            self.horLimitAccomplished = True

        ############################################VERIFICAÇÃO VERTICAL############################################
        #Atribuição aos possíveis request que causam 
        #variação plausível de chegar no limite
        if(msg.headRequest == 'Up'):
            deltaYInner = deltaY
        elif(msg.headRequest == 'Down'):
            deltaYInner = -deltaY
        
        if(self.verMotorPosition + deltaYInner > lookUpLimit or self.verMotorPosition + deltaYInner < lookDownLimit):
            self.verLimitAccomplished = True