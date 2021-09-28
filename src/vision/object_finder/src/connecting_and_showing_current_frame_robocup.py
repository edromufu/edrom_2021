#!/usr/bin/env python3
# coding=utf-8

import rospy
from sensor_msgs.msg import Image as ROS_Image

import cv2
from cv_bridge import CvBridge
import running_inference_robocup as ri

from vision_msgs.msg import Ball
from vision_msgs.msg import Leftgoalpost
from vision_msgs.msg import Rightgoalpost
from vision_msgs.msg import Webotsmsg

class Node():

    # Inicializando o nó
    def __init__(self, nome_no):

        #Iniciando o nó e obtendo os arquivos que definem a rede neural
        rospy.init_node(nome_no, anonymous = True)
        self.net = ri.get_cnn_files()
        self.net.setPreferableBackend(cv2.dnn.DNN_BACKEND_CUDA)
        self.net.setPreferableTarget(cv2.dnn.DNN_TARGET_CUDA)   
        self.model = ri.set_model_input(self.net)
        self.searching = True

        self.publisher = rospy.Publisher('/webots_natasha/vision_inference', Webotsmsg, queue_size=100)
        self.connect_to_webots()


    def connect_to_webots(self):
        '''Gets the Vision topic sent from Behavior, and subscribe it.'''

        self.topic_found = False
        while self.topic_found == False:
            try:
                for sublist in rospy.get_published_topics(namespace = "/"):
                    for item in sublist:
                        if "vision_controller" in item:
                            self.vision_topic = item

                rospy.Subscriber(self.vision_topic, ROS_Image, callback = self.convert_ros_image_to_cv2)
                self.topic_found = True
                rospy.spin()
            except Exception:
                pass


    def convert_ros_image_to_cv2(self, message):
        '''Converts the sensor_msgs/Image to Numpy Array'''

        self.opencv_bridge = CvBridge()
        
        try:
            self.current_frame = self.opencv_bridge.imgmsg_to_cv2(message, desired_encoding="bgr8")
        
        except Exception as e:
            print(f"{e}")

        self.send_current_frame_to_inference()

    def send_current_frame_to_inference(self):
        '''Sends the current frame to the inference code.'''
        #self.binary_image = ri.create_binary_image(self.net, self.current_frame)

        try:
            self.classes, self.scores, self.boxes, self.fps = ri.detect_model(self.model, self.current_frame)
            self.show_result_frame()
            self.publish_results()
        except Exception as e:
            #print(e)
            pass

    def show_result_frame(self):
        '''Shows the result frame obtained from neural network on OpenCV window.'''

        ri.draw_results(self.current_frame, self.classes, self.scores, self.boxes)

        #cv2.imshow("Current Frame", self.current_frame)
        cv2.waitKey(1)

    def publish_results(self):

        objects_msg = Webotsmsg()
        objects_msg.searching = self.searching
        objects_msg.fps = self.fps

        for i in range(len(self.boxes)):
            [x_top, y_top, roi_width, roi_height] = self.boxes[i]

            x = int(x_top + roi_width/2)
            y = int(y_top + roi_height/2)

            results = [True, x, y, roi_width, roi_height]

            if self.classes[i][0] == 0:
                ball = Ball()
                [ball.found, ball.x, ball.y, ball.roi_width, ball.roi_height] = results
                objects_msg.ball = ball

            elif self.classes[i][0] == 1:
                leftgoalpost = Leftgoalpost()
                [leftgoalpost.found, leftgoalpost.x, leftgoalpost.y, leftgoalpost.roi_width, leftgoalpost.roi_height] = results
                objects_msg.leftgoalpost = leftgoalpost

            else:
                rightgoalpost = Rightgoalpost()
                [rightgoalpost.found, rightgoalpost.x, rightgoalpost.y, rightgoalpost.roi_width, rightgoalpost.roi_height] = results
                objects_msg.rightgoalpost = rightgoalpost

        self.publisher.publish(objects_msg)
        


no_visao = Node('visao')