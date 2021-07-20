#ifndef OPENCVWORKER_H
#define OPENCVWORKER_H

#include <QObject>
#include <QImage>
#include <QFile>
#include <QFileDialog>
#include <QMessageBox>
#include <QPushButton>
#include <QXmlStreamWriter>
#include <QXmlStreamReader>
#include <QSpinBox>
#include <QShortcut>
#include <QKeySequence>
#include <QLabel>
#include <QMouseEvent>
#include <colorparameters.h>
#include <iostream>
#include <vector>
#include <Ball.hpp>
#include <LinesFilter.hpp>
#include <Goal.hpp>
#include <Players.hpp>

class OpenCVWorker : public QObject
{
    Q_OBJECT

private:
    Camera camera;

    Ball ball;
    Field field;
    Goal goal;
    LinesFilter lines;
    Players player;

    cv::Mat frameOriginal;
    cv::Mat frameProcessed;
    cv::Mat frameNormalized;
    cv::Mat frameIntersection;
    cv::Mat frameHsv;
    cv::Mat frameYcc;
    cv::Mat frameContour;
    cv::Mat frameCanny;
    cv::Mat frameLines1;
    cv::Mat frameLines2;
    cv::Mat frameGoalFieldBinary;
    cv::Mat frameField;
    cv::Mat framePlayers;
    cv::Mat frameRoi;

    cv::VideoCapture *cap;
    cv::Mat image;

    int64 startFps;

    bool lines1Enabled = false;
    bool lines2Enabled = false;

    bool toggleStream = true;
    bool inRangeEnabled = false;
    bool showEnabled = false;
    bool showContour = false;
    bool normalImage = false;
    bool showFieldOnly = false;
    bool showBinary = false;
    bool showGoal = false;

    bool ballWasToggled = false;
    bool goalWasToggled = false;
    bool cannyWasToggled = false;
    bool playersToggled = false;
    bool roiWasToggled = false;

    cv::Point ballPos;
    cv::Point mousePos;
    cv::Size roiSize;
    cv::Rect roi;

    void process();
    void drawBall();
    void deviceOpened(const int device);
    void fixToggles();

    QString mode = "Live";

public:
    explicit OpenCVWorker(QObject *parent = 0);
    ~OpenCVWorker();

    bool normalizeEnabled = false;
    bool playersEnabled = false;
    bool ballEnabled = false;
    bool cannyEnabled = false;
    bool goalEnabled = false;
    bool showCanny1 = false;
    bool showCanny2 = false;
    bool hough = false;
    bool roiEnabled = false;

    bool hsv;
    bool ycc;
    bool gray;

    int firstParam;
    int secondParam;
    int thirdParam;
    int fourthParam;
    int fifthParam;
    int sixthParam;
    int morphType;
    int morphValue;

    int radius;
    int circlePercentage;
    int numClusters;

    int params[8];
    bool fileRead;

    bool yccNeverActivated;
    int tempShape;

    colorparameters hsvPar;
    colorparameters yccPar;

    void storeParameters();

signals:
    void sendFrame(QImage frameProcessed);
    void sendFPS(double);

public slots:
    void receiveGrabFrame();
    void receiveSetup();
    void receiveVideo(QString);
    void receiveImage(QString);
    void receiveRecord(QString);
    void endRecord();

    void receiveToggleStream(bool);
    void receiveNormalizeEnabled();
    void receiveShow();
    void receiveBall();
    void receivePlayers();

    void receiveGoal();
    void receiveFieldOnly();
    void receiveBinary();
    void receiveLines();
    void receiveShowGoal();

    void receiveInRangeEnabled();
    void receiveParameter1(int threshold);
    void receiveParameter2(int threshold);
    void receiveParameter3(int threshold);
    void receiveParameter4(int threshold);
    void receiveParameter5(int threshold);
    void receiveParameter6(int threshold);
    void receiveParameter7(int threshold);

    void receiveBallParam0(int threshold);
    void receiveBallParam1(int threshold);
    void receiveBallParam2(int threshold);
    void receiveBallParam3(int threshold);
    void receiveBallParam4(int threshold);
    void receiveBallParam5(int threshold);

    void receiveGoalParam0(int threshold);
    void receiveGoalParam1(int threshold);

    void receiveCanny0(int threshold);
    void receiveCanny1(int threshold);
    void receiveCanny2(bool threshold);

    void receiveHough0(int threshold);
    void receiveHough1(double threshold);
    void receiveHough2(double threshold);
    void receiveHough3(double threshold);
    void receiveHough4(double threshold);

    void receiveHoughP0(int threshold);
    void receiveHoughP1(double threshold);
    void receiveHoughP2(double threshold);
    void receiveHoughP3(double threshold);
    void receiveHoughP4(double threshold);

    void receiveRoi();
    void receiveRoiSize(QPoint);

    void contourShow();
    void canny1Show();
    void canny2Show();
    void lines1Show();
    void lines2Show();

    void on_radioButton_toggled(bool checked);
    void on_radioButton2_toggled(bool checked);
    void on_radioButton3_toggled(bool checked);
    void on_radioButton4_toggled(bool checked);
    void on_radioButton5_toggled(bool checked);

    void receiveMousePos(QPoint);

    void saveImage(QString);
    void saveRoi(QString);

    void tracking();

};

#endif // OPENCVWORKER_H
