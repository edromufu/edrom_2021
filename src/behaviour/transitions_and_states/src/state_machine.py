#!/usr/bin/env python3
#coding=utf-8

from transitions import Machine

LEFT = 'Left'
RIGHT = 'Right'
CENTER = 'Center'
BOTTOM = 'Bottom'

UP = 'Up'

RIGHT_HEAD_MOVEMENT = 'R'
LEFT_HEAD_MOVEMENT = 'L'

class StateMachine():

    def __init__(self):

        states = ['search_ball','body_alignment','body_search','walking','stand_still','kick','getting_up', 'impossible']
        
        go_to_search_ball_transitions = [
            { 'trigger': 'go_to_search_ball', 'source': 'body_alignment', 'dest': 'search_ball',
             'conditions': 'search_ball_condition', 'unless': 'getting_up_condition'}
            ,
            { 'trigger': 'go_to_search_ball', 'source': 'body_search', 'dest': 'search_ball',
             'conditions': 'search_ball_condition', 'unless': 'getting_up_condition'}
            ,
            { 'trigger': 'go_to_search_ball', 'source': 'stand_still', 'dest': 'search_ball',
             'conditions': 'search_ball_condition', 'unless': 'getting_up_condition'}
            ,
            { 'trigger': 'go_to_search_ball', 'source': 'getting_up', 'dest': 'search_ball',
             'conditions': 'search_ball_condition', 'unless': 'getting_up_condition'}
            ,
            { 'trigger': 'go_to_search_ball', 'source': 'walking', 'dest': 'search_ball',
             'conditions': 'search_ball_align_kick_condition', 'unless': 'getting_up_condition'}
        ]

        go_to_body_alignment_transitions = [
            { 'trigger': 'go_to_body_alignment', 'source': 'search_ball', 'dest': 'body_alignment',
             'conditions': 'body_alignment_condition', 'unless': 'getting_up_condition'}
        ]

        go_to_body_search_transitions = [
            { 'trigger': 'go_to_body_search', 'source': '*', 'dest': 'body_search',
             'conditions': 'body_search_condition', 'unless': 'getting_up_condition'}
        ]

        go_to_walking_transitions = [
            { 'trigger': 'go_to_walking', 'source': 'search_ball', 'dest': 'walking',
             'conditions': 'walking_condition', 'unless': 'getting_up_condition'}
            ,
            { 'trigger': 'go_to_walking', 'source': 'body_search', 'dest': 'walking',
             'conditions': 'walking_condition', 'unless': 'getting_up_condition'}
            ,
            { 'trigger': 'go_to_walking', 'source': 'body_alignment', 'dest': 'walking',
             'conditions': 'walking_condition', 'unless': 'getting_up_condition'}
        ]
        
        go_to_stand_still_transitions = [
            { 'trigger': 'go_to_stand_still', 'source': 'getting_up', 'dest': 'stand_still',
             'unless': 'getting_up_condition'}
            ,
            { 'trigger': 'go_to_stand_still', 'source': 'kick', 'dest': 'stand_still',
             'unless': 'getting_up_condition'}
        ]

        go_to_kick_transitions = [
            { 'trigger': 'go_to_kick', 'source': 'walking', 'dest': 'kick',
             'conditions': 'kick_condition', 'unless': 'getting_up_condition'},
            { 'trigger': 'go_to_kick', 'source': 'search_ball', 'dest': 'kick',
             'conditions': 'kick_condition', 'unless': 'getting_up_condition'},
        ]

        go_to_getting_up_transitions = [
            { 'trigger': 'go_to_getting_up', 'source': '*', 'dest': 'getting_up',
             'conditions': 'getting_up_condition'}
        ]

        go_to_impossible_transitions = [
            {'trigger': 'go_to_search_ball', 'source': '*', 'dest': 'impossible',
             'conditions': 'impossible_condition'},
            {'trigger': 'go_to_body_search', 'source': '*', 'dest': 'impossible',
             'conditions': 'impossible_condition'},
            {'trigger': 'go_to_walking', 'source': '*', 'dest': 'impossible',
             'conditions': 'impossible_condition'},
            {'trigger': 'go_to_kick', 'source': '*', 'dest': 'impossible',
             'conditions': 'impossible_condition'},
            {'trigger': 'go_to_getting_up', 'source': '*', 'dest': 'impossible',
             'conditions': 'impossible_condition'},
            {'trigger': 'go_to_body_alignment', 'source': '*', 'dest': 'impossible',
             'conditions': 'impossible_condition'},
            {'trigger': 'go_to_stand_still', 'source': '*', 'dest': 'impossible',
             'conditions': 'impossible_condition'}
        ]

        all_transitions = (go_to_search_ball_transitions + go_to_body_alignment_transitions + go_to_walking_transitions 
        + go_to_kick_transitions + go_to_getting_up_transitions + go_to_stand_still_transitions + go_to_body_search_transitions
        + go_to_impossible_transitions)

        self.robot_state_machine = Machine(self, states=states, transitions=all_transitions, initial='stand_still')
    
    def request_state_machine_update(self, fallState, ballFound, ballClose, ballRelativePosition, verAngleAccomplished, headPossibleMovements, horMotorOutOfCenter):
        self.walking_condition_update(ballRelativePosition, horMotorOutOfCenter)
        self.getting_up_condition_update(fallState)
        self.kick_condition_update(ballRelativePosition, verAngleAccomplished, ballClose)
        self.body_alignment_condition_update(ballRelativePosition, headPossibleMovements, horMotorOutOfCenter)
        self.search_ball_condition_update(ballFound, ballRelativePosition)
        self.search_ball_align_kick_condition_update(ballRelativePosition)
        self.body_search_condition_update(ballFound)

        print(f'-------------------\nEstado {str(self.state)}')
        self.update_state()
    
    def update_state(self):

        if self.go_to_getting_up():
            print('Transição para o getting_up\n-------------------\n')
            return True
        
        elif self.go_to_kick():
            print('Transição para o kick\n-------------------\n')
            return True

        elif self.go_to_search_ball():
            print('Transição para o search_ball\n-------------------\n')
            return True

        elif self.go_to_body_search():
            print('Transição para o body_search\n-------------------\n')
            return True

        elif self.go_to_walking():
            print('Transição para o walking\n-------------------\n')
            return True
        
        elif self.go_to_body_alignment():
            print('Transição para o body_alignment\n-------------------\n')
            return True
        
        elif self.go_to_stand_still():
            print('Transição para o stand_still\n-------------------\n')
            return True
        
        else:
            return False
    
    ########################################FUNÇÕES UPDATE CONDITION########################################
    def walking_condition_update(self, ball_relative_position, hor_motor_out_of_center):
        if ball_relative_position == CENTER and not hor_motor_out_of_center:
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
    
    def search_ball_condition_update(self, ball_found, ball_relative_position):
        if ball_relative_position != CENTER and ball_found:
            self.search_ball_condition = True
        else:
            self.search_ball_condition = False

    def search_ball_align_kick_condition_update(self, ball_relative_position):
        if str(self.state) == 'walking' and BOTTOM in ball_relative_position:
            self.search_ball_align_kick_condition = True
        else:
            self.search_ball_align_kick_condition = False
    
    def body_search_condition_update(self, ball_found):
        if not ball_found:
            self.body_search_condition = True
        else:
            self.body_search_condition = False

    ########################################FUNÇÕES RETURN CONDITION########################################
    def walking_condition(self): return self.walking_condition   
    def getting_up_condition(self): return self.getting_up_condition  
    def kick_condition(self): return self.kick_condition  
    def body_alignment_condition(self): return self.body_alignment_condition
    def search_ball_condition(self): return self.search_ball_condition
    def search_ball_align_kick_condition(self): return self.search_ball_align_kick_condition  
    def body_search_condition(self): return self.body_search_condition
    def impossible_condition(self): return False