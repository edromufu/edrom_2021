#!/usr/bin/env python3
#coding=utf-8

import rospy
from state_machine import StateMachine

from modularized_bhv_msgs.msg import stateMachineMsg

class StateMachineReceiver(StateMachine):

    def __init__(self):
        self.state_machine = StateMachine()
        rospy.Subscriber('/sensor_observer/state_machine_vars', stateMachineMsg, self.call_state_machine_update)
    
    def call_state_machine_update(self, stateMachineVars):
        self.state_machine.request_state_machine_update(stateMachineVars.fallState, stateMachineVars.ballFound, 
        stateMachineVars.ballClose, stateMachineVars.ballRelativePosition, stateMachineVars.verAngleAccomplished, 
        stateMachineVars.headPossibleMovements, stateMachineVars.horMotorOutOfCenter)
    
if __name__ == '__main__':
    rospy.init_node('State_machine_node', anonymous=False)

    receiver = StateMachineReceiver()
    rospy.spin()


