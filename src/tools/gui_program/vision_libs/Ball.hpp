#ifndef __BALL_HPP_INCLUDED__
#define __BALL_HPP_INCLUDED__

#include "opencv2/opencv.hpp"
#include <vector>
#include <cmath>
#include "ColorFilter.hpp"
#include "ContourSearcher.hpp"
#include "RansacCircleSearcher.hpp"
#include "Field.hpp"
#include "Camera.hpp"

class Ball
{
public:

    Ball();
    Ball(cv::Mat image,std::string xmlPath);

    int key;
    bool enableTracking = true;

    void setImage(cv::Mat image, std::string xmlPath);
    void varyRadiusMax(int max_raio);
    void varyRadiusMin(int min_raio);
    void varyCirclePercent(int percent_circle);
    void varyEpsilon(int eps);
    void varyMinArea(int min_area);
    void varyMaxArea(int max_area);
    void setTracking();
    cv::Mat getBestContours();

    void showBall();
    cv::Point getBall();
    bool found();
    cv::Rect getTracker();
    double getBallArea();

private:
    
    int MIN_DIFFERENCE_RADIUS;
    int MAX_DIFFERENCE_RADIUS;
    int MIN_PERCENTAGE_CIRCLE;
    int MIN_AREA;
    int MAX_AREA;
    int numClusters;
    int epsilon;

    
    cv::Mat image;
    cv::Mat binaryImage;
    cv::Mat blackBinaryImage;
    cv::Mat gray;
    cv::Mat imageOfContour;
    
    ContourSearcher contours;
    std::vector<cv::Point> center;
    std::vector<float> radius;
    std::vector<cv::Point> centers;
    int biggestCluster;
    int blackPixels = 0;

    RansacCircleSearcher searcher;
    bool onlyOnce;
    std::string path, colorPath, darkPath;

    cv::FileStorage file;
    bool read;
    bool debug;
    bool ballFound = false;
    bool flag = false;

    bool failedTrack = true;
    int failures = 0;

    cv::Ptr<cv::Tracker> tracker1;
    cv::Ptr<cv::Tracker> tracker2;
    cv::Rect2d roi, roi2;
    cv::Point rectTopLeft;

    void kmeans(std::vector<cv::Point> circles);
    void crudeSearch();
    void fineSearch(std::vector<int>contoursToBeAnalysed);
    void ReadFile(cv::FileStorage file);
    void readFilter();
    void increasePrecision();

};

#endif //__BALL_HPP_INCLUDED__
