#!/usr/bin/env python3
#coding=utf-8
from walking_ui_config import Ui_MainWindow
from movement_msgs.srv import WalkTestParametersSrv, BehRequestSrv

from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *

import sys
import rospy
import time

class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
        self.setWindowTitle('Interface de Teste de Caminhada')

        self.client_walk = rospy.ServiceProxy('/movement/mov_bridge/commands2movement', BehRequestSrv)
        self.client_parameters = rospy.ServiceProxy('/movement_interface/walking_params', WalkTestParametersSrv)
        rospy.Service('/walk_creator/walking_params', WalkTestParametersSrv, self.receiveParameters)

        self.ui.gain_window_btn.clicked.connect(lambda: self.ui.windows.setCurrentWidget(self.ui.gain_page))
        self.ui.walk_window_btn.clicked.connect(lambda: self.ui.windows.setCurrentWidget(self.ui.walk_page))
        self.ui.parameters_window_btn.clicked.connect(lambda: self.ui.windows.setCurrentWidget(self.ui.parameters_page))

        self.ui.update_window_btn.clicked.connect(self.sendParameters)

        self.parameters_list = ['currentWalk', 'stepGain', 'lateralGain', 'turnGain','freq', 'supportPhaseRatio', 'footYOffset', 'riseGain', 'trunkZOffset', 'swingGain', 'swingRollGain', 'swingPhase', 'stepUpVel', 'stepDownVel', 'riseUpVel', 'riseDownVel', 'swingPause', 'swingVel', 'trunkXOffset', 'trunkYOffset', 'trunkPitch', 'trunkRoll', 'extraLeftX', 'extraLeftY', 'extraLeftZ', 'extraRightX', 'extraRightY', 'extraRightZ', 'extraLeftYaw', 'extraLeftPitch', 'extraLeftRoll', 'extraRightYaw', 'extraRightPitch', 'extraRightRoll']
        self.parameters_dict = dict.fromkeys(self.parameters_list)

        for object_name, object_variable in self.ui.__dict__.items():
            if ('SpinBox' in object_name):
                if ('65' not in object_name) and ('66' not in object_name) and ('76' not in object_name):
                    object_variable.setRange(-999,999)
                object_variable.setDecimals(4)      

    def receiveParameters(self, req):
        try:
            self.dict_req = dict(zip(req.__slots__, req.__getstate__()))
            self.setCurrentParametersPageValues()
            self.setCurrentGainPageValues()

            return True
        except Exception as e:
            return e

    def setCurrentParametersPageValues(self):
        for widget in self.ui.scrollAreaWidgetContents.findChildren(QFrame):
            if 'label' in widget.objectName():
                text = widget.text()
                
                if text in self.parameters_list:
                    frame = widget.parent()
                    label_current_value = frame.findChildren(QLabel)[1]

                    label_current_value.setText(str(round(self.dict_req[text],4)))   

    def setCurrentGainPageValues(self):
        for widget in self.ui.gain_page.findChildren(QFrame):

            if 'label' in widget.objectName():
                text = widget.text()

                if text in self.parameters_list:
                    frame = widget.parent()
                    label_current_value = frame.findChildren(QLabel)[1]

                    label_current_value.setText(str(round(self.dict_req[text],4)))

    def sendParameters(self):
        
        self.captureParametersPageValues()
        self.captureGainPageValues()
        self.parameters_dict['currentWalk'] = self.ui.buttonGroup.checkedButton().text()

        resp1 = self.client_walk(self.parameters_dict['currentWalk'], True)
        resp2 = self.client_parameters(*self.parameters_dict.values())

        if self.parameters_dict['currentWalk'] == 'emergency_shutdown':
            self.client_walk(self.parameters_dict['currentWalk'], False)
        
        if resp1 and resp2:
            self.ui.update_window_btn.setStyleSheet("QPushButton{background-color: rgb(66,245,155);}")
        else:
            self.ui.update_window_btn.setStyleSheet("QPushButton{background-color: rgb(245,66,66);}")
        
    def captureParametersPageValues(self):
        for widget in self.ui.scrollAreaWidgetContents.findChildren(QFrame):
            if 'label' in widget.objectName():
                text = widget.text()
                if text in self.parameters_list:
                    frame = widget.parent()
                    spin_box = frame.findChild(QDoubleSpinBox)
                    self.parameters_dict[text] = spin_box.value()     

    def captureGainPageValues(self):

        for widget in self.ui.gain_page.findChildren(QFrame):
            if 'label' in widget.objectName():
                text = widget.text()
                if text in self.parameters_list:
                    frame = widget.parent()
                    spin_box = frame.findChild(QDoubleSpinBox)
                    self.parameters_dict[text] = spin_box.value() 

if __name__ == '__main__':
    app = QApplication(sys.argv)

    rospy.init_node('Walking_interface_node', anonymous=False)

    window = MainWindow()
    window.show()

    sys.exit(app.exec_())