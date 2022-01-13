#!/usr/bin/env python3

#Tem apenas como finalidade testar a comunicacao do 
#

import rospy

def handle(req):

    print (req.value)
    return 1

def server():

    rospy.init_node('simulation_of_receiver_behaviour')
    s = rospy.Service('behaviour_topic_name', set_string, handle)
    print ("Esperando Comandos")
    rospy.spin()

if __name__ == "__main__":
    server()

