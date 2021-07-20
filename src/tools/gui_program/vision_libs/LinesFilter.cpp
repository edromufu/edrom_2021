#include "LinesFilter.hpp"

LinesFilter::LinesFilter()
{
    cannyParam_2 = 3, cannyParam_3 = 0;
    SHoughParam_0 = 1, SHoughParam_1 = 1, SHoughParam_2 = 1, SHoughParam_3 = 1, SHoughParam_4 = 1;
    PHoughParam_0 = 1, PHoughParam_1 = 1, PHoughParam_2 = 1, PHoughParam_3 = 1, PHoughParam_4 = 1;
    which_Hough = "Standard";
    read = false;
    onlyOnce = false;
}

void LinesFilter::setImage(cv::Mat inputImage, std::string xmlPath)
{

    image = inputImage.clone();

    Field field;
    field.setImage(image, xmlPath);
    image = field.getField();
    if(!onlyOnce)
    {
        lineColorPath = xmlPath + "LineWhiteParameters.xml";
        linePath = xmlPath + "LinesParameters.xml";
        onlyOnce = true;
    }

    cv::FileStorage parametersFile(lineColorPath,cv::FileStorage::READ);
    ColorFilter Colorfilter(parametersFile);
    image = Colorfilter.applyFilter(image);


    cv::FileStorage parametersFileLines(linePath,cv::FileStorage::READ);
    if(!read)
    {
        ReadFile(parametersFileLines);
        read = true;
    }

}

void LinesFilter::ReadFile(cv::FileStorage file)
{
	this->file = file;
	readFilter();
}

void LinesFilter::readFilter()
{
    file ["canny_threshold"] >> cannyParam_0;
	file ["canny_apertureSize"] >> cannyParam_2;
	file ["canny_L2gradient"] >> cannyParam_3;
	
    file ["which_hough"] >> which_Hough;
	if (which_Hough == "Standard")
	{
		file [ "Standard_rho" ] >> SHoughParam_0;
		file [ "Standard_theta"] >> SHoughParam_1;
		file [ "Standard_threshold" ] >> SHoughParam_2;
		file [ "srn" ] >> SHoughParam_3;
		file [ "stn" ] >> SHoughParam_4;
        SHoughParam_1 = SHoughParam_1*CV_PI/180;
	}
    else if (which_Hough == "Probabilistic")
	{
        file [ "Probabilistic_rho" ] >> PHoughParam_0;
        file [ "Probabilistic_theta"] >> PHoughParam_1;
        file [ "Probabilistic_threshold" ] >> PHoughParam_2;
		file [ "minLineLength" ] >> PHoughParam_3;
		file [ "maxLineGap" ] >> PHoughParam_4;
	}

	file.release();
}

cv::Mat LinesFilter::applyCannyFilter()
{
    double canny1 = 0, canny2 = 0;
	cv::Mat outputImage;
    canny1 = cannyParam_0;
    canny2 = (double)(cannyParam_0/3.0);
    cv::Canny(image, outputImage, canny1, canny2, cannyParam_2, cannyParam_3);

    cannyImage = outputImage.clone();
	return outputImage;
}

cv::Mat LinesFilter::applyHoughFilter()
{
    std::vector<cv::Vec2f> lines;
    std::vector<cv::Vec4i> points;
    applyCannyFilter();

    if(which_Hough == "Standard")
    {
        cv::HoughLines(cannyImage, lines, SHoughParam_0, SHoughParam_1, SHoughParam_2, SHoughParam_3, SHoughParam_4);
        std::cout << "1\n";
    	for( int i = 0; i < lines.size(); i++ )
	    {
	       float rho = lines[i][0], theta = lines[i][1];
	       cv::Point pt1, pt2;
	       double a = cos(theta), b = sin(theta);
	       double x0 = a*rho, y0 = b*rho;
	       pt1.x = cvRound(x0 + 1000*(-b));
	       pt1.y = cvRound(y0 + 1000*(a));
	       pt2.x = cvRound(x0 - 1000*(-b));
	       pt2.y = cvRound(y0 - 1000*(a));
	       cv::line( cannyImage, pt1, pt2, cv::Scalar(255,255,255), 3, CV_AA);
	    }
    
    }
    else if(which_Hough == "Probabilistic")
    {
        cv::HoughLinesP(cannyImage, points, PHoughParam_0, PHoughParam_1, PHoughParam_2, PHoughParam_3, PHoughParam_4);
        for( size_t i = 0; i < points.size(); i++ )
        {
//            if (abs(points[i][1]-points[i][3])<30){
                cv::line( cannyImage, cv::Point(points[i][0], points[i][1]), cv::Point(points[i][2], points[i][3]),
                        cv::Scalar(255,255,255), 3, 16 );
//            }
        }

    }
    return cannyImage;
}
