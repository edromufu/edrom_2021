/**
 * @file /include/robot_qt/qnode.hpp
 *
 * @brief Communications central!
 *
 * @date February 2011
 **/
/*****************************************************************************
** Ifdefs
*****************************************************************************/

#ifndef robot_qt_QNODE_HPP_
#define robot_qt_QNODE_HPP_

/*****************************************************************************
** Includes
*****************************************************************************/

#include <ros/ros.h>





#include <message_filters/subscriber.h>
#include <sensor_msgs/Imu.h>
#include <movement_msgs/FFTMsg.h>
#include <movement_msgs/LearningMsg.h>
#include <movement_msgs/LipParamsMsg.h>
#include <movement_msgs/HumanoidPropertiesMsg.h>
#include <movement_msgs/LipParamsSrv.h>
#include <movement_msgs/LipCmdSrv.h>
#include <movement_msgs/LipCtrlSrv.h>
#include <std_srvs/Empty.h>

#include <dynamic_reconfigure/DoubleParameter.h>
#include <dynamic_reconfigure/Reconfigure.h>
#include <dynamic_reconfigure/Config.h>



#include <string>
#include <QThread>
#include <QStringListModel>


typedef sensor_msgs::Imu  ImuMsg;
typedef message_filters::Subscriber<ImuMsg> SubImu;

typedef movement_msgs::FFTMsg  FFTMsg;
typedef message_filters::Subscriber<FFTMsg> SubFFT;

typedef movement_msgs::LearningMsg  LearningMsg;
typedef message_filters::Subscriber<LearningMsg> SubLearning;

typedef movement_msgs::LipParamsMsg  ParamsMsg;
typedef message_filters::Subscriber<ParamsMsg> SubParams;

typedef movement_msgs::HumanoidPropertiesMsg  HumanoidPropsMsg;
typedef message_filters::Subscriber<HumanoidPropsMsg> SubHumanoidProps;

//qRegisterMetaType<ImuMsg>("ImuMsg");

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace robot_qt {

/*****************************************************************************
** Class
*****************************************************************************/

class QNode : public QThread {
    Q_OBJECT
public:

	QNode(int argc, char** argv );
	virtual ~QNode();
	bool init();
    bool shutdown();
	void run();
    void imuCallback(const sensor_msgs::ImuPtr &imuMsg);
    void learningCallback(const movement_msgs::LearningMsgPtr &learningMsg);
    void fftCallback(const movement_msgs::FFTMsgPtr &fftMsg);
    void lipParamsCallback(const movement_msgs::LipParamsMsgPtr &paramsMsg);
    void humanoidPropsCallback(const movement_msgs::HumanoidPropertiesMsgPtr &humanoidPropsMsg);

public Q_SLOTS:
    void sendWalkingParams(double tS, double tD, double stepH, double zCCorr);
    void sendWalkingCmd(double vx,double vy,double vz,bool walk_flag);
    void sendWalkingCtrl(double delayR, double delayL, double delayAll, double kpLeg, double kpFoot, double kpGround);
    void sendModelParams(double squat,double open,double incl);
    void sendReset();
Q_SIGNALS:
    void sendLearningUpdate(const LearningMsg &learningMsg);
    void sendImuUpdate(const ImuMsg &imuMsg);
    void sendFFTUpdate(const FFTMsg &fftMsg);
    void sendParamsUpdate(const ParamsMsg &paramsMsg);
    void sendHumanoidPropsUpdate(const HumanoidPropsMsg &humanoidPropsMsg);


    void rosShutdown();

private:
	int init_argc;
	char** init_argv;
    boost::shared_ptr<SubImu>      readImu;
    boost::shared_ptr<SubFFT>      readFFT;
    boost::shared_ptr<SubLearning> readLearning;
    boost::shared_ptr<SubParams> readParams;
    boost::shared_ptr<SubHumanoidProps> readHumanoidProps;

    ros::ServiceClient walkParamCli;
    ros::ServiceClient walkCmdCli;
    ros::ServiceClient walkCtrlCli;
    ros::ServiceClient gazeboResetCli;

    //ROS Dynamic Reconfigure
    dynamic_reconfigure::ReconfigureRequest  srv_req;
    dynamic_reconfigure::ReconfigureResponse srv_resp;
    dynamic_reconfigure::DoubleParameter       double_param;
    dynamic_reconfigure::Config              conf;

    movement_msgs::LipParamsSrv   walkParamSrv;
    movement_msgs::LipCmdSrv      walkCmdSrv;
    movement_msgs::LipCtrlSrv     walkCtrlSrv;
    std_srvs::Empty               gazeboResetSrv;

};

}  // namespace robot_qt

#endif /* robot_qt_QNODE_HPP_ */
