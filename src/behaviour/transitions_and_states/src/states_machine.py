#!/usr/bin/env python3
#coding=utf-8

from transitions import Machine

LEFT = 'Left'
RIGHT = 'Right'
CENTER = 'Center'

UP = 'Up'

RIGHT_HEAD_MOVEMENT = 'R'
LEFT_HEAD_MOVEMENT = 'L'

class StateMachine():

    def __init__(self):

        states = ['search_ball','body_alignment','body_search','walking','stand_still','kick','getting_up']
        
        go_to_body_alignment_transitions = [
            { 'trigger': 'go_to_body_alignment', 'source': 'search_ball', 'dest': 'body_alignment',
             'conditions': 'body_alignment_condition', 'unless': 'getting_up_condition'}
        ]

        go_to_walking_transitions = [
            { 'trigger': 'go_to_walking', 'source': 'search_ball', 'dest': 'walking',
             'conditions': 'walking_condition', 'unless': 'getting_up_condition'}
            ,
            { 'trigger': 'go_to_walking', 'source': 'body_search', 'dest': 'walking',
             'conditions': 'walking_condition', 'unless': 'getting_up_condition'}
        ]

        go_to_kick_transitions = [
            { 'trigger': 'go_to_kick', 'source': 'search_ball', 'dest': 'kick',
             'conditions': 'kick_condition', 'unless': 'getting_up_condition'}
        ]

        go_to_getting_up_transitions = [
            { 'trigger': 'go_to_getting_up', 'source': '*', 'dest': 'getting_up',
             'conditions': 'getting_up_condition'}
        ]

        go_to_stand_still_transitions = [
            { 'trigger': 'go_to_stand_still', 'source': 'getting_up', 'dest': 'stand_still',
             'unless': 'getting_up_condition'}
        ]
    
    def request_state_machine_update(self, fallState, ballFound, ballClose, ballRelativePosition, verAngleAccomplished, headPossibleMovements, horMotorOutOfCenter):
        self.walking_condition_update(ballRelativePosition)
        self.getting_up_condition_update(fallState)
        self.kick_condition_update(ballRelativePosition, verAngleAccomplished, ballClose)
        self.body_alignment_condition_update(ballRelativePosition, headPossibleMovements, horMotorOutOfCenter)
    
    ########################################FUNÇÕES UPDATE CONDITION########################################
    def walking_condition_update(self, ball_relative_position):
        if not LEFT in ball_relative_position and not RIGHT in ball_relative_position:
            self.walking_condition = True
        else:
            self.walking_condition = False
    
    def getting_up_condition_update(self, fall_state):
        if fall_state != UP:
            self.getting_up_condition = True
        else:
            self.getting_up_condition = False
    
    def kick_condition_update(self, ball_relative_position, ver_angle_accomplished, ball_close):
        if ball_close and ball_relative_position == CENTER and ver_angle_accomplished:
            self.kick_condition = True
        else:
            self.kick_condition = False
    
    def body_alignment_condition_update(self, ball_relative_position, head_possible_movements, hor_motor_out_of_center):
        if ( (RIGHT_HEAD_MOVEMENT not in head_possible_movements and RIGHT in ball_relative_position) or 
            (LEFT_HEAD_MOVEMENT not in head_possible_movements and LEFT in ball_relative_position) ):
            out_of_range = True
        else:
            out_of_range = False

        if ball_relative_position == CENTER and hor_motor_out_of_center:
            align_to_ball = True
        else:
            align_to_ball = False
        
        if out_of_range or align_to_ball:
            self.body_alignment_condition = True
        else:
            self.body_alignment_condition = False

    ########################################FUNÇÕES RETURN CONDITION########################################
    def walking_condition(self):
        return self.walking_condition
    
    def getting_up_condition(self):
        return self.getting_up_condition
    
    def kick_condition(self):
        return self.kick_condition
    
    def body_alignment_condition(self):
        return self.body_alignment_condition

#Sumida = body_search
#Encontrada e não centralizada = search_ball