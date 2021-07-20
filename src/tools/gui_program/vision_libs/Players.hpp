#ifndef PLAYERS_HPP
#define PLAYERS_HPP


#include "Camera.hpp"
#include "ContourSearcher.hpp"
#include "ColorFilter.hpp"
#include "Field.hpp"

enum teams{BLUE, PINK};

class Players
{
public:
    Players();
    Players(teams aliados);

	void setAlly(teams ally);
    void setImage(cv::Mat image, std::string xmlPath);
    cv::Mat getInsideField();
	std::vector<cv::Point> getCentroides();

    bool friendly;

private:

    cv::Mat enemies;

    cv::Mat image;
    cv::Mat blueImage, pinkImage, binaryImage,test;
    cv::Mat insideField;
    bool onlyOnce = false;
    std::string bluePath, pinkPath, fieldPath;
    std::vector<std::vector<cv::Point> > contornos;
    std::vector<cv::Point> centroides;

    void calcCentroides(std::vector<std::vector<cv::Point> > contorno);


};

#endif // PLAYERS_HPP
