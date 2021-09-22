#!/usr/bin/env python3
# -*- coding: utf-8 -*-

class PossibleMovementsList():

    def __init__(self):
        """
        Construtor da classe:
        - Lista os elementos separadamente pela sua classificação;
        - Monta a lista com todos os status de movimentação possiveis;
        - Inicia o vetor de status ativo com todos falso;
        - Monta o dicionário que correlaciona todos os status possíveis com se está ativo ou não.
        """

        _walking_movements_listed = ["walk_forward", "rotate_clockwise", "rotate_counter_clockwise"]
        _page_movements_listed = ["left_kick", "right_kick", "stand_up_front", "stand_up_back", "squat", "left_defense", "right_defense"]
        _moving_head_movements_listed = ["head_to_left","head_to_right","head_to_up","head_to_down", "head_to_center", "head_search"]
        _mixed_or_other_movements_listed = ["nothing_request", "body_alignment_to_left", "body_alignment_to_right", "emergency_shutdown"]
        

        _all_movements_listed = _walking_movements_listed + _page_movements_listed + _moving_head_movements_listed + _mixed_or_other_movements_listed


        _dict_movements_listed_and_their_status = dict.fromkeys(_all_movements_listed,False)

        
    def is_movement_listed(self, _movement_to_be_checked):
        """
        Método para checar a existência de um movimento
        nos listados nesta classe.
        """

        if _movement_to_be_checked in _dict_movements_listed_and_their_status.keys():
            return True
        else:
            return False

    def change_movement_status(self, _new_movement_status):
        """
        Método para alterar o status de movimentação da robô
        tornando True o tipo solicitado e False todos os outros.
        """

        for key in _dict_movements_listed_and_their_status.keys():
            if key == _new_movement_status:
                _dict_movements_listed_and_their_status[key] = True
            else:
                _dict_movements_listed_and_their_status[key] = False
    
    def check_current_movement_status(self):
        """
        Método para checar qual o status atual de movimentação.
        """

        _countTrue = 0

        for key in _dict_movements_listed_and_their_status.keys():

            if _dict_movements_listed_and_their_status[key]:
                _countTrue += 1
                _currently_active = key
        
        if count == 0:
            return "none_of_the_movements_active"
        elif count > 1:
            return "error_more_than_one_movement_active"
        else:
            return _currently_active


        

