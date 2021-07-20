#include "ContourSearcher.hpp"

ContourSearcher::ContourSearcher(){}

ContourSearcher::ContourSearcher(cv::Mat image)
{
	setImage(image);
}

void ContourSearcher::setImage(cv::Mat frame)
{
    contourVector.clear();
    contours.clear();
    convexContour.clear();
    double tempo;

	this->image = frame.clone();
	//Segurança:Evitar erro caso não tenha pixels brancos na imagem
	if(countNonZero(image) > 0)
	{ 
        cv::findContours(frame.clone(),contours,CV_RETR_EXTERNAL,CV_CHAIN_APPROX_SIMPLE);
		//CV_CHAIN_APPROX_NONE
		/*CV_RETR_EXTERNAL retrieves only the extreme outer contours. It sets hierarchy[i][2]=hierarchy[i][3]=-1 for all the contours.
		 * CV_CHAIN_APPROX_TC89_L1,CV_CHAIN_APPROX_TC89_KCOS applies one of the flavors of the Teh-Chin chain approximation algorithm.
		 */
	}
	if(contours.size() > 0)  
		hasContour = true;
	else
		hasContour = false;
		
	searchContours();
}

void ContourSearcher::searchContours()
{

	if(hasContour)
	{
		double biggestArea = 0;
		float radius;
		contourVector.resize(contours.size());
        convexContour.resize(contours.size());
		double circleArea;
		double contourPerimeter;
		
		for( int i = 0; i< contours.size(); i++ ) 
		{
			double area = contourArea(contours[i],false); 
			
			if(area <= MINIMUM_AREA)
			{
				contourVector.pop_back();
                convexContour.pop_back();
				contours.erase(contours.begin() + i);
				//retirando termos do vector os indices mudam
				i--;
				continue;
			}

			if(area > biggestArea)
			{
				biggestArea = area;           
				indexBiggestArea=i;   
			}

			circleArea = pow(radius,2)*M_PI;
			contourPerimeter = arcLength(contours[i],true);

			//Iniciando a struct contourInfo
			contourVector[i].index = i;
			contourVector[i].area = area;
			contourVector[i].perimeter = contourPerimeter;
			contourVector[i].percentageOfCircle = (area/circleArea)*100.0;
            
            cv::convexHull( cv::Mat(contours[i]),convexContour[i], false );
		}
	}

}

int ContourSearcher::getAmountOfContours()
{
	return(contourVector.size());
}

std::vector<cv::Point> ContourSearcher::getContour(int index)
{
	return getContour(index,false);
}

std::vector<cv::Point> ContourSearcher::getContour(int index,bool convex)
{
	int size = contours.size();
	std::vector<cv::Point> emptyVector;
	if(index < size)
    {
        if(convex)
            return(convexContour[index]);
        else
            return(contours[index]);
    }
	else 
		return(emptyVector); 

}

std::vector<cv::Point> ContourSearcher::getBiggestContour()
{
	return getBiggestContour(false);
}

std::vector<cv::Point> ContourSearcher::getBiggestContour(bool convex)
{
	std::vector<cv::Point> biggestContour;
	if(hasContour)
	{
		if(convex)
			cv::convexHull(cv::Mat(contours[indexBiggestArea]),biggestContour, true);
		else
			biggestContour = contours[indexBiggestArea];
	}
	return biggestContour;
}
   
cv::Mat ContourSearcher::getImageBiggestContour()
{
    return getImageOfContour(false,indexBiggestArea);
}

cv::Mat ContourSearcher::getImageBiggestContour(bool convex)
{
    return getImageOfContour(convex,indexBiggestArea);
}   

cv::Mat ContourSearcher::getImageOfContour(int index)
{
    return getImageOfContour(false,index);
}
    
cv::Mat ContourSearcher::getImageOfContour(bool convex,int index)
{
    cv::Mat blackImage = cv::Mat::zeros(image.size(), CV_8UC1);
    if(convex)
        drawContours(blackImage, convexContour , index ,255, -1);
    else
        drawContours(blackImage, contours , index ,255, -1);
    return blackImage;
}

std::vector<double> ContourSearcher::getAreas()
{
	std::vector<double> areas;
	if(hasContour)
	{
		for(int i = 0;i < contourVector.size(); i++)
			areas.push_back(contourVector[i].area);
	}
	return areas;
}

std::vector<double> ContourSearcher::getPerimeters()
{
	std::vector<double> perimeters;
	if(hasContour)
	{
		for(int i = 0;i < contourVector.size(); i++)
			perimeters.push_back(contourVector[i].perimeter);
	}
	return perimeters;
}

std::vector<double> ContourSearcher::getPercentageOfCircle()
{
	std::vector<double> percentageOfCircles;
	if(hasContour)
	{
		for(int i = 0;i < contourVector.size(); i++)
			percentageOfCircles.push_back(contourVector[i].percentageOfCircle);
	}
	return percentageOfCircles;
}

std::vector<std::vector<cv::Point> > ContourSearcher::getAllContours()
{
    return contours;
}

