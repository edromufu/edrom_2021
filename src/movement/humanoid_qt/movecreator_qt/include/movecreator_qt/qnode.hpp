/**
 * @file /include/movecreator_qt/qnode.hpp
 *
 * @brief Communications central!
 *
 * @date February 2011
 **/
/*****************************************************************************
** Ifdefs
*****************************************************************************/

#ifndef movecreator_qt_QNODE_HPP_
#define movecreator_qt_QNODE_HPP_

/*****************************************************************************
** Includes
*****************************************************************************/

#include <ros/ros.h>
#include "ros/package.h"
#include <string>
#include <iostream>
#include <string>
#include <QThread>
#include <QStringListModel>
#include <vector>
#include <message_filters/subscriber.h>
#include <movement_msgs/InterfaceSrv.h>
#include "movement_msgs/MotorSetSrv.h"
#include "movement_msgs/MovementSrv.h"
#include "movement_msgs/DynamixelCreatorSrv.h"



/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace movecreator_qt {

/*****************************************************************************
** Class
*****************************************************************************/

class QNode : public QThread {
    Q_OBJECT
public:
	QNode(int argc, char** argv );
	virtual ~QNode();
	bool init();
	bool init(const std::string &master_url, const std::string &host_url);
	void run();

	/*********************
	** Logging
	**********************/
	enum LogLevel {
	         Debug,
	         Info,
	         Warn,
	         Error,
	         Fatal
	 };

	QStringListModel* loggingModel() { return &logging_model; }
	void log( const LogLevel &level, const std::string &msg);
    std::vector<double> getMotorsPosition() const;

    std::vector<int> getActiveMotors() const;

public Q_SLOTS:
    void setTorque(std::vector<int> ids, std::vector<bool> torque);
    void scanMotor();
    void scanActiveMotors();
    void playPage(std::string path);
    void goPose(std::string path);
	bool callPage(movement_msgs::MovementSrv::Request &msg, movement_msgs::MovementSrv::Response &res);
Q_SIGNALS:
	void loggingUpdated();
    void rosShutdown();
    void scanFinished();
    void idScanFinished();
private:
	int init_argc;
	char** init_argv;
	ros::ServiceServer movementSrv;
    ros::ServiceClient interfaceCli;
    ros::ServiceClient motorSetCli;
	ros::ServiceClient dynamixelCli;
    movement_msgs::InterfaceSrv interfaceSrv;
    movement_msgs::MotorSetSrv motorSetSrv;
	movement_msgs::DynamixelCreatorSrv dynamixelCreatorSrv;
    std::vector<double> motorsPosition;
    std::vector<int> activeMotors;
	std::string robotName;
    QStringListModel logging_model;
	
};

}  // namespace movecreator_qt

#endif /* movecreator_qt_QNODE_HPP_ */
