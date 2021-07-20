#include "Ball.hpp"

Ball::Ball()
{
}

void Ball::tracking(cv::Mat image, cv::Point ball, cv::Point rect_size)
{
    cv::Point rectTopLeft;
    bool track1Init = false, track2Init = false;
    bool failed;
    bool topLeftValid = false;
    if (rect_size != cv::Point(-1, -1))
    {
        rectTopLeft = cv::Point(ball.x - rect_size.x / 2, ball.y - rect_size.y / 2);
        if (rectTopLeft.x < 0)
            rectTopLeft.x = 0;
        else if (rectTopLeft.x + rect_size.x >= image.cols)
            rectTopLeft.x = image.cols - rect_size.x;
        if (rectTopLeft.y < 0)
            rectTopLeft.y = 0;
        else if (rectTopLeft.y + rect_size.y >= image.rows)
            rectTopLeft.y = image.rows - rect_size.y;
    }

    if (rectTopLeft.x >= 0 && rectTopLeft.x < image.cols && rectTopLeft.y >= 0 && rectTopLeft.y < image.rows)
    {
        topLeftValid = true;
    }

    if (!initialized && rect_size != cv::Point(-1, -1))
    {
        tracker1 = cv::TrackerMIL::create();
        tracker2 = cv::TrackerKCF::create();
        roi = cv::Rect2d(rectTopLeft, cv::Size(rect_size.y, rect_size.x));
        roi2 = cv::Rect2d(rectTopLeft, cv::Size(rect_size.y, rect_size.x));
        // track1Init = tracker1->init(image, roi);
        track2Init = tracker2->init(image, roi2);
        initialized = true;
        failedTracking = false;
    }
    if (track2Init)
    {
        failed = !tracker2->update(image, roi2);
    }
    if (failed)
    {
        failures++;
    }
    if (failedTracking && rect_size != cv::Point(-1, -1) && topLeftValid)
    {
        tracker1->clear();
        tracker2->clear();
        tracker1 = cv::TrackerMIL::create();
        tracker2 = cv::TrackerKCF::create();
        roi = cv::Rect2d(rectTopLeft, rect_size);
        roi2 = cv::Rect2d(rectTopLeft, rect_size);
        // track1Init = tracker1->init(image, roi);
        track2Init = tracker2->init(image, roi2);
        failures = 0;
        failedTracking = false;
    }
    else if (failures >= 15 && !failedTracking)
    {
        failedTracking = true;
    }
    // else if(initialized)
    // {
    //     tracker1->update(image, roi);
    // }
    int blackCount = 0;
    for (int i = roi.x; i < roi.width; i++)
    {
        for (int j = roi.y; j < roi.height; j++)
        {
            if (image.at<cv::Vec3b>(j, i) == cv::Vec3b(0, 0, 0))
            {
                blackCount++;
            }
        }
    }
    if (blackCount == roi.width * roi.height)
    {
        failedTracking = true;
    }
    showBall(image);
}

void Ball::showBall(cv::Mat image)
{
    // cv::rectangle(image, cv::Rect(centers[biggestCluster], cv::Size(40, 30)), cv::Scalar(0, 255, 0));
    cv::rectangle(image, roi2, cv::Scalar(0, 0, 255));
    cv::imshow("tracking", image);
    cv::waitKey(1);
}