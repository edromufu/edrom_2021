#!/usr/bin/env python3
#coding=utf-8
from walking_ui_config import Ui_MainWindow

from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *

from std_msgs.msg import Int64

import sys
import rospy

class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)

if __name__ == '__main__':
    app = QApplication(sys.argv)

    rospy.init_node('Walking_interface_node', anonymous=False)

    window = MainWindow()
    window.show()

    sys.exit(app.exec_())