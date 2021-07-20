#include "camera_handler.hpp"


Camera_Handler::Camera_Handler()
{
	std::string path = __FILE__;
	videoPath = path.substr(0, path.find("src/"));
	videoPath += "videos/";
}

Camera_Handler::~Camera_Handler()
{
	Camera::endRecording();
}

void Camera_Handler::imageCallback(const vision_msgs::Objects &msg)
{
	try
	{
		cv::Mat image = cv_bridge::toCvCopy(msg.image, sensor_msgs::image_encodings::BGR8)->image;
		Camera::record(image);
	}

	catch (cv_bridge::Exception &e)
	{
		printf("Error!");
	}

}

void Camera_Handler::init(int argc, char **argv)
{

	ros::init(argc, argv, "vision");
	ros::NodeHandle nh;

	startRecording();
	subscriber = nh.subscribe("/objects", 1000, imageCallback);


	ros::spin();
}

void Camera_Handler::startRecording()
{
	boost::filesystem::path p(videoPath);
	int new_file = 1;
	int last = 0;

	for (auto& entry : boost::make_iterator_range(boost::filesystem::directory_iterator(p), {}))
	{
		std::string file = std::string(entry.path().filename().c_str());
		std::string name = file.substr(0, file.find("."));
		last = atoi(name.c_str());

		if (last >= new_file)
		{
			new_file = last + 1;
		}
	}

	Camera::openRecorder(videoPath + std::to_string(new_file) + ".avi");

}


int main(int argc, char **argv)
{
	Camera_Handler subs;
	subs.init(argc, argv);

}