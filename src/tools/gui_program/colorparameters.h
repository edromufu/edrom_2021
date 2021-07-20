#ifndef COLORPARAMETERS_H
#define COLORPARAMETERS_H

#include <QObject>
#include <vector>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

class colorparameters
{
public:
    colorparameters();

    int param[8];
    QString colorSpace;

    std::vector <cv::Point> morph;
    std::vector <int> shape;

};

#endif // COLORPARAMETERS_H
