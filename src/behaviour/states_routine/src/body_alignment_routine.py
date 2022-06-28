#!/usr/bin/env python3
#coding=utf-8

import rospy
from modularized_bhv_msgs.msg import currentStateMsg, stateMachineMsg
from modularized_bhv_msgs.srv import moveRequest

#Setando a grafia correta das requisições para a cabeça
CENTER = 'head_to_center'

#Setando a grafia correta das requisições para movimento de caminhada
CLOCKWISE = 'rotate_clockwise'
COUNTER_CLOCKWISE = 'rotate_counter_clockwise'

#Setando o step para cada tipo de movimento
ROTATION_STEP = 0.1309

class BodyAlignmentRoutine():

    def __init__(self):
        
        self.move_request = rospy.ServiceProxy('/bhv2mov_communicator/head_requisitions', moveRequest)
        self.threeD_request = rospy.ServiceProxy('/bhv2mov_communicator/3D_move_requisitions', moveRequest)
        rospy.Subscriber('/transitions_and_states/state_machine', currentStateMsg, self.flagUpdate)
        rospy.Subscriber('/sensor_observer/state_machine_vars', stateMachineMsg, self.varsUpdate)

        self.flag = False
        self.current_hor_motor_position = 0

        while not rospy.is_shutdown():
            self.createRequest()
    
    def flagUpdate(self, msg):
        if msg.currentState == 'body_alignment':
            self.flag = True
        else:
            self.flag = False

    def varsUpdate(self, msg):
        self.current_hor_motor_position = msg.horMotorPosition
        
    def createRequest(self):

        if self.current_hor_motor_position < 0:
            number_of_rotation_requests = int(abs(self.current_hor_motor_position/ROTATION_STEP))
            request1 = CENTER
            request2 = COUNTER_CLOCKWISE
        elif self.current_hor_motor_position > 0:
            number_of_rotation_requests = int(abs(self.current_hor_motor_position/ROTATION_STEP))
            request1 = CENTER
            request2 = CLOCKWISE
        else:
            number_of_rotation_requests = 0
            request1 = None
            request2 = None

        if self.flag:
            self.move_request(request1)

            count = 0
            while(count < number_of_rotation_requests):
                self.threeD_request(request2)
                count += 1


if __name__ == '__main__':
    rospy.init_node('Body_alignment_node', anonymous=False)

    routine = BodyAlignmentRoutine()
    rospy.spin()