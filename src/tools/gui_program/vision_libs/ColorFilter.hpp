#ifndef COLORFILTER_HPP_INCLUDED
#define COLORFILTER_HPP_INCLUDED

#include "opencv2/opencv.hpp" 
#include "Camera.hpp"
#include <iostream>
#include <vector>

class ColorFilter
{
public:

	ColorFilter();
	ColorFilter(cv::FileStorage file);
	// ColorFilter(std::string fileName);	
	cv::Mat applyFilter(cv::Mat inputImage);
	
private:

	std::string firstButton,secondButton,thirdButton;
	cv::FileStorage file;
	
	int maxFirstParam;
	
	// static const int BGR_COLORSPACE = 0;
	// static const int HSV_COLORSPACE = 1;
	// static const int YCC_COLORSPACE = 2;
	
	std::string colorSpace;
	
	int firstParam[2];
	int secondParam[2];
	int thirdParam[2];
	
	struct derode
	{
		derode():derodeType(0),value(0),dilate(false){}
		
		int derodeType;
		int value;
		bool dilate;
	};
	std::vector <derode> dilateErode;
	
	// void createWindow();
	// void createFilter();
	// void saveFilter();
	void readFilter();	
};

#endif //COLORFILTER_HPP_INCLUDED
