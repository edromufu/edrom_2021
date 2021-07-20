#ifndef HUMANOIDCTRLNODE_H
#define HUMANOIDCTRLNODE_H


#include <iostream>
#include <fstream>
#include <string>
#include <unistd.h>
#include "movement_util/State.h"
#include "movement_util/Enums.h"
#include "movement_util/MathUtils.h"
#include "humanoid_loadmap/Mapping.h"

#include "ros/ros.h"

#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>


#include <dynamic_reconfigure/server.h>
#include <movement_msgs/HumanoidLipWalkingCtrlConfig.h>

#include <dynamic_reconfigure/server.h>
#include <movement_msgs/HumanoidCtrlConfig.h>

#include <dynamic_reconfigure/DoubleParameter.h>
#include <dynamic_reconfigure/Reconfigure.h>
#include <dynamic_reconfigure/Config.h>


#include <sensor_msgs/Imu.h>
#include <geometry_msgs/WrenchStamped.h>
#include <movement_msgs/HumanoidControlMsg.h>
#include <movement_msgs/LipFeedBack.h>
#include <movement_msgs/HumanoidPropertiesMsg.h>
#include <movement_msgs/MotorPIDMsg.h>
#include <movement_msgs/FFTMsg.h>
#include <movement_msgs/LoadMapConfigsSrv.h>
#include <movement_msgs/InterfaceSrv.h>


class HumanoidCtrlNode
{
public:

    //ROS Node
    ros::NodeHandle    nh;
    ros::NodeHandle    nh_private;

    typedef sensor_msgs::Imu                        ImuMsg;
    typedef message_filters::Subscriber<ImuMsg>     ImuSub;
    boost::shared_ptr<ImuSub>                       imuSubPtr;

    typedef geometry_msgs::WrenchStamped            TorqueMsg;
    typedef message_filters::Subscriber<TorqueMsg>  TorqueSub;
    boost::shared_ptr<TorqueSub>                    torqueSubPtr;

    typedef movement_msgs::LipFeedBack              LipMsg;
    typedef message_filters::Subscriber<LipMsg>     LipSub;
    boost::shared_ptr<LipSub>                       lipSubPtr;

    typedef movement_msgs::MotorPIDMsg              MotorPIDMsg;
    typedef message_filters::Subscriber<MotorPIDMsg>MotorPIDSub;
    boost::shared_ptr<MotorPIDSub>                  motorPIDSubPtr;
    movement_msgs::MotorPIDMsg                      currentMotorPID;

    typedef movement_msgs::HumanoidPropertiesMsg              HumanoidPropsMsg;
    typedef message_filters::Subscriber<HumanoidPropsMsg>     HumanoidPropsSub;
    boost::shared_ptr<HumanoidPropsSub>                       humanoidPropsSubPtr;


    //ROS Publishers
    ros::Publisher                 fftTopic;
    movement_msgs::FFTMsg          fftMsg;
    ros::Publisher                 motorPIDTopic;
    movement_msgs::MotorPIDMsg     motorPIDMsg;
    ros::Publisher                 imuTopic;
    sensor_msgs::Imu               imuMsg;
    ros::Publisher                    controlTopic;
    movement_msgs::HumanoidControlMsg controlMsg;

    //ROS Dynamic Reconfigure Server
    boost::mutex mutex;
    typedef movement_msgs::HumanoidCtrlConfig                 HumanoidCtrlConfig;
    typedef dynamic_reconfigure::Server<HumanoidCtrlConfig>   HumanoidCtrlConfigServer;
    boost::shared_ptr<HumanoidCtrlConfigServer>               config_server;


    //ROS Dynamic Reconfigure Client
    dynamic_reconfigure::ReconfigureRequest    srv_req;
    dynamic_reconfigure::ReconfigureResponse   srv_resp;
    dynamic_reconfigure::DoubleParameter       double_param;
    dynamic_reconfigure::Config                conf;


    //ROS  Services
    ros::ServiceClient                 mapCli;
    movement_msgs::LoadMapConfigsSrv   mapSrv;

    ros::ServiceClient            interfaceCli;
    movement_msgs::InterfaceSrv   interfaceSrv;
    //Timers
    ros::Timer runTimer;

    //Members
    Mapping map;
    int     robotDOF;
    int     urdfDOF;
    int     ikDOF;

    //Members
    double dt;
    double kpUpperBody;
    double kpHipRoll;
    double kpHipPitch;
    double kpKneePitch;
    double kpFootPitch;
    double kpFootRoll;
    double roll;
    double pitch;
    double yaw;
    double incl;
    double inclCtrl;
    double sideIncl;
    double torsoKp;
    double torsoKi;
    double torsoKd;
    double armKp;
    double armKi;
    double armKd;

    double phaseKp;
    double phaseKi;
    double phaseKd;
    double phaseRef;


    double rollDt;
    double rollInt;
    double rollOld;
    double timeDt;
    double timeOld;



    bool kpUpperBodyUpdate;
    bool kpHipRollUpdate;
    bool kpHipPitchUpdate;
    bool kpKneePitchUpdate;
    bool kpFootPitchUpdate;
    bool kpFootRollUpdate;

    bool   ctrl_flag;
    bool   arm_ctrl_flag;
    bool   torso_ctrl_flag;
    bool   phase_ctrl_flag;
    bool   slope_ctrl_flag;
    bool   foot_ctrl_flag;
    bool   updateParams;

    HumanoidCtrlNode(ros::NodeHandle nh_,ros::NodeHandle nh_private_);
    ~HumanoidCtrlNode();

    //Methods
    void loadMap();
    void loadPIDs();
    bool checkPIDConfig();
    void updatePIDconfigs();

    void imuCallback(const sensor_msgs::ImuPtr &msg);
    void motorPIDCallback(const movement_msgs::MotorPIDMsgPtr &msg);
    void torqueCallback(const geometry_msgs::WrenchStampedPtr &msg);
    void lipCallback(const movement_msgs::LipFeedBackPtr &msg);
    void humanoidPropsCallback(const movement_msgs::HumanoidPropertiesMsgPtr &humanoidPropsMsg);
    void callback(const ImuMsg::ConstPtr&    imu_msg,
                  const TorqueMsg::ConstPtr& torque_msg,
                  const LipMsg::ConstPtr&    lip_msg);
    void runCallBack(const ros::TimerEvent&);
    void reconfigCallback(movement_msgs::HumanoidCtrlConfig& config, uint32_t level);
    void send2Topic();
    void sendPID();

};

#endif // HUMANOIDCTRLNODE_H

