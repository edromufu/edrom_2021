#!/usr/bin/env python3
#coding=utf-8

from transitions import Machine

LEFT = 'Left'
RIGHT = 'Right'
UP = 'Up'

class StateMachine():

    def __init__(self):

        states = ['search_ball','body_alignment','body_search','walking','stand_still','kick','getting_up']
        
        go_to_walking_transitions = [
            { 'trigger': 'go_to_walking', 'source': 'search_ball', 'dest': 'walking',
             'conditions': 'walking_condition', 'unless': 'getting_up_condition'}
            ,
            { 'trigger': 'go_to_walking', 'source': 'body_search', 'dest': 'walking',
             'conditions': 'walking_condition', 'unless': 'getting_up_condition'}
        ]
    
    def request_state_machine_update(self, fallState, ballFound, ballClose, ballRelativePosition, verAngleAccomplished, headPossibleMovements):
        self.walking_condition_update(ballRelativePosition)
        self.getting_up_condition_update(fallState)
    
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

    ########################################FUNÇÕES RETURN CONDITION########################################
    def walking_condition(self):
        return self.walking_condition
    
    def getting_up_condition(self):
        return self.getting_up_condition

#Sumida = body_search
#Encontrada e não centralizada = search_ball