#ifndef WALK_CREATORH
#define WALK_CREATORH

#include "../include/IKWalk.hpp"
#include "ros/ros.h"
#include "movement_msgs/WalkingPositionsMsg.h"
#include "movement_msgs/WalkCreatorRequestSrv.h"
#include "movement_msgs/WalkTestParametersSrv.h"

class WalkCreator
{
    public:
        WalkCreator(ros::NodeHandle nh);

        bool walkRequest(movement_msgs::WalkCreatorRequestSrv::Request  &req_params, movement_msgs::WalkCreatorRequestSrv::Response &res);
        bool runWalk(const Rhoban::IKWalkParameters& params, double timeLength, double& phase, double& time);
        bool parametersUpdateRequest(movement_msgs::WalkTestParametersSrv::Request  &req_params, movement_msgs::WalkTestParametersSrv::Response &res);

        movement_msgs::WalkingPositionsMsg positions;
        
        struct Rhoban::IKWalkParameters params;
        struct Rhoban::IKWalkOutputs outputs;

        double engineFrequency = 15.625;
        double phase = 0.0;
        double time = 0.0;
        
        float step = 0.02;
        float lateral = 0.02;
        float turn = 0.02;

        bool flag2Publish = true;

        ros::Publisher walk_motor_positions_pub;
        ros::ServiceServer request_walk_creation, request_parameters_update;
};


#endif

