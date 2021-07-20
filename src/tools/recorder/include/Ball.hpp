#ifndef __BALL_HPP_INCLUDED__
#define __BALL_HPP_INCLUDED__

#include <vector>
#include <cmath>
#include "Camera.hpp"
#include "opencv2/opencv.hpp"
#include <opencv2/tracking.hpp>
// #include <opencv2/tracking/tracking.hpp>
#include <opencv2/core/utility.hpp>
#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>

class Ball
{
public:

    Ball();
    void tracking(cv::Mat image, cv::Point ball, cv::Point rect_size);
    void showBall(cv::Mat image);


private:
    bool initialized = false;
    bool failedTracking = false;
    cv::Ptr<cv::Tracker> tracker1;
    cv::Ptr<cv::Tracker> tracker2;
    cv::Rect2d roi, roi2;

    int failures = 0;

};

#endif //__BALL_HPP_INCLUDED__
