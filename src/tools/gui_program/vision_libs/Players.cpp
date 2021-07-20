#include "Players.hpp"

Players::Players(){}

Players::Players(teams aliados)
{
    if(aliados == BLUE)
    {
        enemies = pinkImage;
    }
    else
    {
        enemies = blueImage;
    }
}

void Players::setAlly(teams ally)
{
	if(ally == BLUE)
	{
		enemies = pinkImage;
	}
	else
	{
		enemies = blueImage;
	}
}

void Players::setImage(cv::Mat image, std::string xmlPath)
{

    if(!onlyOnce)
    {
        bluePath = xmlPath + "BlueParameters.xml";
        pinkPath = xmlPath + "PinkParameters.xml";
        fieldPath = xmlPath + "FieldParameters.xml";
        onlyOnce = true;
    }
    cv::Mat field;
    cv::FileStorage parametersFileBlue(bluePath, cv::FileStorage::READ);
    ColorFilter filterBlue(parametersFileBlue);
    blueImage = filterBlue.applyFilter(image);

    cv::FileStorage parametersFilePink(pinkPath, cv::FileStorage::READ);
    ColorFilter filterPink(parametersFilePink);
    pinkImage = filterPink.applyFilter(image);

    cv::FileStorage parametersFileField(fieldPath, cv::FileStorage::READ);
    ColorFilter filterField(parametersFileField);
    field = filterField.applyFilter(image);
    insideField = cv::Mat::zeros(image.rows,image.cols, CV_8UC1);

    for(int i = 0; i < image.cols; i++)
    {
        for(int j = 0; j < image.rows; j++)
        {
            if(image.at<cv::Vec3b>(j,i) != cv::Vec3b(0,0,0) && field.at<uchar>(j,i) == 0)
                insideField.at<uchar>(j,i) = 255;
            else
                insideField.at<uchar>(j,i) = 0;
        }
    }

    ContourSearcher contours;
    contours.setImage(insideField);
    contornos = contours.getAllContours();

    binaryImage = blueImage & pinkImage;

    if(cv::countNonZero(enemies) > 0 && !enemies.empty())
    {
        std::vector <std::vector<cv::Point> > allContours;
        ContourSearcher enemyContours;
        enemyContours.setImage(enemies);
        allContours = enemyContours.getAllContours();

        calcCentroides(allContours);
    }
}

void Players::calcCentroides(std::vector<std::vector<cv::Point> > contorno)
{
    for(int i = 0; i < contorno.size(); i++)
    {
        cv::Moments mom = cv::moments(contorno[i]);
        cv::Point centroide;
        centroide.x = (int)(mom.m10/mom.m00);
        centroide.y = (int)(mom.m01/mom.m00);
        centroides.push_back(centroide);
    }
}

std::vector<cv::Point> Players::getCentroides()
{
    return centroides;
}

cv::Mat Players::getInsideField()
{
    return insideField;
}
