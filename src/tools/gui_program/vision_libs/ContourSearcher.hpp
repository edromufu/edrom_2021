#ifndef __CONTOUR_SEARCHER_HPP_INCLUDED
#define __CONTOUR_SEARCHER_HPP_INCLUDED

#include "opencv2/opencv.hpp"
#include <vector>
#include <cmath>
#include "Camera.hpp"

class ContourSearcher
{
public:
	struct contourInfo
	{
		int index;
		double area;
		double perimeter;
		double percentageOfCircle;
	};

	ContourSearcher();
	ContourSearcher(cv::Mat image);
	void setImage(cv::Mat image);
	
	int getAmountOfContours();
    
	std::vector<cv::Point> getContour(int index);
    std::vector<cv::Point> getContour(int index,bool convex);
    
    std::vector<cv::Point> getBiggestContour();
	std::vector<cv::Point> getBiggestContour(bool convex);
    
    cv::Mat getImageBiggestContour();
    cv::Mat getImageBiggestContour(bool convex);
    cv::Mat getImageOfContour(int index);
    cv::Mat getImageOfContour(bool convex,int index);
    
	std::vector<double> getAreas();
	std::vector<double> getPerimeters();
	std::vector<double> getPercentageOfCircle();
    std::vector<std::vector<cv::Point> > getAllContours();
	std::vector<contourInfo> contourVector;
    double getRadius(std::vector<cv::Point> contour);
	
private:

	//Retirar ruídos e considerar apenas contornos de tamanho significativo
    const static int MINIMUM_AREA = 1;
	

	cv::Mat image;
	std::vector<std::vector<cv::Point> > contours;
    std::vector<std::vector<cv::Point> > convexContour;
    
	bool hasContour;
	int indexBiggestArea;
	void searchContours();
};




#endif //__CONTOUR_SEARCHER_HPP_INCLUDED
