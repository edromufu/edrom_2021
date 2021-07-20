#ifndef __FIELD_HPP_INCLUDED__
#define __FIELD_HPP_INCLUDED__

#include "opencv2/opencv.hpp"
#include "ColorFilter.hpp"
#include "ContourSearcher.hpp" 

class Field
{
public:

    Field();
    Field(cv::Mat image,std::string xmlPath);
    void setImage(cv::Mat image, std::string xmlPath);
    
    cv::Mat getField();
    cv::Mat getOutsideOfField();
    cv::Mat getBinaryField();
    
    void showField();
    void showOutsideOfField();

    int key;   
private:

    cv::Mat frame;
    cv::Mat field;
    cv::Mat outsideOfField;
    cv::Mat binaryField;

    bool onlyOnce;
    std::string path;

    void showImage(cv::Mat image);
};

#endif //__FIELD_HPP_INCLUDED__
