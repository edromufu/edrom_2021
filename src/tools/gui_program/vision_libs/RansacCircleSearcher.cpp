#include "RansacCircleSearcher.hpp"

//Struct necessaria para comparar qual os maiores x dos pontos listados no bestCirclePercentages


RansacCircleSearcher::RansacCircleSearcher(){}

RansacCircleSearcher::RansacCircleSearcher(cv::Mat roiOfContour)
{
    std::vector<float> circleRadiusTemp;
    std::vector<cv::Point> circleCenterTemp;
 
    bestCircleCenter.clear();
    bestCirclePercentage.clear();
    bestCircleRadius.clear();

    image = roiOfContour;
    getPointPositions(roiOfContour);
    int maxIterations = pointPositions.size();
    
    //inverte a cor da imagem (branco vira preto e vice versa), para utilizar distanceTransform
    cv::Mat invertedImage = 255 - roiOfContour;
    cv::Mat distanceMatrix;
    cv::distanceTransform(invertedImage,distanceMatrix,CV_DIST_L1, 3);
    
    //TODO:verificar valor para o menor raio aceitável
    double minimumRadius = 5.0;  

    double maximumRadius = 8.0;
    //TODO:verificar necessidade de porcentagem minima
    minCirclePercentage = 0.00; 

    int numCircles = 40;
    
    srand (time(NULL));
    bestCirclePercentage.push_back(cv::Point(0,0));
     for(int iteration = 0; iteration < maxIterations; iteration++)
    {
        getRandomPoints();
        cv::Point center; 
        float radius;
        getCircle(randomPoints[0],randomPoints[1],randomPoints[2],center,radius);
        std::vector<cv::Point> inlierSet;
        int circlePercentage = verifyCircle(distanceMatrix,center,radius,inlierSet);
        if(circlePercentage >= bestCirclePercentage.back().x)
        {
            if(radius >= minimumRadius && radius <= maximumRadius)
            {
                if(center.x > radius && center.y > radius && (center.x < image.cols - radius) && (center.y < image.rows - radius))
                {
                    bestCirclePercentage.push_back(cv::Point(circlePercentage, iteration));
                    circleRadiusTemp.push_back(radius);
                    circleCenterTemp.push_back(center);
                }
            }
            std::sort(bestCirclePercentage.begin(), bestCirclePercentage.end(), compare);
        }
    }
    if(bestCirclePercentage.size() > numCircles)
        bestCirclePercentage.resize(numCircles);
    for(int i = 0; i < circleCenterTemp.size(); i++)
    {
        for(int n = 0; n < bestCirclePercentage.size(); n++)
        {
            if(i == bestCirclePercentage[n].y)
            {
                bestCircleRadius.push_back(circleRadiusTemp[i]);
                bestCircleCenter.push_back(circleCenterTemp[i]);
            }
        }
    }

    pointPositions.clear();
    circleRadiusTemp.clear();
    circleCenterTemp.clear();


}

void RansacCircleSearcher::loadContour(cv::Mat roiOfContour)
{
    std::vector<float> circleRadiusTemp;
    std::vector<cv::Point> circleCenterTemp;
 
    bestCircleCenter.clear();
    bestCirclePercentage.clear();
    bestCircleRadius.clear();

    image = roiOfContour;
    getPointPositions(roiOfContour);
    int maxIterations = pointPositions.size();
    
    //inverte a cor da imagem (branco vira preto e vice versa), para utilizar distanceTransform
    cv::Mat invertedImage = 255 - roiOfContour;
    cv::Mat distanceMatrix;
    cv::distanceTransform(invertedImage,distanceMatrix,CV_DIST_L1, 3);
    
    //TODO:verificar valor para o menor raio aceitável
    double minimumRadius = 5.0;  

    double maximumRadius = 8.0;
    //TODO:verificar necessidade de porcentagem minima
    minCirclePercentage = 0.00; 

    int numCircles = 1000000;
    //numero de vezes que o circulo entra no intervalo de raio
    int valid = 0; 
    
    srand (time(NULL));
    bestCirclePercentage.push_back(cv::Point(0,0));
     for(int iteration = 0; iteration < maxIterations; iteration++)
    {
        getRandomPoints();
        cv::Point center; 
        float radius;
        getCircle(randomPoints[0],randomPoints[1],randomPoints[2],center,radius);
        std::vector<cv::Point> inlierSet;
        int circlePercentage = verifyCircle(distanceMatrix,center,radius,inlierSet);
        if(circlePercentage >= bestCirclePercentage.back().x)
        {
            if(radius >= minimumRadius && radius <= maximumRadius)
            {
                if(center.x > radius && center.y > radius && (center.x < image.cols - radius) && (center.y < image.rows - radius))
                {
                    bestCirclePercentage.push_back(cv::Point(circlePercentage, valid));
                    circleRadiusTemp.push_back(radius);
                    circleCenterTemp.push_back(center);
                    valid++;
                }
            }
            std::sort(bestCirclePercentage.begin(), bestCirclePercentage.end(), compare);
        }
    }
    if(bestCirclePercentage.size() > numCircles)
        bestCirclePercentage.resize(numCircles);
    for(int i = 0; i < circleCenterTemp.size(); i++)
    {
        for(int n = 0; n < bestCirclePercentage.size(); n++)
        {
            if(i == bestCirclePercentage[n].y)
            {
                bestCircleRadius.push_back(circleRadiusTemp[i]);
                bestCircleCenter.push_back(circleCenterTemp[i]);
            }
        }
    }

    pointPositions.clear();
    circleRadiusTemp.clear();
    circleCenterTemp.clear();

}

void RansacCircleSearcher::getPointPositions(cv::Mat binaryImage)
{
    //TODO:verificar se é menor ou menor e igual
    for(int y = 0; y < binaryImage.rows; y++)
    {
        for(int x = 0; x < binaryImage.cols; x++)
        {
            if(binaryImage.at<uchar>(y,x) > 0)
                 pointPositions.push_back(cv::Point(x,y));
        }
    }
}

//TODO:pensar em uma forma mais inteligente de escolher os pontos
void RansacCircleSearcher::getRandomPoints()
{
    while(true)
    {
        int index[3];
        index[0] = rand()%pointPositions.size();
        index[1] = rand()%pointPositions.size();
        index[2] = rand()%pointPositions.size();
        
        if(index[0] == index[1]) continue;
        if(index[0] == index[2]) continue;
        if(index[1] == index[2]) continue;
        
        randomPoints[0] = pointPositions[index[0]];
        randomPoints[1] = pointPositions[index[1]];
        randomPoints[2] = pointPositions[index[2]];
        
        break;
    }
}

void RansacCircleSearcher::getCircle(cv::Point &p1,cv::Point &p2,cv::Point &p3, cv::Point &center, float &radius)
{
    float x1 = p1.x;
    float x2 = p2.x;
    float x3 = p3.x;

    float y1 = p1.y;
    float y2 = p2.y;
    float y3 = p3.y;

    center.x = (x1*x1+y1*y1)*(y2-y3) + (x2*x2+y2*y2)*(y3-y1) + (x3*x3+y3*y3)*(y1-y2);
    center.x /= ( 2*(x1*(y2-y3) - y1*(x2-x3) + x2*y3 - x3*y2) );

    center.y = (x1*x1 + y1*y1)*(x3-x2) + (x2*x2+y2*y2)*(x1-x3) + (x3*x3 + y3*y3)*(x2-x1);
    center.y /= ( 2*(x1*(y2-y3) - y1*(x2-x3) + x2*y3 - x3*y2) );
    
    radius = sqrt((center.x-x1)*(center.x-x1) + (center.y-y1)*(center.y-y1));
}

int RansacCircleSearcher::verifyCircle(cv::Mat distance,cv::Point center,float radius, std::vector<cv::Point> &inlierSet)
{
    int counter = 0;
    int inlier = 0;
    float maxInlierDistance = radius/25.0f;
    float minimumDistance = 2.0f;
    float maximumDistance = 100.0f;
    
    if(maxInlierDistance < minimumDistance)
        maxInlierDistance = minimumDistance;
    if(maxInlierDistance > maximumDistance) 
        maxInlierDistance = maximumDistance;

    for(float t = 0.0 ; t < 2*M_PI; t += 0.05f)
    {
        counter++;
        float coordX = radius*cos(t) + center.x;
        float coordY = radius*sin(t) + center.y;

        if(coordX < distance.cols)
        if(coordX >= 0)
        if(coordY < distance.rows)
        if(coordY >= 0)
        if(distance.at<float>(coordY ,coordX) < maxInlierDistance)
        {
            inlier++;
            inlierSet.push_back(cv::Point(coordX,coordY));
        }
    }
    return (int)(((double)inlier/(double)counter)*100);
}

void RansacCircleSearcher::showCircle(char* window, cv::Mat image)
{
    // cv::circle(image, bestCircleCenter,bestCircleRadius, cv::Scalar(255,255,255),1);
    // std::cout<<"\n"<<bestCirclePercentage<<"\n";
    cv::imshow(window,image);
    // cv::waitKey(0);
}

std::vector<cv::Point> RansacCircleSearcher::getCirclePercentage()
{
    return bestCirclePercentage;
}
std::vector<cv::Point> RansacCircleSearcher::getCircleCenter()
{
    return bestCircleCenter;
}
std::vector<float> RansacCircleSearcher::getCircleRadius()
{
    return bestCircleRadius;
}

//~ //Main para teste da classe
//~ int main()
//~ {
    //~ cv::Mat src = cv::imread("Tests/testRansacClass.jpg"); 
    //~ cv::cvtColor(src,src,CV_BGR2GRAY);
    //~ RansacCircleSearcher test(src);
    //~ test.showCircle();
    //~ return 0;
//~ }
