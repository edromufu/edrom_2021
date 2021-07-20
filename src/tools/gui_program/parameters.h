#ifndef PARAMETERS_H
#define PARAMETERS_H

#include <QWidget>
#include <QThread>
#include "opencvworker.h"
#include <QTimer>
#include <QMovie>
#include <QMenu>

namespace Ui {
class Parameters;
}

class Parameters : public QWidget
{
    Q_OBJECT

protected:
    bool eventFilter(QObject *obj, QEvent *event);

private:
    void setup();

    bool visible;
    bool visible2;
    bool visible3;
    bool visible4;
    bool line1Enabled;
    bool line2Enabled;

    Ui::Parameters *ui;
    QThread *thread;

    QList<QString> imagesInDir;
    QList<QString> videosInDir;

    QString lastFileOpened;
    QString lastVideo;
    QString lastImage;

    QColor getColor;
    OpenCVWorker* worker;
    QPoint mousePos;
    QPoint roiSize = QPoint(1,1);
    bool posChanged;
    int binaryValue;

    bool track = true;
    std::string mode = "Live";

    bool moveRect = true;

    bool rectListShow = false;

    QTimer *workerTrigger = new QTimer();

public:
    explicit Parameters(QWidget *parent = 0);
    ~Parameters();
    typedef cv::Point point;

signals:
    void sendSetup();
    void sendToggleStream(bool);
    void sendMorphology(point data);
    void correctedValue(int value);
    void sendImageName(QString filename);
    void sendVideoName(QString filename);
    void liveMode();
    void videoMode(QString);
    void imageMode(QString);
    void recordMode(QString);
    void sendImagePath(QString);
    void sendMousePos(QPoint);
    void sendRoiSize(QPoint);
    void sendRoiPath(QString);
    void timerReset(int);
    void endRecording();

private slots:
    void receiveFrame(QImage frame);
    void receiveToggleStream();
    void toggleRecording();

    void cannySwitchPage();
    void enableLines();

    void changePage1();
    void changePage2();
    void changePage3();
    void changePage4();

    void changeText1(bool state);
    void changeText2(bool state);

    void saveFile(bool clicked);
    void readFile(bool clicked);
    void quickSave(bool clicked);
    void help(bool clicked);

    void setDoubleValue(int value);
    void setIntValue(double value);

    void setCorrectedValue(int value);
    void setSliderSpin(int value);

    void activateOnUnite(bool checked);

    void morphology(bool clicked);
    void storeMorph(bool clicked);

    void changeTrackStyleSheet();


    void saveImage();
    void loadVideo();
    void loadImage();
    void saveRoi();

    void changeMode();
    void changeRoiSize(int);
    void showRectList();

    void next();
    void previous();

};

#endif // parameters_H
