#ifndef MOTORSET_H
#define MOTORSET_H

#include "jointcommand.h"
#include "pose.h"
#include "page.h"
#include <iostream>
#include <vector>
#include <string>
#include "movement_util/Enums.h"

#include "ros/ros.h"
#include "ros/package.h"
#include <message_filters/subscriber.h>
#include "movement_util/State.h"
#include "movement_util/spline.h"

#include "movement_msgs/MotorSetSrv.h"
#include "movement_msgs/MovementSrv.h"
#include "movement_msgs/InterfaceSrv.h"
#include "movement_msgs/JointStateMsg.h"
#include "movement_msgs/MotorRequestMsg.h"


enum PAGE_MOVEMENT
{
    NONE_,
    RIGHT_LEG_KICK,
    LEFT_LEG_KICK,
    FRONT_STAND_UP,
    BACK_STAND_UP,
    SQUAT,
    LEFT_DEFENSE,
    RIGHT_DEFENSE
};

class MotorSet
{
public:
    MotorSet(ros::NodeHandle nh_);
    std::string pageToLoad;

private:
    typedef movement_msgs::MotorRequestMsg              MotorRequestMsg;
    typedef movement_msgs::JointStateMsg                JointStateMsg;


    bool toRobot;
    bool toGazebo;

    double dt;

    //ROS Node
    ros::NodeHandle    nh;
    ros::NodeHandle    nh_private;

    //ROS Publishers
    ros::Publisher                   jointStateTopic;
    ros::Publisher                   motorCommPubPages;
    
    //ROS  Services
    ros::ServiceServer motorSetSrv;
   
    //ROS  Service client
    ros::ServiceClient            interfaceCli;
    movement_msgs::InterfaceSrv   interfaceSrv;
   
    //Methods
    bool motorSetService(movement_msgs::MotorSetSrv::Request  &msg,movement_msgs::MotorSetSrv::Response &res);
    void linearInterpol(Page page, bool robot);
    void sendPoseConstVel(Pose pose);
    void interpolConstVel(Page page, bool robot);

    //Variables
    std::string robotName;

};

#endif // MOTORSET_H
