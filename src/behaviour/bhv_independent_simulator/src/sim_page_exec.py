#!/usr/bin/env python3
#coding=utf-8

import rospy
import math as m
from controller import Supervisor

class RobotPagesExec():

    def __init__(self, supervisor):
        """
        Construtor:
        - Faz a chamada de funções para definir as variáveis para checagem e reprodução das pages.
        """
        self.general_supervisor = supervisor

        self.init_kick_check()
    
    def init_kick_check(self):
        self.ball_node = self.general_supervisor.getFromDef('Ball')

        self.ball_translation_field = self.ball_node.getField('translation')
        self.ball_x_z = [self.ball_translation_field.getSFVec3f()[0]] + [self.ball_translation_field.getSFVec3f()[2]]

        robot_3D_node = self.general_supervisor.getFromDef('Robot3D')
        self.robot_translation_field = robot_3D_node.getField('translation')
        self.robot_x_z = [self.robot_translation_field.getSFVec3f()[0]] + [self.robot_translation_field.getSFVec3f()[2]]

        self.robot_rotation_field = robot_3D_node.getField('rotation')
        self.robot_theta = self.robot_rotation_field.getSFRotation()[3]
    
    def callClock(self):
        self.robot_x_z = [self.robot_translation_field.getSFVec3f()[0]] + [self.robot_translation_field.getSFVec3f()[2]]
        self.ball_x_z = [self.ball_translation_field.getSFVec3f()[0]] + [self.ball_translation_field.getSFVec3f()[2]]
        self.robot_theta = self.robot_rotation_field.getSFRotation()[3]

        robot_to_ball_vec = [self.ball_x_z[0]-self.robot_x_z[0],self.ball_x_z[1]-self.robot_x_z[1]]
        forward_vec = [-0.005*m.sin(self.robot_theta), -0.005*m.cos(self.robot_theta)]

        new_vec = [robot_to_ball_vec[0]+forward_vec[0],robot_to_ball_vec[1]+forward_vec[1]]

        diff = m.sqrt((robot_to_ball_vec[0]**2)+(robot_to_ball_vec[1]**2)) - m.sqrt((new_vec[0]**2)+(new_vec[1]**2))

        if diff > 0:
            self.ball_node.getField('color').setSFColor([1,0,0])
        else:
            self.ball_node.getField('color').setSFColor([0,1,0])
