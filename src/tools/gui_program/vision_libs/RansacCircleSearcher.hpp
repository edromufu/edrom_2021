#ifndef __RansacCIRCLESEARCHER_HPP_INCLUDED__
#define __RansacCIRCLESEARCHER_HPP_INCLUDED__

#include "opencv2/opencv.hpp"
#include <vector>
#include <cmath>
#include "Camera.hpp"

struct comparador 
{
    bool operator() (cv::Point pt1, cv::Point pt2)
    {
        return(pt1.x > pt2.x);
    }
};

class RansacCircleSearcher
{
public:
    RansacCircleSearcher();
    RansacCircleSearcher(cv::Mat roiOfContour);
    void loadContour(cv::Mat roiOfContour);
    void showCircle(char* window, cv::Mat image);
    std::vector<cv::Point> getCirclePercentage();
    std::vector<cv::Point> getCircleCenter();
    std::vector<float> getCircleRadius();
    
private:
    comparador compare;
    cv::Mat image;
    std::vector<cv::Point> pointPositions;
    cv::Point randomPoints[3];
    double minCirclePercentage;
    std::vector<cv::Point> bestCircleCenter;
    std::vector<float> bestCircleRadius;
    std::vector<cv::Point> bestCirclePercentage;
    
    void getPointPositions(cv::Mat binaryImage);
    void getRandomPoints();
    void getCircle(cv::Point& p1,cv::Point& p2,cv::Point& p3, cv::Point& center, float& radius);
    int verifyCircle(cv::Mat distance,cv::Point center,float radius, std::vector<cv::Point> &inlierSet);
};

#endif // __RansacCIRCLESEARCHER_HPP_INCLUDED__
