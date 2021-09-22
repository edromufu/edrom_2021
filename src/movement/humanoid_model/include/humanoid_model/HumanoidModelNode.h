#ifndef HUMANOIDMODELNODE_H
#define HUMANOIDMODELNODE_H


#include <iostream>
#include <fstream>
#include <string>
#include <unistd.h>
#include "humanoid_model/HumanoidModel.h"
#include "movement_util/State.h"
#include "movement_util/MathUtils.h"
#include "movement_util/Enums.h"
#include "humanoid_loadmap/Mapping.h"
#include "eigen_conversions/eigen_msg.h"

#include "ros/ros.h"

#include <dynamic_reconfigure/server.h>
#include <movement_msgs/HumanoidModelConfig.h>
#include <movement_msgs/HumanoidModelMoveCreatorConfig.h>

#include <message_filters/subscriber.h>

#include "movement_msgs/JointStateMsg.h"
#include "movement_msgs/EndEffStateMsg.h"
#include "movement_msgs/HumanoidControlMsg.h"
#include "movement_msgs/LoadMapConfigsSrv.h"
#include "movement_msgs/LoadHumanoidPropertiesSrv.h"
#include "movement_msgs/HumanoidPropertiesMsg.h"
#include "movement_msgs/MotorRequestMsg.h"



class HumanoidModelNode
{
public:
    HumanoidModelNode(ros::NodeHandle nh_,ros::NodeHandle nh_private_,ros::NodeHandle nh_private_walk_,ros::NodeHandle nh_private_movecreator_);
    ~HumanoidModelNode();
private:
    Mapping map;
    int     robotDOF;
    int     urdfDOF;
    int     ikDOF;
    double  dt;
    //ROS Node
    ros::NodeHandle    nh;
    ros::NodeHandle    nh_private;
    ros::NodeHandle    nh_private_walk;
    ros::NodeHandle    nh_private_movecreator;

    //ROS Subscribers
    typedef movement_msgs::EndEffStateMsg               EndEffStateMsg;
    typedef message_filters::Subscriber<EndEffStateMsg> EndEffStateSub;
    boost::shared_ptr<EndEffStateSub>                   endEffStateSubPtr;

    typedef movement_msgs::HumanoidControlMsg               HumanoidControlMsg;
    typedef message_filters::Subscriber<HumanoidControlMsg> HumanoidControlSub;
    boost::shared_ptr<HumanoidControlSub>                   humanoidControlSubPtr;

    HumanoidControlMsg  humanoidControlMsg;


    //ROS Publishers
    ros::Publisher                   jointStateTopic;
    //JointStateMsg                    jointMsg;
    ros::Publisher                   endEffStateTopic;
    EndEffStateMsg                   endEffMsg;

    ros::Publisher                   motorCommPub;
    ros::Publisher                             humanoidPropsTopic;
    movement_msgs::HumanoidPropertiesMsg       humanoidPropsMsg;


    //ROS Timers
    ros::Timer runTimer;


    //ROS  Services
    ros::ServiceClient                 mapCli;
    movement_msgs::LoadMapConfigsSrv   mapMsg;
    ros::ServiceServer                 humanoidPropsSrv;

    //ROS Dynamic Reconfigure Server
    typedef movement_msgs::HumanoidModelConfig                 HumanoidModelConfig;
    typedef dynamic_reconfigure::Server<HumanoidModelConfig>   HumanoidModelConfigServer;
    boost::shared_ptr<HumanoidModelConfigServer>               config_server;

    typedef movement_msgs::HumanoidModelMoveCreatorConfig                 HumanoidModelMoveCreatorConfig;
    typedef dynamic_reconfigure::Server<HumanoidModelMoveCreatorConfig>   HumanoidModelMoveCreatorConfigServer;
    boost::shared_ptr<HumanoidModelMoveCreatorConfigServer>               config_server_mov;

    HumanoidModelMoveCreatorConfig  modelMoveCreatorMsg;


    //Config Params
    boost::mutex mutex;
    double squat;
    double open;
    double incl;
    double sideIncl;
    double footIncl;
    double comX;
    double comY;
    double comZ;
    double arm0;
    double arm1;
    double arm2;
    bool   override_com;
    bool   calcInvDyn;
    bool   calcZMP;
    bool   calcCOM;
    bool   calcIK;
    bool   calcFK;
    bool   setRobotFlag;
    bool   updateJointState;

    //RoboModel
    HumanoidModel  robot;
    std::string    fUrdf;
    BodyPointState trunk;
    BodyPointState lLegBP;
    BodyPointState rLegBP;
    std::vector<BodyPointState> vecBody;
    std::vector<BodyPointState> vecBodyBuff;

    Eigen::Vector3d  zmpPoint;
    Eigen::Vector3d  comPoint;
    Eigen::Vector3d  footComPoint;
    Eigen::VectorXd  torq;


    //Methods

    bool humanoidPropertiesSrv(movement_msgs::LoadHumanoidPropertiesSrv::Request  &msg,
                               movement_msgs::LoadHumanoidPropertiesSrv::Response &res);
    void sendJointState(const JointState &jointState, const double &dt);
    void jointStateCallback(const movement_msgs::JointStateMsgPtr &jointState);
    void humanoidControlCallback(const movement_msgs::HumanoidControlMsgPtr &humanoidControl);
    void endEffStateCallback(const movement_msgs::EndEffStateMsgPtr &endEffState);
    void loadRobotParams();
    void setRobot(double squat, double open, double incl, double sideIncl, double footIncl);
    void loadMap();
    void reconfigCallback(movement_msgs::HumanoidModelConfig& config, uint32_t level);
    void reconfigMoveCreatorCallback(movement_msgs::HumanoidModelMoveCreatorConfig& config, uint32_t level);
    void runCallBack(const ros::TimerEvent&);
    void sendHumanoidProps(const movement_msgs::HumanoidPropertiesMsg &msg);


};

#endif // HUMANOIDMODELNODE_H
