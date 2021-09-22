#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import time

from transitions import Machine
from movement_msgs.msg import LipParamsMsg
from movement_msgs.msg import JointStateMsg
from movement_msgs.srv import MovementStatesSrv

class Interpreter(object):

    def statesService(self):
        
        rospy.wait_for_service('/motor_comm/state_request')

        try:

            ServiceStates = rospy.ServiceProxy('/motor_comm/state_request', MovementStatesSrv)

            ServiceStates(str(self.state))

        except rospy.ServiceException as e:

            print("Service call failed: %s"%e)

    def start(self):
        rospy.Subscriber('/humanoid_walking/walking_params_state', LipParamsMsg, self.paramsCallback)
        rospy.Subscriber('/humanoid_model/jointState', JointStateMsg, self.callbackPageExec)

        while not rospy.is_shutdown():
            self.current_state = self.state
            #if(self.current_state != self.state_before):
            #    print("Estado atual: " + str(self.current_state))

            self.switch_state()
            self.state_before = self.current_state
            self.statesService()
    
    def paramsCallback(self, msg):
        self.first_pose = msg.first_pose
        self.move_head = msg.move_head
        self.walking = msg.walk_flag
        self.test_mode = msg.test_mode

    def callbackPageExec(self, msg):
        if msg.kind == 'movecreator' and not msg.readCommand == 'Last_Page':
            self.page_exec = True
        else:
            self.page_exec = False
        
        print(self.page_exec)

    states = ['S_Nothing', 'S_First_pose', 'S_Walking', 'S_Move_head', 'S_Walking_head',
              'S_Page_exec', 'S_Waiting' ,'S_Test_mode', 'S_Impossible']

    def first_pose(self) : return self.first_pose
    def walking(self) : return self.walking
    def move_head(self) : return self.move_head
    def test_mode(self) : return self.test_mode
    def page_exec(self) : return self.page_exec
    def security(self) : return self.security
    def nothing(self) : return self.nothing
    def impossible(self) : return self.impossible
    def ready(self) : return self.ready
    def waiting(self) : return self.waiting

    def firstLoopPose(self) : 
        self.ready = True
        
    def switch_state(self):

        if self.goto_Test_mode():
            return True

        if self.goto_First_pose():
            return True
        
        elif self.goto_Walking():
            return True

        elif self.goto_Move_head():
            return True
        
        elif self.goto_Walking_head():
            return True
        
        elif self.goto_Page_exec():
            return True
        
        elif self.goto_Waiting():
            return True

        else:
            return False

    def __init__(self):
        self.count = 0
        self.first_pose = False
        self.move_head = False
        self.walking = False
        self.test_mode = False
        self.security = False
        self.impossible = False
        self.page_exec = False
        self.ready = False
        self.waiting = False
        self.current_state = ''
        self.state_before = ''

        self.machine = Machine(self, Interpreter.states, 'S_Nothing')

        #Transições para o S_Test_mode
        self.machine.add_transition('goto_Test_mode', 'S_Nothing', 'S_Test_mode',
            conditions=['test_mode'],
            unless=['security'])

        #Transições para o S_First_Pose
        self.machine.add_transition('goto_First_pose', 'S_Test_mode', 'S_First_pose',
            conditions=['test_mode', 'first_pose'],
            unless=['security'],
            after='firstLoopPose')

        self.machine.add_transition('goto_First_pose', 'S_Nothing', 'S_First_pose',
            conditions=['first_pose'],
            unless=['security'], 
            after='firstLoopPose')
        
        self.machine.add_transition('goto_First_pose', '*', 'S_First_pose',
            conditions=['first_pose'],
            unless=['security', 'walking', 'move_head'])

        #Transições para o S_Walking
        self.machine.add_transition('goto_Walking', 'S_First_pose', 'S_Walking',
            conditions=['walking'],
            unless=['security', 'move_head', 'page_exec'])
        
        self.machine.add_transition('goto_Walking', 'S_Walking_head', 'S_Walking',
            conditions=['walking'],
            unless=['security', 'move_head', 'page_exec'])

        self.machine.add_transition('goto_Walking', 'S_Move_head', 'S_Walking',
            conditions=['walking'],
            unless=['security', 'move_head', 'page_exec'])
        
        self.machine.add_transition('goto_Walking', 'S_Waiting', 'S_Walking',
            conditions=['walking'],
            unless=['security', 'move_head', 'page_exec'])

        #Transições para o S_Move_head
        self.machine.add_transition('goto_Move_head', 'S_Walking', 'S_Move_head',
            conditions=['move_head'],
            unless=['security', 'walking', 'page_exec'])

        self.machine.add_transition('goto_Move_head', 'S_First_pose', 'S_Move_head',
            conditions=['move_head'],
            unless=['security', 'walking', 'page_exec'])
        
        self.machine.add_transition('goto_Move_head', 'S_Walking_head', 'S_Move_head',
            conditions=['move_head'],
            unless=['security', 'walking', 'page_exec'])
        
        self.machine.add_transition('goto_Move_head', 'S_Waiting', 'S_Move_head',
            conditions=['move_head'],
            unless=['security', 'walking', 'page_exec'])
        
        #Transições para o S_Walking_head
        self.machine.add_transition('goto_Walking_head', 'S_Walking', 'S_Walking_head',
            conditions=['move_head', 'walking'],
            unless=['security', 'page_exec'])
        
        self.machine.add_transition('goto_Walking_head', 'S_Move_head', 'S_Walking_head',
            conditions=['move_head', 'walking'],
            unless=['security', 'page_exec'])

        self.machine.add_transition('goto_Walking_head', 'S_Waiting', 'S_Walking_head',
            conditions=['move_head', 'walking'],
            unless=['security', 'page_exec'])

        #Transições para o S_Page_exec
        self.machine.add_transition('goto_Page_exec', 'S_First_pose', 'S_Page_exec',
            conditions=['page_exec'],
            unless=['security', 'walking', 'move_head'])

        self.machine.add_transition('goto_Page_exec', 'S_Walking_head', 'S_Page_exec',
            conditions=['page_exec'],
            unless=['security', 'walking', 'move_head'])

        self.machine.add_transition('goto_Page_exec', 'S_Move_head', 'S_Page_exec',
            conditions=['page_exec'],
            unless=['security', 'walking', 'move_head'])

        self.machine.add_transition('goto_Page_exec', 'S_Waiting', 'S_Page_exec',
            conditions=['page_exec'],
            unless=['security', 'walking', 'move_head'])

        #Transições para o S_Waiting
        self.machine.add_transition('goto_Waiting', '*', 'S_Waiting',
            conditions=['ready'],
            unless=['security', 'walking', 'move_head', 'page_exec', 'first_pose'])

        #Estados para Impossible
        self.machine.add_transition('goto_Test_mode', '*', 'S_Impossible',
            conditions=['impossible'])

        self.machine.add_transition('goto_First_pose', '*', 'S_Impossible',
            conditions=['impossible'])

        self.machine.add_transition('goto_Walking', '*', 'S_Impossible',
            conditions=['impossible'])

        self.machine.add_transition('goto_Move_head', '*', 'S_Impossible',
            conditions=['impossible'])
        
        self.machine.add_transition('goto_Walking_head', '*', 'S_Impossible',
            conditions=['impossible'])

        self.machine.add_transition('goto_Page_exec', '*', 'S_Impossible',
            conditions=['impossible'])
        
        self.machine.add_transition('goto_Waiting', '*', 'S_Impossible',
            conditions=['impossible'])

if __name__ == '__main__':
    rospy.init_node('Opencm_transitions_node', anonymous=True)
    interpreter = Interpreter()
    interpreter.start()
    rospy.spin()
