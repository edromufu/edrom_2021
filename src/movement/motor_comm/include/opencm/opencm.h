#ifndef OPENCM_H
#define OPENCM_H

#include "ros/ros.h"
#include "humanoid_loadmap/Mapping.h"
#include "movement_msgs/LoadMapConfigsSrv.h"
#include "movement_msgs/OpencmRequestMsg.h"
#include "movement_msgs/OpencmResponseMsg.h"
#include "movement_msgs/MotorRequestMsg.h"
#include "movement_msgs/MotorResponseMsg.h"
#include "movement_msgs/JointStateMsg.h"
#include "movement_msgs/LipParamsMsg.h"
#include "movement_msgs/HeadMoveMsg.h"
#include "movement_msgs/MovementStatesSrv.h"
#include <vector>
#include "movement_util/MathUtils.h"
#include "../../src/arduino/constants.h"
    //Essa forma de incluir arquivo não deve ser utilizada normalmente, nesse caso é necessária devido a configurações no ArduinoIDE

#define VEL 50
#define DP 5
#define INIT_VEL 5
#define LEFT_LIMIT 3062
#define RIGHT_LIMIT 1028
#define UP_LIMIT 1412
#define DOWN_LIMIT 2150
#define GAP 50

//Motor models
const int MX_106    = 302;
const int MX_106_2  = 321;
const int MX_64     = 310;
const int MX_64_2   = 311;
const int EX_106    = 107;
const int AX_12     =  12;
const int AX_18     =  18;
const int RX_64     =  64;
const int forcedFirstPose[20] = {1925, 2170, 2017, 2078, 3071, 1024, 2091, 2007, 1920, 2167, 2561, 2568, 1618, 2488, 2182, 1921, 2180, 1911, 2048, 2048};

class OpenCM
{
public:
    OpenCM(ros::NodeHandle nh_);
    ~OpenCM();
    int headDecision;
    int initPose[20]; 
    int headDecisionBefore;
    int notConvMotor18 = 2048;
    int notConvMotor19 = 2048;
    std::string moveParam;
    std::string stateBefore;
    std::string stateSM;
    std::vector<double> posWalk;
    std::vector<double> velWalk;
    std::vector<double> posCheck;
    std::vector<double> velCheck;


private:
    ros::NodeHandle nh;
    ros::Timer timer;
    ros::ServiceClient mapCli;
    ros::Publisher opencmRequestPub;
    ros::Publisher motorResponsePub;
    ros::Subscriber motorRequestSub;
    ros::Subscriber lipParamsSub;
    ros::Subscriber MoveCreatorSub;
    ros::Subscriber headSub;
    ros::Subscriber opencmResponseSub;
    ros::ServiceServer StateService;
    movement_msgs::LoadMapConfigsSrv mapMsg;
    movement_msgs::OpencmRequestMsg opencmReq;
    

    const int OPEN_CM_DOF = 20;
    const double CONST_VELOCITY = 0.3; // rad/s
    // Para os motores MX
    const double rad2motor    = 651.74;
    const double radvel2motor = 83.72;

    Mapping map;
    double dt;
    bool defaultCommand;
    bool shutdown;
    bool firstLoop;
    std::string write;
    std::string read;
    std::vector<int> position;
    std::vector<int> velocity;
    std::vector<int> data;
    std::vector<int> motorModel;
    std::vector<bool> motorsFound;
    std::vector<double> previousPosition;

    void loadMap();
    void init();
    void radian2MotorValue(std::vector<double> radPosition, std::vector<double> radVelocity);   
    void movecreatorValue(std::vector<double> movecreatorPosition, std::vector<double> movecreatorVelocity);
    void run(const ros::TimerEvent&);
    void motorRequest(const movement_msgs::MotorRequestMsg::ConstPtr& rqt);
    void lipFeedBack(const movement_msgs::LipParamsMsg::ConstPtr& res);
    void JointMoveCreatorSub(const movement_msgs::JointStateMsg::ConstPtr& rqtPages);
    void sendHeadPosition(const movement_msgs::HeadMoveMsg::ConstPtr& msg);
    void switchHead();
    void opencmResponse(const movement_msgs::OpencmResponseMsg::ConstPtr& msg);
    int convertToMX(const int, const int);
    bool CurrentState(movement_msgs::MovementStatesSrv::Request  &req, movement_msgs::MovementStatesSrv::Response &res);

};

#endif
