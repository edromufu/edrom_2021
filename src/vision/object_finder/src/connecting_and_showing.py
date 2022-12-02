#!/usr/bin/env python3
# coding=utf-8

#import rospy
#from sensor_msgs.msg import Image as ROS_Image

import cv2
import running_inference as ri
#from vision_msgs.msg import Ball

videoInput = "/dev/video0" # É de onde vai pegar as imagens, "/dev/video2" é pegando por um dos usbs (o numero muda) e 0 é a webcam
width = 416 # Largura da imagem (conferir no vídeo)
height = 416 # Altura da imagem (Conferir no vídeo)

'''import cProfile, pstats, io
from pstats import SortKey
pr = cProfile.Profile()
pr.enable()
'''

class Node():
        #Init
    def __init__(self,nome_no):

        #Iniciando o nó e obtendo os arquivos que definem a rede neural

        self.net = ri.get_cnn_files()
        self.net.setPreferableBackend(cv2.dnn.DNN_BACKEND_CUDA)
        self.net.setPreferableTarget(cv2.dnn.DNN_TARGET_CUDA)   
        self.model = ri.set_model_input(self.net)
        #self.searching = True


        #SE FOR NO REAL
        self.get_webcam()

        #SE FOR NO WEBOTS
        #self.connect_to_webots()
        
        


    def get_webcam(self):
        '''Converts the sensor_msgs/Image to Numpy Array'''

        cap = cv2.VideoCapture(videoInput)

        while True:
            _ , self.current_frame = cap.read()
            self.classes, self.scores, self.boxes, self.fps = ri.detect_model(self.model,self.current_frame)

            self.show_result_frame()
            
            if cv2.waitKey(1) == ord("q"):
                cap.release()
                cv2.destroyAllWindows()


    def show_result_frame(self):
        '''Shows the result frame obtained from neural network on OpenCV window.'''
        ri.draw_results(self.current_frame, self.classes, self.scores, self.boxes)
        cv2.imshow("Current Frame", self.current_frame)
        
    '''def publish_results(self):

        objects_msg = Webotsmsg()
        objects_msg.searching = self.searching
        objects_msg.fps = self.fps

        self.list_of_classes_in_current_frame = []
        self.dict_of_xs = dict()

        for i in range(len(self.boxes)):
            [x_top, y_top, roi_width, roi_height] = self.boxes[i]

            x = int(x_top + roi_width/2)
            y = int(y_top + roi_height/2)
            
            results = [True, x, y, roi_width, roi_height]

            

            # A mesma classe de trave é reconhecida para as duas traves
            # Sabendo disso, a trave direita é a com maior x
            self.dict_of_xs[i] = {"classe": self.classes[i], "x": x}
            print(self.dict_of_xs)

            if self.classes[i] not in self.list_of_classes_in_current_frame:
                self.list_of_classes_in_current_frame.append(self.classes[i])

                if self.classes[i]== 1:
                    ball = Ball()
                    [ball.found, ball.x, ball.y, ball.roi_width, ball.roi_height] = results
                    objects_msg.ball = ball
            
            else:
                self.maior_x = -1
                self.menor_x = 500
                for key in self.dict_of_xs.keys():
                    if self.dict_of_xs[key]['classe'] != 0:
                        if self.dict_of_xs[key]['x'] >= self.maior_x:
                            self.maior_x = self.dict_of_xs[key]['x']
                            self.pos_maior_x = key

                        if self.dict_of_xs[key]['x'] < self.menor_x:
                            self.menor_x = self.dict_of_xs[key]['x']
                            self.pos_menor_x = key

                if self.dict_of_xs[self.pos_maior_x]['classe'] == 2:
                    self.dict_of_xs[self.pos_menor_x]['classe'] = 1

                elif self.dict_of_xs[self.pos_maior_x]['classe'] == 1:
                    self.dict_of_xs[self.pos_maior_x]['classe'] = 2


                print("Detectei duas iguais!")
                print(self.dict_of_xs)'''

'''-------------------------------------------------------------WEBOTS-----------------------------------------------------------------------'''

        #Diferencias códigos da camera e do Webots

        #Configurações da imagem (Brilho e foco) (Parametro passado launch)

no_visao = Node('visao')

'''
pr.disable()
s = io.StringIO()
sortby = SortKey.CUMULATIVE
ps = pstats.Stats(pr, stream=s).sort_stats(sortby)
ps.print_stats()
print(s.getvalue())'''
