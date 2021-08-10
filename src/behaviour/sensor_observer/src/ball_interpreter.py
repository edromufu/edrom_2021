#!/usr/bin/env python3
#coding=utf-8

from vision_msgs.msg import Ball

vision2BhvTopic = '/webots_natasha/vision_inference/ball' #String do topico associado as infos da bola da visao
firstSearch = 'Left' #Sentido preferencial de busca com o corpo

#Parametros de configuracao da camera e seus quadrantes
[cameraWidth, cameraHeight] = [416, 416]
[xCenterLeftLimit, xCenterRightLimit] = [cameraWidth/4, 3*cameraWidth/4]
[yCenterBottomLimit, yCenterTopLimit] = [2*cameraHeight/3, cameraHeight/3]

[close_width, close_height] = [75, 75] #Parametro de definicao da proximidade da bola
timesSecurity = 7 #Numero de vezes para verificacoes de seguranca no codigo

class BallInterpreter():

    def __init__(self):
        """
        Construtor:
        - Define as variaveis do ROS
        - Define e inicializa variaveis do código
        """    

        #Variaveis do ROS
        rospy.Subscriber(vision2BhvTopic, Ball, self.callback_vision)

        #Variaveis de código
        self.ballRelativePosition = firstSearch
        self.ballClose = False
        self.ballFound = False
        self.countDistance = 0
        self.countFound = 0

    #Funcao chamada pelo agrupador ROS quando necessitar saber 
    #as interpretacoes da bola para alguma requisicao
    def getValues(self):
        """
        -> Output:
            - ballRelativePosition: Ultima posicao relativa da bola interpretada
            - ballClose: Interpretacao da proximidade da bola
            - ballFound: Se False, bola perdida ha muito tempo
        """
        return self.ballRelativePosition, self.ballClose, self.ballFound    

    #Callback do tópico de infos da bola do ROS
    def callback_vision(self, msg):    
        """
        -> Funcao:
        Avaliar a bola atraves de:
            - Recebe os dados da bola da visao no msg
            - Interpreta o x e y retornando a posicao relativa da bola
            - Interpreta o width e height retornando a proximidade da bola
            - Realiza resets das variaveis booelanas baseado em contador
            * Os dados só são interpretados, ou seja, a posicao relativa só é atualizada
            * se a bola estiver sendo encontrada (para ter uma especie de 'visto por ultimo')  
        -> Input:
            - msg: Variavel associada a mensagem recebida no topico do ROS, contem as
            informacoes da bola    
        """

        #Contador para informar que a bola foi perdida apos um numero de vezes sem encontra-la
        self.countFound += 1
        if(self.countFound > timesSecurity):
            self.ballFound = False

        if(msg.found):
            #Reseta o contador de informar que a bola foi perdida, pois encontrou :)
            self.ballFound = True
            self.countFound = 0

            #Módulo de verificacao da proximidade da bola, serve para resetar
            #a interpretacao apenas apos um numero definido de medidas desfavoraveis
            if(msg.roi_width*msg.roi_height < close_width*close_height):
                self.countDistance += 1
                if(self.countDistance > timesSecurity):
                    self.ballClose = False
            else:
                self.countDistance = 0
                self.ballClose = True

            #Módulo de verificacao da posicao relativa da bola
            #Casos não centralizado
            if(msg.x < xCenterLeftLimit):
                analysis = 'Left'
            elif(msg.x > xCenterRightLimit):
                analysis = 'Right' 
            #Casos centralizados horizontalmente, mas nao verticalmente
            elif(msg.y > yCenterBottomLimit): #Deve ser maior por conta da referencia do Yolo
                analysis = 'Bottom'
            elif(msg.y < yCenterTopLimit):
                analysis = 'Top'
            else:
                analysis = 'Center'

            self.ballRelativePosition = analysis

    