#ifndef __GOAL_HPP_INCLUDED__
#define __GOAL_HPP_INCLUDED__

#include "opencv2/opencv.hpp"
#include <vector>

class Goal
{
public:
    Goal();
    Goal(cv::Mat image, std::string xmlPath);
    void setImage(cv::Mat image, std::string xmlPath);
    void processImage(cv::Mat field);
    cv::Point getGoal();
    void showGoal(cv::Mat output, cv::Point goal);
    cv::Mat getIntersection();

    std::vector<cv::Point> getPosts();
    int key;
    int whitePix;
    int blackLimit;
    bool found();

private:
    cv::Mat frame;
    cv::Mat binaryImage;
    cv::Mat intersecFieldBinary;

    std::vector<cv::Point> posts;
    std::vector<std::vector <cv::Point> > coords;
    std::vector<cv::Point> possiblePost;

    cv::Point goal;

    bool onlyOnce;
    bool read;
    bool debug;

    void getCoordinates(cv::Mat image, cv::Mat binary);
    void mediaPoints();
    void isPost(cv::Mat binary, unsigned int limite);

    cv::FileStorage file;
    std::string hsvPath;
    std::string yccPath;
    std::string path;
    cv::Point findGoal();


    void readFilter(cv::FileStorage xml);
};

#endif
