#include "Ball.hpp"

Ball::Ball()
{
    MIN_DIFFERENCE_RADIUS = 0;
    MAX_DIFFERENCE_RADIUS = 20;
    MIN_AREA = 100;
    MAX_AREA = 2000;
    MIN_PERCENTAGE_CIRCLE = 40;
    numClusters = 15;
    epsilon = 2;
    onlyOnce = false;
    read = false;
    debug = false;
}

Ball::Ball(cv::Mat image, std::string xmlPath)
{
    setImage(image, xmlPath);
}

void Ball::setImage(cv::Mat image, std::string xmlPath)
{
    if (!onlyOnce)
    {
        colorPath = xmlPath + "BallWhiteParameters.xml";
        darkPath = xmlPath + "BallBlackParameters.xml";
        path = xmlPath + "BallParameters.xml";
        onlyOnce = true;
    }
    std::cout << std::fixed;
    std::cout << std::setprecision(2);
    this->image = image.clone();

    cv::FileStorage parametersFileWhite(colorPath, cv::FileStorage::READ);
    ColorFilter filterWhite(parametersFileWhite);
    binaryImage = filterWhite.applyFilter(image);

    cv::FileStorage parametersFileBlack(darkPath, cv::FileStorage::READ);
    ColorFilter filterDark(parametersFileBlack);
    blackBinaryImage = filterDark.applyFilter(image);

    contours.setImage(binaryImage);
    cv::FileStorage ballFile(path, cv::FileStorage::READ);
    if (!read)
    {
        ReadFile(ballFile);
        read = true;
    }
    //    std::cout << ballFound << "\tCENTER : " << centers.empty() << "\t FAILEDTRACK: " << failedTrack << "\n";
    if (!failedTrack)
        ballFound = true;
    else
        ballFound = false;

    crudeSearch();
    if (!failedTrack && enableTracking)
    {
        increasePrecision();
    }
}

void Ball::ReadFile(cv::FileStorage file)
{
    this->file = file;
    readFilter();
}

void Ball::readFilter()
{
    file["raio_min"] >> MIN_DIFFERENCE_RADIUS;
    file["raio_max"] >> MAX_DIFFERENCE_RADIUS;
    file["circle_percentage"] >> MIN_PERCENTAGE_CIRCLE;
    file["area_min"] >> MIN_AREA;
    file["area_max"] >> MAX_AREA;
    file["epsilon"] >> epsilon;

    file.release();
}

void Ball::crudeSearch()
{
    center.clear();
    centers.clear();
    radius.clear();

    std::vector<int> aux_vector;
    bool oneWithTheDark = false;
    ;
    //TODO:Informar problema na Status ou de alguma outra forma
    int amountOfContours = contours.getAmountOfContours();
    if (amountOfContours <= 0 && debug)
        std::cout << "\nErro - Nenhum contorno encontrado\n";
    else if (amountOfContours > 0)
    {
        std::vector<double> areas = contours.getAreas();
        std::vector<double> perimeters = contours.getPerimeters();
        std::vector<double> percentageOfCircle = contours.getPercentageOfCircle();
        std::vector<int> contoursToBeAnalysed;

        if (!areas.empty() && !perimeters.empty() && !percentageOfCircle.empty())
        {
            for (int i = 0; i < amountOfContours; i++)
            {
                double radiusFromArea = pow((areas[i] / M_PI), 0.5);
                double radiusFromPerimeter = perimeters[i] / (2.0 * M_PI);

                if (abs(radiusFromArea - radiusFromPerimeter) > MIN_DIFFERENCE_RADIUS && abs(radiusFromArea - radiusFromPerimeter) < MAX_DIFFERENCE_RADIUS)
                {
                    if (percentageOfCircle[i] > MIN_PERCENTAGE_CIRCLE)
                        contoursToBeAnalysed.push_back(i);
                }
            }
        }
        // std::cout << "SIZE : " << amountOfContours << "\t ANALYSED: " << contoursToBeAnalysed.size() << "\n";
        aux_vector = contoursToBeAnalysed;
        for (int n = 0; n < contoursToBeAnalysed.size(); n++)
        {
            blackPixels = 0;
            std::vector<cv::Point> temp = contours.getContour(contoursToBeAnalysed[n]);
            for (int x = 0; x < temp.size(); x++)
            {
                cv::Point test = temp[x];
                if (test.x + 40 >= this->image.cols)
                    test.x = this->image.cols - 40 - 1;
                if (test.y + 40 >= this->image.rows)
                    test.y = this->image.rows - 40 - 1;
                for (int i = test.x; i < test.x + 40; i++)
                {
                    for (int j = test.y; j < test.y + 40; j++)
                    {
                        if (blackBinaryImage.at<uchar>(j, i) == 0)
                        {
                            blackPixels++;
                            oneWithTheDark = true;
                            break;
                        }
                    }
                    if (blackPixels > 0)
                        break;
                }
            }
            if (blackPixels == 0)
            {
                //~ std::cout << n << "\n";
                contoursToBeAnalysed.erase(contoursToBeAnalysed.begin() + n);
            }
        }
        if (!oneWithTheDark)
            contoursToBeAnalysed = aux_vector;
        if (contoursToBeAnalysed.size() > 0 && (failedTrack || !enableTracking))
            fineSearch(contoursToBeAnalysed);
        //        else
        //        {
        //            //TODO:Analisar todos os contornos nesse caso
        //            std::cout<<"\nNenhum contorno passou pela varredura grosseira\n";
        //        }
    }
}

void Ball::fineSearch(std::vector<int> contoursToBeAnalysed)
{
    double bestPercentage = 0.0;
    imageOfContour = cv::Mat::zeros(binaryImage.size(), CV_8UC1);

    for (int i = 0; i < contoursToBeAnalysed.size(); i++)
    {
        std::vector<cv::Point> contour = contours.getContour(contoursToBeAnalysed[i]);

        if (contours.contourVector[contoursToBeAnalysed[i]].area < MAX_AREA && contours.contourVector[contoursToBeAnalysed[i]].area > MIN_AREA)
        {
            for (int i = 0; i < contour.size(); i++)
            {
                imageOfContour.at<uchar>(contour[i].y, contour[i].x) = 255;
            }
            searcher.loadContour(imageOfContour);
            center = searcher.getCircleCenter();
            radius = searcher.getCircleRadius();
        }
    }
    contoursToBeAnalysed.clear();

    if (!center.empty())
        kmeans(center);
    //    cv::imshow("contour", imageOfContour);
}

void Ball::kmeans(std::vector<cv::Point> circles)
{
    int clusterSize = 0;
    int attempts = 20;
    std::vector<int> labels;
    std::vector<cv::Point> tempVector;
    std::vector<std::vector<cv::Point>> clusterPoints;
    int soma_x, soma_y;
    cv::Point media;
    if (numClusters > circles.size())
        numClusters = circles.size();
    if (circles.size() != 0)
    {
        cv::Mat circlesMat = cv::Mat(circles);
        circlesMat.convertTo(circlesMat, CV_32F);
        cv::kmeans(circlesMat, numClusters, labels, cv::TermCriteria(CV_TERMCRIT_EPS + CV_TERMCRIT_ITER, 10, epsilon),
                   attempts, cv::KMEANS_RANDOM_CENTERS);
        circlesMat.convertTo(circlesMat, 1);
        for (int n = 0; n < numClusters; n++)
        {
            for (int i = 0; i < labels.size(); i++)
            {
                if (labels[i] == n)
                {
                    tempVector.push_back(circles[i]);
                }
            }
            clusterPoints.push_back(tempVector);
            ;
            tempVector.clear();
        }
        for (int i = 0; i < clusterPoints.size(); i++)
        {
            int size = 0;
            soma_x = 0;
            soma_y = 0;
            for (int j = 0; j < clusterPoints[i].size(); j++)
            {
                soma_x += clusterPoints[i][j].x;
                soma_y += clusterPoints[i][j].y;
            }
            size = clusterPoints[i].size();
            media = cv::Point((int)(soma_x / size), (int)soma_y / size);
            centers.push_back(media);
            if (clusterPoints[i].size() > clusterSize)
            {
                clusterSize = clusterPoints[i].size();
                biggestCluster = i;
            }
        }
        if (enableTracking)
            increasePrecision();
    }
}

void Ball::increasePrecision()
{
    bool track1Init, track2Init;
    cv::Size size(60, 60);
    bool failed;
    bool topLeftValid = false;
    if (!centers.empty())
    {
        rectTopLeft = cv::Point(centers[biggestCluster].x - size.width / 2, center[biggestCluster].y - size.height / 2);
        if (rectTopLeft.x < 0)
            rectTopLeft.x = 0;
        else if (rectTopLeft.x + size.width >= this->image.cols)
            rectTopLeft.x = this->image.cols - size.width;
        if (rectTopLeft.y < 0)
            rectTopLeft.y = 0;
        else if (rectTopLeft.y + size.height >= this->image.rows)
            rectTopLeft.y = this->image.rows - size.height;
    }

    if (rectTopLeft.x >= 0 && rectTopLeft.x < this->image.cols && rectTopLeft.y >= 0 && rectTopLeft.y < this->image.rows)
        topLeftValid = true;

    if (!flag && !centers.empty())
    {
        tracker1 = cv::TrackerMIL::create();
        tracker2 = cv::TrackerKCF::create();
        roi = cv::Rect2d(rectTopLeft, size);
        roi2 = cv::Rect2d(rectTopLeft, size);
        track1Init = tracker1->init(this->image, roi);
        track2Init = tracker2->init(this->image, roi2);
        flag = true;
        failedTrack = false;
    }
    if (track2Init)
        failed = !tracker2->update(this->image, roi2);
    if (failed)
    {
        failures++;
    }
    //    std::cout << "failures:   " << failures << "\t failedTrack:   " << failedTrack << "\t center:    " << !center.empty() << "\t TopLeft:  " << topLeftValid << "\n";
    if ((failures >= 10 || failedTrack) && !centers.empty() && topLeftValid)
    {
        tracker1->clear();
        tracker2->clear();
        tracker1 = cv::TrackerMIL::create();
        tracker2 = cv::TrackerKCF::create();
        roi = cv::Rect2d(rectTopLeft, size);
        roi2 = cv::Rect2d(rectTopLeft, size);
        track1Init = tracker1->init(this->image, roi);
        track2Init = tracker2->init(this->image, roi2);
        //        std::cout << roi.x << ", " << roi .y << "\n";
        failures = 0;
        failedTrack = false;
    }
    else if (failures >= 15 && !failedTrack)
    {
        failedTrack = true;
    }
    else
    {
        tracker1->update(this->image, roi);
        //~ failedTrack = false;
        //~ else
        //~ failedTrack = true;
    }
    int blackCount = 0;
    for (int i = roi.x; i < roi.width; i++)
    {
        for (int j = roi.y; j < roi.height; j++)
        {
            if (this->image.at<cv::Vec3b>(j, i) == cv::Vec3b(0, 0, 0))
            {
                blackCount++;
            }
        }
    }
    if (blackCount == roi.width * roi.height)
    {
        failedTrack = false;
    }
}

void Ball::varyRadiusMin(int min_raio)
{
    MIN_DIFFERENCE_RADIUS = min_raio;
}

void Ball::varyRadiusMax(int max_raio)
{
    MAX_DIFFERENCE_RADIUS = max_raio;
}

void Ball::varyCirclePercent(int percent_circle)
{
    MIN_PERCENTAGE_CIRCLE = percent_circle;
}

void Ball::varyEpsilon(int eps)
{
    epsilon = eps;
}

void Ball::varyMinArea(int min_area)
{
    MIN_AREA = min_area;
}

void Ball::varyMaxArea(int max_area)
{
    MAX_AREA = max_area;
}

cv::Point Ball::getBall()
{
    if (centers.size() != 0 && !enableTracking)
    {
        return centers[biggestCluster];
    }
    else if (ballFound && enableTracking)
    {
        return cv::Point(roi.x + roi.width / 2, roi.y + roi.height / 2);
    }
    else
    {
        return cv::Point(0, 0);
    }
}

cv::Rect Ball::getTracker()
{
    return roi;
}

bool Ball::found()
{
    return ballFound;
}

cv::Mat Ball::getBestContours()
{
    return imageOfContour;
}

void Ball::setTracking()
{
    enableTracking = !enableTracking;
}

double Ball::getBallArea()
{
    //    if(!centers.empty())
    //    {
    //        cv::Moments mom = cv::moments(centers[biggestCluster]);
    //        double area = mom.m00;
    //        return area;
    //    }
    //    else
    //    {
    //        return 0;
    //    }
}

void Ball::showBall()
{
    cv::Mat original = image.clone();

    if (center.size() != 0 || !failedTrack)
    {
        cv::rectangle(original, cv::Rect(centers[biggestCluster], cv::Size(40, 30)), cv::Scalar(0, 255, 0));
        cv::rectangle(original, roi, cv::Scalar(0, 0, 255));
    }
    cv::imshow("window", original);
    cv::waitKey(20);
}

//Main para teste da classe
// int main()
// {
//     Field field;
//     Camera camera;
//     Ball ball;

//     while(true)
//     {
//         field.setImage(camera.getRawImage());
//         // cv::imshow("hue", camera.getRawImage());
//         ball.setImage(field.getField());
//         ball.showBall();
//         if(ball.key == 27)
//             break;
//     }

//     return 0;
// }
