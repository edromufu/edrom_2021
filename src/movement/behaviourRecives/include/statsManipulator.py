#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import possibleMovementsList

class StatsManipulator():
    
    def __init__(self):
        self.movList = possibleMovementsList.PossibleMovementsList()

    def isMovementListed(self, movement_to_be_checked):
        if movement_to_be_checked in self.movList.dict_movements_listed_and_their_status.keys():
            #checkPriority(movement_to_be_checked)
            return True
        else:
            return False

    def changeMovementStatus(self, _new_movement_status):
        """
        Método para alterar o status de movimentação da robô
        tornando True o tipo solicitado e False todos os outros.
        """

        for key in movList.self.dict_movements_listed_and_their_status.keys():
            if key == _new_movement_status:
                movList.dict_movements_listed_and_their_status[key] = True
            else:
                movList.dict_movements_listed_and_their_status[key] = False
    
    def checkCurrentMovementStatus(self):
        """
        Método para checar qual o status atual de movimentação.
        """

        _countTrue = 0

        for key in movList.self.dict_movements_listed_and_their_status.keys():

            if movList.dict_movements_listed_and_their_status[key]:
                _countTrue += 1
                _currently_active = key
        
        if count == 0:
            return "none_of_the_movements_active"
        elif count > 1:
            return "error_more_than_one_movement_active"
        else:
            return _currently_active

    #def checkPriority(self, moviment_to_check):
        
        
    

