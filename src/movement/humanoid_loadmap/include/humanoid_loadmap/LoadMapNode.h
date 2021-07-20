#ifndef LOADMAPNODE_H
#define LOADMAPNODE_H


#include <iostream>
#include <fstream>
#include <string>
#include <unistd.h>
#include "humanoid_loadmap/Loader.h"
#include "humanoid_loadmap/Mapping.h"
#include "eigen_conversions/eigen_msg.h"


#include "ros/ros.h"
#include <ros/package.h>


#include <std_srvs/Empty.h>
#include <movement_msgs/IDMapMsg.h>
#include <movement_msgs/LoadMapConfigsSrv.h>



class LoadMapNode
{
public:

	//Members
	std::string fEnum;
	std::string fUrdf;
	std::string fRobot;
	std::string fIk;
	
	bool fEnumFlag;
	bool fUrdfFlag;
	bool fRobotFlag;
	bool fIkFlag;
	
	Mapping     map;
	
    //ROS Node
    ros::NodeHandle    nh;
    
    //ROS  Services
    ros::ServiceServer loadSrv;

    LoadMapNode(ros::NodeHandle nh_);
    ~LoadMapNode();

    //Methods
	bool load(movement_msgs::LoadMapConfigsSrv::Request  &load,
			  movement_msgs::LoadMapConfigsSrv::Response &res);
	
};

#endif // LOADMAPNODE_H

