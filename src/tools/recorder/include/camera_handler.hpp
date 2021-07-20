//
// Created by jhonas on 04/04/18.
//

#ifndef EDROM_CAMERA_NODE_HPP
#define EDROM_CAMERA_NODE_HPP


#include <ros/ros.h>
#include <opencv2/highgui/highgui.hpp>
#include <vision_msgs/Objects.h>
#include <opencv2/core/core.hpp>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <Camera.hpp>
#include <boost/filesystem.hpp>

class Camera_Handler
{
public:
	Camera_Handler();

	~Camera_Handler();

	void init(int argc, char **argv);

	cv::Mat getImage();

private:

	Camera cam;

	std::string videoPath;
	std::string imagePath;

	static void imageCallback(const vision_msgs::Objects &msg);

	ros::Subscriber subscriber;

	void startRecording();

};

#endif //EDROM_CAMERA_NODE_HPP
