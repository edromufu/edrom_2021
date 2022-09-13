#ifndef WALK_CREATORH
#define WALK_CREATORH

#include <cstdlib>
#include <jsoncpp/json/value.h>
#include <jsoncpp/json/json.h>
#include <fstream>
#include <string>

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

        void reqEqualsParam();
        void initParams();
        void paramsEqualsReq(movement_msgs::WalkTestParametersSrv::Request  &req);

        movement_msgs::WalkingPositionsMsg positions;
        movement_msgs::WalkTestParametersSrv parameters2update;
        
        struct Rhoban::IKWalkParameters params;
        struct Rhoban::IKWalkOutputs outputs;

        double engineFrequency = 15.625;
        double phase = 0.0;
        double time = 0.0;
        
        float step = 0.02;
        float lateral = 0.02;
        float turn = 0.02;

        bool flag2Publish = true;
        bool interfaceOn;

        std::string default_path = std::getenv("HOME");
        std::string edrom_path = "/edrom/src/movement/movement_utils/walk_test_jsons/default.json";

        Json::Value paramsJson;
        Json::Reader reader;

        ros::Publisher walk_motor_positions_pub;
        ros::ServiceServer request_walk_creation, request_parameters_update;
        ros::ServiceClient interface_parameters_update;
};


#endif

