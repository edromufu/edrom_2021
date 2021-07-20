#ifndef LINESFILTER_HPP_INCLUDED
#define LINESFILTER_HPP_INCLUDED

#include "opencv2/opencv.hpp" 
#include "Camera.hpp"
#include <iostream>
#include <vector>
#include "Field.hpp"

class LinesFilter
{
	public:
		LinesFilter();
        void setImage(cv::Mat inputImage, std::string xmlPath);
		void ReadFile(cv::FileStorage file);
        cv::Mat applyHoughFilter();
        cv::Mat applyCannyFilter();

        std::string which_Hough;

        double cannyParam_0;
        double cannyParam_1;
        int cannyParam_2;
        bool cannyParam_3;

        double SHoughParam_0;
        double SHoughParam_1;
        int SHoughParam_2;
        double SHoughParam_3;
        double SHoughParam_4;

        double PHoughParam_0;
        double PHoughParam_1;
        int PHoughParam_2;
        double PHoughParam_3;
        double PHoughParam_4;

	private:
		cv::FileStorage file;

        cv::Mat cannyImage;
        cv::Mat image;

        bool onlyOnce;
        std::string lineColorPath,linePath;

        bool read;
		void readFilter();
};

#endif
