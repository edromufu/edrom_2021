#include "opencvworker.h"
#include <opencv2/imgproc/imgproc.hpp>



OpenCVWorker::OpenCVWorker(QObject *parent) :
    QObject(parent),
    toggleStream(true),
    inRangeEnabled(false),
    normalizeEnabled(false),
    hough(false),
    showEnabled(false),
    ballEnabled(false),
    cannyEnabled(false),
    goalEnabled(false),
    playersEnabled(false),
    showFieldOnly(false),
    showBinary(false),
    showCanny1(false),
    showCanny2(false),
    lines1Enabled(false),
    lines2Enabled(false),
    showContour(false),
    normalImage(true),
    ballWasToggled(false),
    goalWasToggled(false),
    cannyWasToggled(false),
    hsv(true),
    ycc(false),
    firstParam(0),
    secondParam(255),
    thirdParam(0),
    fourthParam(255),
    fifthParam(0),
    sixthParam(255),
    morphType(3),
    morphValue(0),
    radius(0),
    circlePercentage(0),
    numClusters(0),
    fileRead(false),
    yccNeverActivated(true),
    tempShape(2)

{
      cap = new cv::VideoCapture();

}

OpenCVWorker::~OpenCVWorker(){
    if(cap->isOpened())
        cap->release();
    delete cap;
}

void OpenCVWorker::process()
{
    std::string path;
    std::vector<cv::Mat> kernelHsv;
    std::vector<cv::Mat> kernelYcc;
    cv::Mat kernelTemp;
    double tempo;

    kernelTemp = getStructuringElement(tempShape, cv::Size(2*morphValue + 1, 2*morphValue + 1),
                                           cv::Point(morphValue, morphValue));

    startFps = cv::getTickCount();
    path = "../../config_files/vision/";
    fixToggles();
    if(!frameOriginal.empty())
    {
        field.setImage(frameOriginal, path);
        if(cannyEnabled)
            lines.setImage(frameOriginal, path);
        if(goalEnabled)
        {
            goal.setImage(frameOriginal, path);
            goal.processImage(field.getBinaryField());
        }
        if(playersEnabled)
            player.setImage(field.getField(), path);
        if(ballEnabled)
            ball.setImage(field.getField(), path);


        frameNormalized = cv::Mat::zeros(frameOriginal.rows, frameOriginal.cols, CV_8UC3);
        frameProcessed = cv::Mat::zeros(frameOriginal.rows, frameOriginal.cols, CV_8UC3);
        if(normalizeEnabled)
        {
            cv::Vec3b total;
            float somaTotal = 0;
            for(int i = 0 ; i < frameOriginal.rows; i++)
            {
                for(int j = 0; j < frameOriginal.cols; j++)
                {

                    total = frameOriginal.at<cv::Vec3b>(i,j);

                    somaTotal = total[0] + total[1] + total[2];
                    total[0] = (total[0]/somaTotal)*255;
                    total[1] = (total[1]/somaTotal)*255;
                    total[2] = (total[2]/somaTotal)*255;

                    frameNormalized.at<cv::Vec3b>(i,j) = total;
                }
            }
        }
        if(inRangeEnabled)
        {
            if(!normalizeEnabled)
            {
                cv::cvtColor(frameOriginal,frameHsv, CV_BGR2HSV);
                cv::inRange(frameHsv, cv::Scalar(hsvPar.param[0], hsvPar.param[2], hsvPar.param[4]),
                        cv::Scalar(hsvPar.param[1], hsvPar.param[3], hsvPar.param[5]), frameHsv);

            }
            else
            {
                cv::cvtColor(frameNormalized,frameHsv, CV_BGR2HSV);
                cv::inRange(frameHsv, cv::Scalar(hsvPar.param[0], hsvPar.param[2], hsvPar.param[4]),
                        cv::Scalar(hsvPar.param[1], hsvPar.param[3], hsvPar.param[5]), frameHsv);
            }


            cv::cvtColor(frameOriginal, frameYcc, CV_BGR2YCrCb);
            cv::inRange(frameYcc, cv::Scalar(yccPar.param[0], yccPar.param[2], yccPar.param[4]),
                    cv::Scalar(yccPar.param[1], yccPar.param[3], yccPar.param[5]), frameYcc);

            for(int i = 0; i < hsvPar.morph.size(); i++)
            {
                kernelHsv.push_back(getStructuringElement(hsvPar.shape.at(i),
                                                          cv::Size(2*hsvPar.morph.at(i).y + 1, 2*hsvPar.morph.at(i).y + 1),
                                                          cv::Point(hsvPar.morph.at(i).y, hsvPar.morph.at(i).y)));
                if(hsvPar.morph.at(i).x == 0)
                    cv::erode(frameHsv, frameHsv, kernelHsv.at(i));
                else
                    cv::dilate(frameHsv, frameHsv, kernelHsv.at(i));

            }

            for(int i = 0; i < yccPar.morph.size(); i++)
            {
                kernelYcc.push_back(getStructuringElement(yccPar.shape.at(i),
                                                          cv::Size(2*yccPar.morph.at(i).y + 1, 2*yccPar.morph.at(i).y + 1),
                                                          cv::Point(yccPar.morph.at(i).y, yccPar.morph.at(i).y)));
                if(yccPar.morph.at(i).x == 0)
                    cv::erode(frameYcc, frameYcc, kernelYcc.at(i));
                else
                    cv::dilate(frameYcc, frameYcc, kernelYcc.at(i));

            }

            if(morphType == 0 )
            {
                cv::erode(frameHsv, frameHsv, kernelTemp);
                cv::erode(frameYcc, frameYcc, kernelTemp);
            }
            else if(morphType == 1 )
            {
                cv::dilate(frameHsv, frameHsv, kernelTemp);
                cv::dilate(frameYcc, frameYcc, kernelTemp);
            }


            cv::bitwise_and(frameHsv, frameYcc, frameIntersection);

            if(gray)
            {
                frameProcessed = frameOriginal.clone();
                cv::cvtColor(frameProcessed, frameProcessed, CV_BGR2GRAY);
            }
        }
        if(cannyEnabled)
        {
            frameCanny = lines.applyCannyFilter();
            if(showCanny1 && lines1Enabled)
            {
                frameLines1 = lines.applyHoughFilter();
            }
            else if(showCanny2 && lines2Enabled)
            {
                frameLines2 = lines.applyHoughFilter();

            }
        }
        if(roiEnabled)
        {
            frameRoi = frameOriginal.clone();
            roi = cv::Rect(mousePos, roiSize);
            cv::rectangle(frameRoi, roi, cv::Scalar(0,0,255), 2);
        }

        if((goalEnabled && (showGoal || showBinary || showFieldOnly))
                || (cannyEnabled && ((!hough && showCanny1) || (hough && showCanny2))) || roiEnabled)
        {
            normalImage = false;
        }
        else
        {
            normalImage = true;
        }
    }
}


void OpenCVWorker::receiveGrabFrame()
{
    storeParameters();

    if(toggleStream && mode != "Image")
    {
        if(!cap->read(frameOriginal))
        {
            cap->set(CV_CAP_PROP_POS_FRAMES, 0);
            cap->read(frameOriginal);
        }

    }
    else if(toggleStream)
    {
        frameOriginal = image;
    }
    if(mode == "Record")
    {
        std::cout << camera.getCapture().get(CV_CAP_PROP_FPS) << std::endl;
        camera.record(frameOriginal);
    }

    cv::resize(frameOriginal, frameOriginal, cv::Size(640,480));
    if(!frameOriginal.empty())
    {
        emit(sendFPS(cap->get(5)));
        process();
        if(ballEnabled)
        {
            if(!showContour && !showFieldOnly)
            {
                drawBall();
                QImage output((const unsigned char *) frameOriginal.data, frameOriginal.cols,
                              frameOriginal.rows,QImage::Format_RGB888);
                emit sendFrame(output.rgbSwapped());
            }
            else if(showContour && !showFieldOnly)
            {
                QImage output((const unsigned char *) frameContour.data, frameContour.cols,
                              frameContour.rows,QImage::Format_Indexed8);
                emit sendFrame(output);
            }
            else if(showFieldOnly && !showContour)
            {
                frameField = field.getBinaryField();
                QImage output((const unsigned char *) frameField.data, frameField.cols,
                              frameField.rows, QImage::Format_Indexed8);
                emit sendFrame(output);
            }
        }
        else if(!hough && cannyEnabled && showCanny1 && !lines1Enabled)
        {
            QImage output((const unsigned char *) frameCanny.data, frameCanny.cols,
                      frameCanny.rows,QImage::Format_Indexed8);
            emit sendFrame(output);
        }
        else if(hough && cannyEnabled && showCanny2 && !lines2Enabled)
        {
            QImage output((const unsigned char *) frameCanny.data, frameCanny.cols,
                      frameCanny.rows,QImage::Format_Indexed8);
            emit sendFrame(output);
        }
        else if(cannyEnabled && showCanny1 && lines1Enabled)
        {
            QImage output((const unsigned char *) frameLines1.data, frameLines1.cols,
                      frameLines1.rows,QImage::Format_Indexed8);
            emit sendFrame(output);
        }
        else if(cannyEnabled && showCanny2 && lines2Enabled)
        {
            QImage output((const unsigned char *) frameLines2.data, frameLines2.cols,
                      frameLines2.rows,QImage::Format_Indexed8);
            emit sendFrame(output);
        }
        else if(goalEnabled)
        {
            if(showGoal && !showFieldOnly && !showBinary)
            {
                goal.showGoal(frameOriginal, goal.getGoal());
                QImage output((const unsigned char *) frameOriginal.data, frameOriginal.cols,
                              frameOriginal.rows,QImage::Format_RGB888);
                emit sendFrame(output.rgbSwapped());
            }
            else if(!showGoal && showBinary && !showFieldOnly)
            {
                frameGoalFieldBinary = goal.getIntersection();
                QImage output((const unsigned char *) frameGoalFieldBinary.data, frameGoalFieldBinary.cols,
                              frameGoalFieldBinary.rows, QImage::Format_Indexed8);
                emit sendFrame(output);
            }
            else if(!showGoal && !showBinary && showFieldOnly)
            {
                frameField = field.getBinaryField();
                QImage output((const unsigned char *) frameField.data, frameField.cols,
                              frameField.rows, QImage::Format_Indexed8);
                emit sendFrame(output);
            }
            else if(!showGoal && !showBinary && !showFieldOnly)
            {
                QImage output((const unsigned char *) frameOriginal.data, frameOriginal.cols,
                              frameOriginal.rows,QImage::Format_RGB888);
                emit sendFrame(output.rgbSwapped());
            }
        }
        else if(playersEnabled)
        {
            framePlayers = player.getInsideField();
            QImage output((const unsigned char *) framePlayers.data, framePlayers.cols,
                          framePlayers.rows, QImage::Format_Indexed8);
            emit sendFrame(output);

        }
        else if(roiEnabled)
        {
            QImage output((const unsigned char *) frameRoi.data, frameRoi.cols,
                          frameRoi.rows,QImage::Format_RGB888);
            emit sendFrame(output.rgbSwapped());
        }
        else if(normalImage && !showContour && !showGoal)
        {
            if(!inRangeEnabled && !normalizeEnabled && !showEnabled && !gray)
            {
                QImage output((const unsigned char *) frameOriginal.data, frameOriginal.cols,
                              frameOriginal.rows,QImage::Format_RGB888);
                emit sendFrame(output.rgbSwapped());
            }
            else if(!inRangeEnabled && normalizeEnabled && !showEnabled && !gray)
            {
                QImage output((const unsigned char *) frameNormalized.data, frameNormalized.cols,
                              frameNormalized.rows,QImage::Format_RGB888);
                emit sendFrame(output.rgbSwapped());
            }
            else if(inRangeEnabled && ycc && !showEnabled)
            {
                QImage output((const unsigned char *) frameYcc.data, frameYcc.cols,
                              frameYcc.rows,QImage::Format_Indexed8);
                emit sendFrame(output);
            }
            else if(inRangeEnabled && hsv && !showEnabled)
            {
                QImage output((const unsigned char *) frameHsv.data, frameHsv.cols,
                              frameHsv.rows,QImage::Format_Indexed8);
                emit sendFrame(output);
            }
            else if(showEnabled)
            {
                QImage output((const unsigned char *) frameIntersection.data, frameIntersection.cols,
                              frameIntersection.rows, QImage::Format_Indexed8);
                emit sendFrame(output);
            }
            else if(gray)
            {
                QImage output((const unsigned char *) frameProcessed.data, frameProcessed.cols,
                              frameProcessed.rows, QImage::Format_Indexed8);
                emit sendFrame(output);
            }
        }
        emit(sendFPS((cv::getTickFrequency() / (cv::getTickCount() - startFps))));
    }
}

///Função que conserta problemas existentes qual objeto se quer encontrar
void OpenCVWorker::fixToggles()
{
    if(ballWasToggled)
    {
        cannyEnabled = false;
        goalEnabled = false;
        playersEnabled = false;
        roiEnabled = false;
    }
    else if(goalWasToggled)
    {
        ballEnabled = false;
        cannyEnabled = false;
        playersEnabled = false;
        roiEnabled = false;
    }
    else if(cannyWasToggled)
    {
        ballEnabled = false;
        goalEnabled = false;
        playersEnabled = false;
        roiEnabled = false;
    }
    else if(playersToggled)
    {
        ballEnabled = false;
        goalEnabled = false;
        cannyEnabled = false;
        roiEnabled = false;
    }
    else if(roiWasToggled)
    {
        ballEnabled = false;
        goalEnabled = false;
        cannyEnabled = false;
        playersToggled = false;
    }
    goalWasToggled = false;
    ballWasToggled = false;
    cannyWasToggled = false;
    playersToggled = false;
    roiWasToggled = false;
}

void OpenCVWorker::receiveSetup()
{
    cap->release();
    camera.start();
    *cap = camera.getCapture();
    if(mode == "Record")
    {
        camera.endRecording();
    }
    mode = "Live";
}

void OpenCVWorker::receiveVideo(QString path)
{
    cap->release();
    camera.start(path.toStdString());
    *cap = camera.getCapture();
    if(mode == "Record")
    {
        camera.endRecording();
    }
    mode = "Video";
}

void OpenCVWorker::receiveMousePos(QPoint pos)
{
    mousePos = cv::Point(pos.x(), pos.y());
}

void OpenCVWorker::receiveImage(QString path)
{
    image = camera.loadImage(path.toStdString());
    if(mode == "Record")
    {
        camera.endRecording();
    }
    mode = "Image";
}

void OpenCVWorker::receiveRecord(QString path)
{
    camera.openRecorder(path.toStdString(), *cap);
    mode = "Record";
}

void OpenCVWorker::endRecord()
{
    camera.endRecording();
}

void OpenCVWorker::saveImage(QString path)
{
    camera.saveImage(path.toStdString(), frameOriginal);
}

void OpenCVWorker::saveRoi(QString path)
{
    cv::Mat result = camera.roi(frameOriginal, roi);
    camera.saveImage(path.toStdString(), result);
}

void OpenCVWorker::receiveLines()
{
    cannyEnabled = !cannyEnabled;
    cannyWasToggled = true;
}

void OpenCVWorker::receiveBall()
{
    ballEnabled = !ballEnabled;
    ballWasToggled = true;
}

void OpenCVWorker::receiveGoal()
{
    goalEnabled = !goalEnabled;
    goalWasToggled = true;
}

void OpenCVWorker::receiveFieldOnly()
{
    showFieldOnly = !showFieldOnly;
    showGoal = false;
    showBinary = false;
    showContour = false;
}

void OpenCVWorker::receiveShowGoal()
{
    showGoal = !showGoal;
    showFieldOnly = false;
    showBinary = false;
}

void OpenCVWorker::receiveBinary()
{
    showBinary = !showBinary;
    showGoal = false;
    showFieldOnly = false;
}

void OpenCVWorker::receiveToggleStream(bool checked)
{
    toggleStream = checked;
}

void OpenCVWorker::receiveInRangeEnabled()
{
    inRangeEnabled = !inRangeEnabled;
}

void OpenCVWorker::receiveNormalizeEnabled()
{
    normalizeEnabled = !normalizeEnabled;
}

void OpenCVWorker::receiveShow()
{
    showEnabled = !showEnabled;
}

void OpenCVWorker::receiveRoi()
{
    roiEnabled = !roiEnabled;
    roiWasToggled = true;
}

void OpenCVWorker::receiveRoiSize(QPoint size)
{
    roiSize = cv::Size(size.x(), size.y());
}

void OpenCVWorker::receiveParameter1(int threshold)
{
    firstParam = threshold;
}

void OpenCVWorker::receiveParameter2(int threshold)
{
    secondParam = threshold;
}

void OpenCVWorker::receiveParameter3(int threshold)
{
    thirdParam = threshold;
}

void OpenCVWorker::receiveParameter4(int threshold)
{
    fourthParam = threshold;
}

void OpenCVWorker::receiveParameter5(int threshold)
{
    fifthParam = threshold;
}

void OpenCVWorker::receiveParameter6(int threshold)
{
    sixthParam = threshold;
}

void OpenCVWorker::receiveParameter7(int threshold)
{
    morphValue = threshold;
}


void OpenCVWorker::receiveBallParam0(int threshold)
{
    ball.varyRadiusMin(threshold);
}

void OpenCVWorker::receiveBallParam1(int threshold)
{
    ball.varyRadiusMax(threshold);
}

void OpenCVWorker::receiveBallParam2(int threshold)
{
    ball.varyCirclePercent(threshold);
}

void OpenCVWorker::receiveBallParam3(int threshold)
{
    ball.varyEpsilon(threshold);
}

void OpenCVWorker::receiveBallParam4(int threshold)
{
    ball.varyMinArea(threshold);
}

void OpenCVWorker::receiveBallParam5(int threshold)
{
    ball.varyMaxArea(threshold);
}


void OpenCVWorker::receiveGoalParam0(int threshold)
{
    goal.whitePix = threshold;
}

void OpenCVWorker::receiveGoalParam1(int threshold)
{
    goal.blackLimit = threshold;
}

void OpenCVWorker::receiveCanny0(int threshold)
{
    lines.cannyParam_0 = threshold;
}

void OpenCVWorker::receiveCanny1(int threshold)
{
    lines.cannyParam_2 = threshold;
}

void OpenCVWorker::receiveCanny2(bool threshold)
{
    lines.cannyParam_3 = threshold;
}

void::OpenCVWorker::receiveHough0(int threshold)
{
    lines.SHoughParam_2 = threshold;
}

void::OpenCVWorker::receiveHough1(double threshold)
{
    lines.SHoughParam_0 = threshold;
}

void::OpenCVWorker::receiveHough2(double threshold)
{
    lines.SHoughParam_1 = threshold*(CV_PI/180);
}

void::OpenCVWorker::receiveHough3(double threshold)
{
    lines.SHoughParam_3 = threshold;
}

void::OpenCVWorker::receiveHough4(double threshold)
{
    lines.SHoughParam_4 = threshold;
}

void::OpenCVWorker::receiveHoughP0(int threshold)
{
    lines.PHoughParam_2 = threshold;
}

void::OpenCVWorker::receiveHoughP1(double threshold)
{
    lines.PHoughParam_0 = threshold;
}

void::OpenCVWorker::receiveHoughP2(double threshold)
{
    lines.PHoughParam_1 = threshold*(CV_PI/180);
}

void::OpenCVWorker::receiveHoughP3(double threshold)
{
    lines.PHoughParam_3 = threshold;
}

void::OpenCVWorker::receiveHoughP4(double threshold)
{
    lines.PHoughParam_4 = threshold;
}

void OpenCVWorker::on_radioButton_toggled(bool checked)
{
    hsv = checked;

}
void OpenCVWorker::on_radioButton2_toggled(bool checked)
{
    ycc = checked;
}
void OpenCVWorker::on_radioButton3_toggled(bool checked)
{
    gray = checked;
}
void OpenCVWorker::on_radioButton4_toggled(bool checked)
{
    if(checked)
    {
        lines.which_Hough = "Standard";
        hough = false;
    }
}

void OpenCVWorker::on_radioButton5_toggled(bool checked)
{
    if(checked)
    {
        lines.which_Hough = "Probabilistic";
        hough = true;
    }
}

void OpenCVWorker::contourShow()
{
    frameContour = ball.getBestContours();
    showContour = !showContour;
}

void OpenCVWorker::canny1Show()
{
    showCanny1 = !showCanny1;
}

void OpenCVWorker::canny2Show()
{
    showCanny2 = !showCanny2;
}

void OpenCVWorker::lines1Show()
{
    lines1Enabled = !lines1Enabled;
}


void OpenCVWorker::lines2Show()
{
    lines2Enabled = !lines2Enabled;
}

void OpenCVWorker::receivePlayers()
{
    playersEnabled = !playersEnabled;
    playersToggled = true;
}

void OpenCVWorker::tracking()
{
    ball.setTracking();
}

void OpenCVWorker::drawBall()
{
   ballPos = ball.getBall();
   bool ballFound = ball.found();
   cv::Rect2d roi = ball.getTracker();
//   std::cout << roi.size() << "\n";
   if(ballFound)
   {
//       cv::circle(frameOriginal, ballPos, 4, cv::Scalar(255,0,255), -1);
       if(ball.enableTracking)
           cv::rectangle(frameOriginal, roi, cv::Scalar(0,0,255));
       else
           cv::circle(frameOriginal, ball.getBall(), 3, cv::Scalar(0,0,255), -1);
   }
}

void OpenCVWorker::storeParameters()
{
    if(hsv)
    {
        hsvPar.param[0] = firstParam;
        hsvPar.param[1] = secondParam;
        hsvPar.param[2] = thirdParam;
        hsvPar.param[3] = fourthParam;
        hsvPar.param[4] = fifthParam;
        hsvPar.param[5] = sixthParam;
        hsvPar.param[6] = morphType;
        hsvPar.param[7] = morphValue;

        if(yccNeverActivated)
        {
            yccPar.param[0] = 0;
            yccPar.param[1] = 255;
            yccPar.param[2] = 0;
            yccPar.param[3] = 255;
            yccPar.param[4] = 0;
            yccPar.param[5] = 255;
            yccPar.param[6] = 3;
            yccPar.param[7] = 0;
        }
    }
    else if(ycc)
    {
        yccNeverActivated = false;
        yccPar.param[0] = firstParam;
        yccPar.param[1] = secondParam;
        yccPar.param[2] = thirdParam;
        yccPar.param[3] = fourthParam;
        yccPar.param[4] = fifthParam;
        yccPar.param[5] = sixthParam;
        yccPar.param[6] = morphType;
        yccPar.param[7] = morphValue;
    }
//    for(int i = 0; i < 8; i++)
//    {
//        std::cout << i << "\t" << hsvPar.param[i] << "\t" << yccPar.param[i] << "\n";
//    }
}

