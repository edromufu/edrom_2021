#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import possibleMovementsList

class StatsManipulator():
    
    def __init__(self):
        self.movList = possibleMovementsList.PossibleMovementsList()

    def isMovementListed(self, movement_to_be_checked):
        if movement_to_be_checked in self.movList.dict_movements_listed_and_their_status.keys():
            return True
        else:
            return False

    def changeMovementStatus(self, _new_movement, _status):

        if (not _status):
            self.movList.dict_movements_listed_and_their_status[_new_movement] = _status
            print("O status de {" ,_new_movement, "} alterado para: ",_status)
            return
               
        for key in self.movList.other_movements_listed:
            if(self.checkMovementStatus(key)):
                print("Impossivel alterar status. Movimento {" ,key, "} esta ligado")
                return

        for key in self.movList.dict_movements_listed_and_their_status.keys():
            if(_new_movement == 'stop_all_motions'):
                self.movList.dict_movements_listed_and_their_status[key] = False

            elif (key == _new_movement):
                self.movList.dict_movements_listed_and_their_status[key] = _status
                print("O status de {" ,key, "} alterado para: ",_status)
            else:
                self.movList.dict_movements_listed_and_their_status[key] = False
                
        return
        
    def checkMovementStatus(self, movement):
        
        print("Movimento a ser checado", movement)
        for key in self.movList.dict_movements_listed_and_their_status.keys():
            if (key == movement):
                return self.movList.dict_movements_listed_and_their_status[key]
        
        return False
        
    def showAllStatus(self):

        for key in self.movList.dict_movements_listed_and_their_status.keys():
            print("O movimento", key, "tem status:", self.movList.dict_movements_listed_and_their_status[key])
