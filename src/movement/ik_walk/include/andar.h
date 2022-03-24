#ifndef ANDAR_H
#define ANDAR_H

#include "./ik_walk_lib/IKWalk.hpp"
#include "./ik_walk_lib/IKWalk.cpp"
#include "./ik_walk_lib/CubicSpline.hpp"
#include "./ik_walk_lib/CubicSpline.cpp"
#include "./ik_walk_lib/HumanoidModel.hpp"
#include "./ik_walk_lib/HumanoidModel.cpp"
#include "./ik_walk_lib/LegIK.hpp"
#include "./ik_walk_lib/LegIK.cpp"
#include "./ik_walk_lib/Polynom.hpp"
#include "./ik_walk_lib/Polynom.cpp"
#include "./ik_walk_lib/Spline.hpp"
#include "./ik_walk_lib/Spline.cpp"
#include <sstream>
#include "movement_msgs/WalkingParamsMsg.h"
#include "movement_msgs/MotorDatasMsg.h"

static void runWalk(const Rhoban::IKWalkParameters& params, double timeLength, double& phase, double& time);

movement_msgs::MotorDatasMsg walkinRes;

#endif

/*
class Andar {
    public:
        Andar(ros::NodeHandle nh_);
        ~Andar();
    private:
        ros::NodeHandle nh;
        ros::Subscriber paramsWalkSub;
        movement_msgs::WalkingParamsMsg walkinReq;
        void init();
        static void runWalk(const Rhoban::IKWalkParameters& params, double timeLength, double& phase, double& time);
        void setParams(movement_msgs::WalkingParamsMsg::ConstPtr& request);

*/