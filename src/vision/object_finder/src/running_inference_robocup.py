#!/usr/bin/env python3
# coding=utf-8

import os
import cv2
import numpy as np
import time
import random

outline_color_list = [(255, 0, 0), (0, 0, 255), (0, 0, 255)]

def get_cnn_files():
    '''Gets the CNN filenames, despite the PC file structure.'''

    ## Se for um conteiner, o diretorio robocup_folder eh o definido dentro do for
    arq = open('/proc/self/cgroup', 'r')
    linhas = arq.readlines()

    robocup_folder = os.path.join(os.path.expanduser('~'), "edrom/src/vision/robocup_cnn_files")
    for linha in linhas:
        if 'docker' in linha:
            robocup_folder = "/robotica_ufu/src/vision/robocup_cnn_files"
            break

    config_file = os.path.join(robocup_folder, "yolov4-tiny-obj.cfg")
    weights_file = os.path.join(robocup_folder, "yolov4-tiny-obj_best.weights")

    return read_cnn_architecture(config_file, weights_file)

def read_cnn_architecture(config_file, weights_file):

    net = cv2.dnn.readNet(config_file, weights_file, "darknet")
    #output_names = net.getUnconnectedOutLayersNames()

    return net

def set_model_input(net):

    model = cv2.dnn_DetectionModel(net)
    model.setInputParams(size=(416, 416), scale=1/255, swapRB=True)
    
    return model

def detect_model(model, current_frame):
    
    if (random.randint(1, 3) == 2):

        start_time = time.time()
        classes, scores, boxes = model.detect(current_frame, 0.6, 0.4)
        finish_time = time.time()
        fps = 1/(finish_time-start_time)

        #print(f"Classes: {classes}, Scores: {scores}")
        #print(f"Boxes: {boxes}")
        print("FPS: ", fps)
        #print('\n')

        return classes, scores, boxes, int(fps)

def draw_results(frame, classes, scores, boxes):

    # Draw the bounding boxes
    for i in range(len(boxes)):
        [x_top, y_top, roi_width, roi_height] = boxes[i]
        p1 = (x_top, y_top)
        p2 = (x_top + roi_width, y_top + roi_height)
        p3 = (x_top, y_top - 5)

        cv2.rectangle(frame, p1, p2, outline_color_list[classes[i][0]], 2)

        confidence = str(round(float(scores[i][0]), 2))

        if classes[i][0] == 0:
            label = "Ball"
        elif classes[i][0] == 1:
            label = "Left_goalpost"
        else:
            label = "Right_goalpost"
        
        cv2.putText(frame, label + " " + confidence, p3, cv2.FONT_HERSHEY_PLAIN, 1, (255,255,255), 1)


def create_binary_image(net, current_frame):

    return cv2.dnn.blobFromImage(current_frame, size = (416, 416))















'''width, height = 416, 416
classes = ["ball", "left_goalpost", "right_goalpost"]

model = cv2.dnn_DetectionModel(net)
model.detect()

outputs = net.forward(output_names)
first_output = outputs[0]

print(first_output.shape)
print(type(first_output))

class_ids = []
confidences = []
boxes = []

for out in outputs:

    for detection in out:
        scores = detection[5:]
        class_id = np.argmax(scores)
        confidence = scores[class_id]

        if confidence > 0.2:
            # Object detected
            center_x = int(detection[0] * width)
            center_y = int(detection[1] * height)
            w = int(detection[2] * width)
            h = int(detection[3] * height)
            # Rectangle coordinates
            x = int(center_x - w / 2)
            y = int(center_y - h / 2)
            boxes.append([x, y, w, h])
            confidences.append(float(confidence))
            class_ids.append(class_id)

print(boxes)

indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.4, 0.3)

for i in range(len(boxes)):

    if i in indexes:
        x, y, w, h = boxes[i]
        label = str(classes[class_ids[i]])
        confidence = confidences[i]
        x_centro, y_centro, roi_largura, roi_altura = int(x + w/2), int(y + h/2), w, h'''