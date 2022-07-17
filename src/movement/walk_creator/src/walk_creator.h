#ifndef WALK_CREATORH
#define WALK_CREATORH

#include "../include/IKWalk.hpp"
#include "ros/ros.h"
#include "movement_msgs/WalkingPositionsMsg.h"
#include "movement_msgs/WalkCreatorRequestSrv.h"
#include "std_msgs/Bool.h"

class WalkCreator
{
    public:
        WalkCreator(ros::NodeHandle nh);

        bool walkRequest(movement_msgs::WalkCreatorRequestSrv::Request  &req_params, movement_msgs::WalkCreatorRequestSrv::Response &res);
        bool runWalk(const Rhoban::IKWalkParameters& params, double timeLength, double& phase, double& time);
        void flagChange(std_msgs::Bool &status);

        movement_msgs::WalkingPositionsMsg positions;
        
        struct Rhoban::IKWalkParameters params;
        struct Rhoban::IKWalkOutputs outputs;

        double engineFrequency = 1.5625;
        double phase = 0.0;
        double time = 0.0;
        bool flag2Publish = true;

        ros::Publisher walk_motor_positions_pub;
        ros::ServiceServer request_walk_creation;
        ros::Subscriber flag_to_publish_positions_sub;
};


#endif

