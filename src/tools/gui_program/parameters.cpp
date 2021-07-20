#include "parameters.h"
#include "ui_parameters.h"
#include <QSlider>
#include <QLCDNumber>
#include <boost/filesystem.hpp>

//TODO: achar um jeito de abrir a proxima imagem sem ter que dar load diretamente.

Parameters::Parameters(QWidget *parent) :
    visible(0),
    visible2(0),
    visible3(0),
    visible4(0),
    line1Enabled(0),
    line2Enabled(0),
    QWidget(parent),

    ui(new Ui::Parameters)
{
    QPixmap saveIcon("Icons/save.png");
    QPixmap quickIcon("Icons/quicksave.png");
    QPixmap readIcon("Icons/read.png");
    QPixmap quitIcon("Icons/quit.jpeg");
    QPixmap commandIcon("Icons/shortcut.png");
    QPixmap edromLogo("Icons/edrom.jpg");
    QPixmap ballIcon("Icons/ball.jpeg");
    QPixmap goalIcon("Icons/goal.png");
    QPixmap robotIcon("Icons/robot.png");
    QPixmap linesIcon("Icons/fieldlines.png");

    ui->setupUi(this);

    ui->save->setIcon(QIcon(saveIcon));
    ui->quick_save->setIcon(QIcon(quickIcon));
    ui->read->setIcon(QIcon(readIcon));
    ui->quit->setIcon(QIcon(quitIcon));
    ui->help->setIcon(QIcon(commandIcon));
    ui->edrom->setIcon(QIcon(edromLogo));
    ui->ball->setIcon(QIcon(ballIcon));
    ui->goal->setIcon(QIcon(goalIcon));
    ui->robot->setIcon(QIcon(robotIcon));
    ui->fieldLines->setIcon(QIcon(linesIcon));

    ui->save->setIconSize(QSize(40,40));
    ui->quick_save->setIconSize(QSize(40,40));
    ui->read->setIconSize(QSize(40,40));
    ui->quit->setIconSize(QSize(40,40));
    ui->help->setIconSize(QSize(20,20));
    ui->edrom->setIconSize(QSize(50,50));
    ui->ball->setIconSize(QSize(40,40));
    ui->goal->setIconSize(QSize(40,40));
    ui->robot->setIconSize(QSize(40,40));
    ui->fieldLines->setIconSize(QSize(40,40));

    ui->slider1->setValue(0);
    ui->slider2->setValue(255);
    ui->slider3->setValue(0);
    ui->slider4->setValue(255);
    ui->slider5->setValue(0);
    ui->slider6->setValue(255);

    ui->spinBox->setValue(0);
    ui->spinBox_2->setValue(255);
    ui->spinBox_3->setValue(0);
    ui->spinBox_4->setValue(255);
    ui->spinBox_5->setValue(0);
    ui->spinBox_6->setValue(255);

    ui->slider_21->setValue(20);
    ui->slider_22->setValue(40);
    ui->slider_24->setValue(100);
    ui->slider_25->setValue(2000);

    ui->spinBox_21->setValue(20);
    ui->spinBox_22->setValue(40);
    ui->spinBox_24->setValue(100);
    ui->spinBox_25->setValue(2000);


    ui->save->setToolTip(tr("Create New Save File"));
    ui->read->setToolTip(tr("Read Parameters"));
    ui->quick_save->setToolTip("Quick Save");
    ui->quit->setToolTip("Exit");
    ui->pushButtonPlay->setToolTip("Pause");
    ui->help->setToolTip("Help");
    ui->confirm->setToolTip("Use to save erode/dilate information in the cv::Mat");
    ui->ball->setToolTip("Use to search for the ball");
    ui->goal->setToolTip("Use to search for the goal");
    ui->robot->setToolTip("Use to search for robots");
    ui->fieldLines->setToolTip("Use to search for the white lines in the field");

    ui->label_50->setToolTip("Canny: Definir threshold 1.");
    ui->label_51->setToolTip("Canny: Definir aperture size.");
    ui->label_52->setToolTip("HoughLines: Definir Threshold das linhas.");
    ui->label_53->setToolTip("HoughLines: Definir distancia rho.");
    ui->label_54->setToolTip("HoughLines: Definir o multiplicador N do angulo theta.(N * (PI/180))");
    ui->label_55->setToolTip("HoughLines: Definir divisor de rho.");
    ui->label_56->setToolTip("HoughLines: Definir divisor de theta.");


    ui->roi->setChecked(0);
    ui->ball->setChecked(0);
    ui->goal->setChecked(0);
    ui->fieldLines->setChecked(0);
    ui->robot->setChecked(0);

    ui->labelView->setScaledContents(true);
    ui->labelView->installEventFilter(this);
    ui->stackedWidget->setCurrentIndex(0);
//    ui->fps->hide();
    ui->rect_frame->hide();
    ui->previous->hide();
    ui->next->hide();
    ui->stop->hide();

    QMovie *movie = new QMovie("Icons/GIFs/recording.gif");
    ui->movieLabel->setMovie(movie);
    movie->start();
    ui->movieLabel->hide();

    QMenu *menu =  new QMenu();
    QActionGroup *actGroup = new QActionGroup(this);
    QAction *centered = new QAction("Centered", actGroup);
    QAction *topLeft = new QAction("Top Left", actGroup);
    QAction *bottomRight = new QAction("Bottom Right", actGroup);
    centered->setCheckable(true);
    topLeft->setCheckable(true);
    bottomRight->setCheckable(true);
    menu->addAction(topLeft);
    menu->addAction(centered);
    menu->addAction(bottomRight);
    connect(centered, SIGNAL(triggered()), ui->centered, SLOT(click()));
    connect(topLeft, SIGNAL(triggered()), ui->top_left, SLOT(click()));
    connect(bottomRight, SIGNAL(triggered()), ui->bottom_right, SLOT(click()));
    ui->rect_button->setMenu(menu);

    binaryValue = 0;
    setup();
}

Parameters::~Parameters()
{
    thread->quit();
    while(!thread->isFinished());

    delete thread;
    delete ui;
}

void Parameters::setup()
{
    typedef cv::Point point;
    qRegisterMetaType<point> ("point");
    thread = new QThread();
    worker = new OpenCVWorker();
    QShortcut *key = new QShortcut(Qt::Key_Escape, this, SLOT(close()));
    QShortcut *saveKey = new QShortcut(Qt::CTRL+Qt::Key_S, ui->save, SLOT(click()));
    QShortcut *quickSaveKey = new QShortcut(Qt::Key_S, ui->quick_save, SLOT(click()));
    QShortcut *read = new QShortcut(Qt::Key_R, ui->read, SLOT(click()));
    QShortcut *hsvToggle = new QShortcut(Qt::Key_1, ui->radioButton, SLOT(toggle()));
    QShortcut *yccToggle = new QShortcut(Qt::Key_2, ui->radioButton_2, SLOT(toggle()));
    QShortcut *normalizeCheck = new QShortcut(Qt::Key_N, ui->normalizeEnabled, SLOT(click()));
    QShortcut *inRangeCheck = new QShortcut(Qt::Key_I, ui->inRangeEnabled, SLOT(click()));
    QShortcut *unionCheck = new QShortcut(Qt::Key_U, ui->uniteEnabled, SLOT(click()));
    QShortcut *showCheck = new QShortcut(Qt::Key_M, ui->showMat, SLOT(click()));
    QShortcut *playPause = new QShortcut(Qt::Key_Space, ui->pushButtonPlay, SLOT(click()));
    QShortcut *help = new QShortcut(Qt::Key_H, ui->help, SLOT(click()));
    QShortcut *focusX = new QShortcut(Qt::Key_X, ui->roi_size_x, SLOT(setFocus()));
    QShortcut *focusY = new QShortcut(Qt::Key_Y, ui->roi_size_y, SLOT(setFocus()));
    QShortcut *next = new QShortcut(Qt::RightArrow, ui->next, SLOT(click()));
    QShortcut *previous = new QShortcut(Qt::LeftArrow, ui->previous, SLOT(click()));
    workerTrigger->setInterval(1);
    worker->hsvPar.morph.clear();
    worker->yccPar.morph.clear();

    connect(this, SIGNAL(liveMode()), this, SIGNAL(sendSetup()));
    connect(this, SIGNAL(timerReset(int)), workerTrigger, SLOT(start(int)));
    connect(this, SIGNAL(videoMode(QString)), worker, SLOT(receiveVideo(QString)));
    connect(this, SIGNAL(imageMode(QString)), worker, SLOT(receiveImage(QString)));

    connect(ui->load_video, SIGNAL(clicked()), this, SLOT(loadVideo()));
    connect(this, SIGNAL(sendVideoName(QString)), worker, SLOT(receiveVideo(QString)));

    connect(ui->save_image, SIGNAL(clicked(bool)), this, SLOT(saveImage()));
    connect(this, SIGNAL(sendImagePath(QString)), worker, SLOT(saveImage(QString)));

    connect(ui->load_image, SIGNAL(clicked()), this, SLOT(loadImage()));
    connect(this, SIGNAL(sendImageName(QString)), worker, SLOT(receiveImage(QString)));
    connect(ui->next, SIGNAL(clicked()), this, SLOT(next()));
    connect(ui->previous, SIGNAL(clicked()), this, SLOT(previous()));

    connect(this, SIGNAL(recordMode(QString)), worker, SLOT(receiveRecord(QString)));
    connect(ui->stop, SIGNAL(clicked(bool)), this, SLOT(toggleRecording()));
    connect(this, SIGNAL(endRecording()), worker, SLOT(endRecord()));

    connect(ui->mode_button, SIGNAL(clicked()), this, SLOT(changeMode()));

    connect(workerTrigger, SIGNAL(timeout()), worker, SLOT(receiveGrabFrame()));
    connect(thread, SIGNAL(finished()), worker, SLOT(deleteLater()));
    connect(thread, SIGNAL(finished()), workerTrigger, SLOT(deleteLater()));
    connect(this, SIGNAL(sendSetup()), worker, SLOT(receiveSetup()));
    connect(this, SIGNAL(sendToggleStream(bool)), worker, SLOT(receiveToggleStream(bool)));

    connect(ui->ball, SIGNAL(clicked(bool)), worker, SLOT(receiveBall()));
    connect(ui->ball, SIGNAL(clicked(bool)), this, SLOT(changePage1()));

    connect(ui->goal, SIGNAL(clicked(bool)), worker, SLOT(receiveGoal()));
    connect(ui->goal, SIGNAL(clicked(bool)), this, SLOT(changePage2()));

    connect(ui->robot, SIGNAL(clicked(bool)), worker, SLOT(receivePlayers()));

    connect(ui->roi, SIGNAL(clicked(bool)), this, SLOT(changePage4()));
    connect(ui->roi, SIGNAL(clicked(bool)), worker, SLOT(receiveRoi()));
    connect(this, SIGNAL(sendMousePos(QPoint)), worker, SLOT(receiveMousePos(QPoint)));
    connect(ui->roi_size_x, SIGNAL(valueChanged(int)), this, SLOT(changeRoiSize(int)));
    connect(ui->roi_size_y, SIGNAL(valueChanged(int)), this, SLOT(changeRoiSize(int)));
    connect(this, SIGNAL(sendRoiSize(QPoint)), worker, SLOT(receiveRoiSize(QPoint)));
    connect(ui->rect_button, SIGNAL(clicked(bool)), this, SLOT(showRectList()));
    connect(ui->save_roi, SIGNAL(clicked(bool)), this, SLOT(saveRoi()));
    connect(this, SIGNAL(sendRoiPath(QString)), worker, SLOT(saveRoi(QString)));

//    connect(worker, SIGNAL(sendFPS(double)), ui->fps, SLOT(display(double)));

    connect(ui->fieldLines, SIGNAL(clicked(bool)), worker, SLOT(receiveLines()));
    connect(ui->fieldLines, SIGNAL(clicked(bool)), this, SLOT(changePage3()));

    connect(ui->radioButton, SIGNAL(toggled(bool)), worker, SLOT(on_radioButton_toggled(bool)));
    connect(ui->radioButton, SIGNAL(toggled(bool)), this, SLOT(changeText1(bool)));

    connect(ui->radioButton_2, SIGNAL(toggled(bool)), worker, SLOT(on_radioButton2_toggled(bool)));
    connect(ui->radioButton_2, SIGNAL(toggled(bool)), this, SLOT(changeText2(bool)));

    connect(ui->radioButton_3, SIGNAL(toggled(bool)), worker, SLOT(on_radioButton3_toggled(bool)));

    connect(ui->radioButton_4, SIGNAL(toggled(bool)), this, SLOT(cannySwitchPage()));
    connect(ui->radioButton_4, SIGNAL(toggled(bool)), worker, SLOT(on_radioButton4_toggled(bool)));

    connect(ui->radioButton_5, SIGNAL(toggled(bool)), this, SLOT(cannySwitchPage()));
    connect(ui->radioButton_5, SIGNAL(toggled(bool)), worker, SLOT(on_radioButton5_toggled(bool)));

    connect(ui->slider1, SIGNAL(valueChanged(int)), ui->spinBox, SLOT(setValue(int)));
    connect(ui->spinBox, SIGNAL(valueChanged(int)), ui->slider1, SLOT(setValue(int)));
    connect(ui->slider1, SIGNAL(valueChanged(int)), worker, SLOT(receiveParameter1(int)));

    connect(ui->slider2, SIGNAL(valueChanged(int)), ui->spinBox_2, SLOT(setValue(int)));
    connect(ui->spinBox_2, SIGNAL(valueChanged(int)), ui->slider2, SLOT(setValue(int)));
    connect(ui->slider2, SIGNAL(valueChanged(int)), worker, SLOT(receiveParameter2(int)));

    connect(ui->slider3, SIGNAL(valueChanged(int)), ui->spinBox_3, SLOT(setValue(int)));
    connect(ui->spinBox_3, SIGNAL(valueChanged(int)), ui->slider3, SLOT(setValue(int)));
    connect(ui->slider3, SIGNAL(valueChanged(int)), worker, SLOT(receiveParameter3(int)));

    connect(ui->slider4, SIGNAL(valueChanged(int)), ui->spinBox_4, SLOT(setValue(int)));
    connect(ui->spinBox_4, SIGNAL(valueChanged(int)), ui->slider4, SLOT(setValue(int)));
    connect(ui->slider4, SIGNAL(valueChanged(int)), worker, SLOT(receiveParameter4(int)));

    connect(ui->slider5, SIGNAL(valueChanged(int)), ui->spinBox_5, SLOT(setValue(int)));
    connect(ui->spinBox_5, SIGNAL(valueChanged(int)), ui->slider5, SLOT(setValue(int)));
    connect(ui->slider5, SIGNAL(valueChanged(int)), worker, SLOT(receiveParameter5(int)));

    connect(ui->slider6, SIGNAL(valueChanged(int)), ui->spinBox_6, SLOT(setValue(int)));
    connect(ui->spinBox_6, SIGNAL(valueChanged(int)), ui->slider6, SLOT(setValue(int)));
    connect(ui->slider6, SIGNAL(valueChanged(int)), worker, SLOT(receiveParameter6(int)));

    connect(ui->slider7, SIGNAL(valueChanged(int)), ui->spinBox_7, SLOT(setValue(int)));
    connect(ui->spinBox_7, SIGNAL(valueChanged(int)), ui->slider7, SLOT(setValue(int)));
    connect(ui->slider7, SIGNAL(valueChanged(int)), worker, SLOT(receiveParameter7(int)));

    connect(ui->slider_20, SIGNAL(valueChanged(int)), ui->spinBox_20, SLOT(setValue(int)));
    connect(ui->spinBox_20, SIGNAL(valueChanged(int)), ui->slider_20, SLOT(setValue(int)));
    connect(ui->slider_20, SIGNAL(valueChanged(int)), worker, SLOT(receiveBallParam0(int)));

    connect(ui->slider_21, SIGNAL(valueChanged(int)), ui->spinBox_21, SLOT(setValue(int)));
    connect(ui->spinBox_21, SIGNAL(valueChanged(int)), ui->slider_21, SLOT(setValue(int)));
    connect(ui->slider_21, SIGNAL(valueChanged(int)), worker, SLOT(receiveBallParam1(int)));

    connect(ui->slider_22, SIGNAL(valueChanged(int)), ui->spinBox_22, SLOT(setValue(int)));
    connect(ui->spinBox_22, SIGNAL(valueChanged(int)), ui->slider_22, SLOT(setValue(int)));
    connect(ui->slider_22, SIGNAL(valueChanged(int)), worker, SLOT(receiveBallParam2(int)));

    connect(ui->slider_23, SIGNAL(valueChanged(int)), ui->spinBox_23, SLOT(setValue(int)));
    connect(ui->spinBox_23, SIGNAL(valueChanged(int)), ui->slider_23, SLOT(setValue(int)));
    connect(ui->slider_23, SIGNAL(valueChanged(int)), worker, SLOT(receiveBallParam3(int)));

    connect(ui->slider_24, SIGNAL(valueChanged(int)), ui->spinBox_24, SLOT(setValue(int)));
    connect(ui->spinBox_24, SIGNAL(valueChanged(int)), ui->slider_24, SLOT(setValue(int)));
    connect(ui->slider_24, SIGNAL(valueChanged(int)), worker, SLOT(receiveBallParam4(int)));

    connect(ui->slider_25, SIGNAL(valueChanged(int)), ui->spinBox_25, SLOT(setValue(int)));
    connect(ui->spinBox_25, SIGNAL(valueChanged(int)), ui->slider_25, SLOT(setValue(int)));
    connect(ui->slider_25, SIGNAL(valueChanged(int)), worker, SLOT(receiveBallParam5(int)));

    connect(ui->slider_30, SIGNAL(valueChanged(int)), ui->spinBox_30, SLOT(setValue(int)));
    connect(ui->spinBox_30, SIGNAL(valueChanged(int)), ui->slider_30, SLOT(setValue(int)));
    connect(ui->slider_30, SIGNAL(valueChanged(int)), worker, SLOT(receiveGoalParam0(int)));

    connect(ui->slider_31, SIGNAL(valueChanged(int)), ui->spinBox_31, SLOT(setValue(int)));
    connect(ui->spinBox_31, SIGNAL(valueChanged(int)), ui->slider_31, SLOT(setValue(int)));
    connect(ui->slider_31, SIGNAL(valueChanged(int)), worker, SLOT(receiveGoalParam1(int)));

    connect(ui->slider_50, SIGNAL(valueChanged(int)), ui->spinBox_50, SLOT(setValue(int)));
    connect(ui->spinBox_50, SIGNAL(valueChanged(int)), ui->slider_50, SLOT(setValue(int)));
    connect(ui->slider_50, SIGNAL(valueChanged(int)), worker, SLOT(receiveCanny0(int)));

    connect(ui->slider_51, SIGNAL(valueChanged(int)),this, SLOT(setCorrectedValue(int)));
    connect(ui->spinBox_51, SIGNAL(valueChanged(int)), this, SLOT(setCorrectedValue(int)));
    connect(this, SIGNAL(correctedValue(int)), this, SLOT(setSliderSpin(int)));
    connect(ui->spinBox_51, SIGNAL(valueChanged(int)), worker, SLOT(receiveCanny1(int)));

    connect(ui->gradient, SIGNAL(toggled(bool)), worker, SLOT(receiveCanny2(bool)));

    connect(ui->slider_52, SIGNAL(valueChanged(int)), ui->spinBox_52, SLOT(setValue(int)));
    connect(ui->spinBox_52, SIGNAL(valueChanged(int)), ui->slider_52, SLOT(setValue(int)));
    connect(ui->slider_52, SIGNAL(valueChanged(int)), worker, SLOT(receiveHough0(int)));

    connect(ui->slider_53, SIGNAL(valueChanged(int)), this, SLOT(setDoubleValue(int)));
    connect(ui->spinBox_53, SIGNAL(valueChanged(double)), this, SLOT(setIntValue(double)));
    connect(ui->spinBox_53, SIGNAL(valueChanged(double)), worker, SLOT(receiveHough1(double)));

    connect(ui->slider_54, SIGNAL(valueChanged(int)), this, SLOT(setDoubleValue(int)));
    connect(ui->spinBox_54, SIGNAL(valueChanged(double)), this, SLOT(setIntValue(double)));
    connect(ui->spinBox_54, SIGNAL(valueChanged(double)), worker, SLOT(receiveHough2(double)));

    connect(ui->slider_55, SIGNAL(valueChanged(int)), this, SLOT(setDoubleValue(int)));
    connect(ui->spinBox_55, SIGNAL(valueChanged(double)), this, SLOT(setIntValue(double)));
    connect(ui->spinBox_55, SIGNAL(valueChanged(double)), worker, SLOT(receiveHough3(double)));

    connect(ui->slider_56, SIGNAL(valueChanged(int)), this, SLOT(setDoubleValue(int)));
    connect(ui->spinBox_56, SIGNAL(valueChanged(double)), this, SLOT(setIntValue(double)));
    connect(ui->spinBox_56, SIGNAL(valueChanged(double)), worker, SLOT(receiveHough4(double)));

    connect(ui->slider_500, SIGNAL(valueChanged(int)), ui->spinBox_500, SLOT(setValue(int)));
    connect(ui->spinBox_500, SIGNAL(valueChanged(int)), ui->slider_500, SLOT(setValue(int)));
    connect(ui->slider_500, SIGNAL(valueChanged(int)), worker, SLOT(receiveCanny0(int)));

    connect(ui->slider_501, SIGNAL(valueChanged(int)),this, SLOT(setCorrectedValue(int)));
    connect(ui->spinBox_501, SIGNAL(valueChanged(int)), this, SLOT(setCorrectedValue(int)));
    connect(this, SIGNAL(correctedValue(int)), this, SLOT(setSliderSpin(int)));
    connect(ui->spinBox_501, SIGNAL(valueChanged(int)), worker, SLOT(receiveCanny1(int)));

    connect(ui->slider_502, SIGNAL(valueChanged(int)), ui->spinBox_502, SLOT(setValue(int)));
    connect(ui->spinBox_502, SIGNAL(valueChanged(int)), ui->slider_502, SLOT(setValue(int)));
    connect(ui->slider_502, SIGNAL(valueChanged(int)), worker, SLOT(receiveHoughP0(int)));

    connect(ui->slider_503, SIGNAL(valueChanged(int)), this, SLOT(setDoubleValue(int)));
    connect(ui->spinBox_503, SIGNAL(valueChanged(double)), this, SLOT(setIntValue(double)));
    connect(ui->spinBox_503, SIGNAL(valueChanged(double)), worker, SLOT(receiveHoughP1(double)));

    connect(ui->slider_504, SIGNAL(valueChanged(int)), this, SLOT(setDoubleValue(int)));
    connect(ui->spinBox_504, SIGNAL(valueChanged(double)), this, SLOT(setIntValue(double)));
    connect(ui->spinBox_504, SIGNAL(valueChanged(double)), worker, SLOT(receiveHoughP2(double)));

    connect(ui->slider_505, SIGNAL(valueChanged(int)), this, SLOT(setDoubleValue(int)));
    connect(ui->spinBox_505, SIGNAL(valueChanged(double)), this, SLOT(setIntValue(double)));
    connect(ui->spinBox_505, SIGNAL(valueChanged(double)), worker, SLOT(receiveHoughP3(double)));

    connect(ui->slider_506, SIGNAL(valueChanged(int)), this, SLOT(setDoubleValue(int)));
    connect(ui->spinBox_506, SIGNAL(valueChanged(double)), this, SLOT(setIntValue(double)));
    connect(ui->spinBox_506, SIGNAL(valueChanged(double)), worker, SLOT(receiveHoughP4(double)));

    connect(ui->showGoal, SIGNAL(clicked(bool)), worker, SLOT(receiveShowGoal()));
    connect(ui->showBinary, SIGNAL(clicked(bool)), worker, SLOT(receiveBinary()));

    connect(ui->showFieldOnly, SIGNAL(clicked(bool)), worker, SLOT(receiveFieldOnly()));
    connect(ui->showFieldOnly_2, SIGNAL(clicked(bool)), worker, SLOT(receiveFieldOnly()));

    connect(ui->contour_Button, SIGNAL(clicked(bool)), worker, SLOT(contourShow()));

    connect(ui->show_canny, SIGNAL(clicked(bool)), worker, SLOT(canny1Show()));
    connect(ui->show_canny, SIGNAL(clicked(bool)), this, SLOT(enableLines()));
    connect(ui->show_lines, SIGNAL(clicked(bool)), worker, SLOT(lines1Show()));

    connect(ui->show_canny_2, SIGNAL(clicked(bool)), worker, SLOT(canny2Show()));
    connect(ui->show_canny_2, SIGNAL(clicked(bool)), this, SLOT(enableLines()));
    connect(ui->show_lines_2, SIGNAL(clicked(bool)), worker, SLOT(lines2Show()));

    connect(ui->pushButtonPlay, SIGNAL(clicked(bool)), this, SLOT(receiveToggleStream()));
    connect(ui->inRangeEnabled, SIGNAL(toggled(bool)), worker, SLOT(receiveInRangeEnabled()));
    connect(ui->normalizeEnabled, SIGNAL(toggled(bool)), worker, SLOT(receiveNormalizeEnabled()));
    connect(ui->uniteEnabled, SIGNAL(toggled(bool)), ui->showMat, SLOT(setEnabled(bool)));
    connect(ui->uniteEnabled, SIGNAL(toggled(bool)), this, SLOT(activateOnUnite(bool)));
    connect(ui->showMat, SIGNAL(toggled(bool)), worker, SLOT(receiveShow()));

    connect(ui->save, SIGNAL(clicked(bool)), this, SLOT(saveFile(bool)));
    connect(ui->read, SIGNAL(clicked(bool)), this, SLOT(readFile(bool)));
    connect(ui->quick_save, SIGNAL(clicked(bool)), this, SLOT(quickSave(bool)));
    connect(ui->quit, SIGNAL(clicked(bool)), this, SLOT(close()));
    connect(ui->help, SIGNAL(clicked(bool)), this, SLOT(help(bool)));

    connect(ui->morphology, SIGNAL(clicked(bool)), this, SLOT(morphology(bool)));
    connect(ui->confirm, SIGNAL(clicked(bool)), this, SLOT(storeMorph(bool)));

    connect(ui->track, SIGNAL(clicked(bool)), worker, SLOT(tracking()));
    connect(ui->track, SIGNAL(clicked(bool)), this, SLOT(changeTrackStyleSheet()));

    connect(worker, SIGNAL(sendFrame(QImage)), this, SLOT(receiveFrame(QImage)));
    connect(thread, SIGNAL(started()), workerTrigger, SLOT(start()));
    connect(thread, SIGNAL(finished()), worker, SLOT(deleteLater()));
    connect(thread, SIGNAL(finished()), workerTrigger, SLOT(deleteLater()));

    workerTrigger->start();
    worker->moveToThread(thread);
    workerTrigger->moveToThread(thread);

    thread->start();

    emit sendSetup();

}

void Parameters::enableLines()
{
    QObject* obj = sender();
    if(obj == ui->show_canny)
    {
        line1Enabled = !line1Enabled;
        ui->show_lines->setEnabled(line1Enabled);
    }
    else if(obj == ui->show_canny_2)
    {
        line2Enabled = !line2Enabled;
        ui->show_lines_2->setEnabled(line2Enabled);
    }
}

void Parameters::cannySwitchPage()
{
    QObject* obj =sender();
    if(obj == ui->radioButton_4)
    {
        ui->stackedWidget_2->setCurrentIndex(0);
    }
    else if(obj == ui->radioButton_5)
    {
        ui->stackedWidget_2->setCurrentIndex(1);
    }
}

void Parameters::showRectList()
{
    rectListShow = !rectListShow;
    ui->rect_frame->setVisible(rectListShow);
}

void Parameters::setCorrectedValue(int value)
{
    int correct;
    if(value == 3 || value == 5 || value == 7)
    {
        if(value == 3)
        {
            ui->slider_50->setMinimum(0);
            ui->slider_50->setMaximum(2500);
            ui->spinBox_50->setMinimum(0);
            ui->spinBox_50->setMaximum(2500);
            ui->slider_50->setValue(0);
            ui->spinBox_50->setValue(0);

            ui->slider_500->setMinimum(0);
            ui->slider_500->setMaximum(2500);
            ui->spinBox_500->setMinimum(0);
            ui->spinBox_500->setMaximum(2500);
            ui->slider_500->setValue(0);
            ui->spinBox_500->setValue(0);
            correct = 0;

        }
        else if(value == 5)
        {
            ui->slider_50->setMinimum(2500);
            ui->slider_50->setMaximum(20000);
            ui->spinBox_50->setMinimum(5000);
            ui->spinBox_50->setMaximum(25000);
            ui->slider_50->setValue(5000);
            ui->spinBox_50->setValue(5000);

            ui->slider_500->setMinimum(2500);
            ui->slider_500->setMaximum(20000);
            ui->spinBox_500->setMinimum(5000);
            ui->spinBox_500->setMaximum(25000);
            ui->slider_500->setValue(5000);
            ui->spinBox_500->setValue(5000);

            correct = 1;
        }
        else if(value == 7)
        {
            ui->slider_50->setMinimum(10000);
            ui->slider_50->setMaximum(35000);
            ui->spinBox_50->setMinimum(30000);
            ui->spinBox_50->setMaximum(75000);
            ui->slider_50->setValue(30000);
            ui->spinBox_50->setValue(30000);

            ui->slider_500->setMinimum(10000);
            ui->slider_500->setMaximum(35000);
            ui->spinBox_500->setMinimum(30000);
            ui->spinBox_500->setMaximum(75000);
            ui->slider_500->setValue(30000);
            ui->spinBox_500->setValue(30000);

            correct = 2;
        }
    }
    else
    {
        if(value == 0)
        {
            ui->slider_50->setMinimum(0);
            ui->slider_50->setMaximum(2500);
            ui->spinBox_50->setMinimum(0);
            ui->spinBox_50->setMaximum(2500);
            ui->slider_50->setValue(0);
            ui->spinBox_50->setValue(0);
            correct = 3;
        }
        else if(value == 1)
        {
            ui->slider_50->setMinimum(2500);
            ui->slider_50->setMaximum(20000);
            ui->spinBox_50->setMinimum(0);
            ui->spinBox_50->setMaximum(2500);
            ui->slider_50->setValue(5000);
            ui->spinBox_50->setValue(5000);
            correct = 5;
        }
        else if(value == 2)
        {
            ui->slider_50->setMinimum(10000);
            ui->slider_50->setMaximum(35000);
            ui->spinBox_50->setMinimum(0);
            ui->spinBox_50->setMaximum(2500);
            ui->slider_50->setValue(30000);
            ui->spinBox_50->setValue(30000);
            correct = 7;
        }
    }
    emit(correctedValue(correct));
}

void Parameters::setSliderSpin(int value)
{
    if(value == 3 || value == 5 || value == 7)
    {
        ui->spinBox_51->setValue(value);
        ui->spinBox_501->setValue(value);
    }
    else
    {
        ui->slider_51->setValue(value);
        ui->slider_501->setValue(value);
    }
}

void Parameters::setDoubleValue(int value)
{
    double doubleValue;
    QObject* obj = sender();
    if(obj == ui->slider_53)
    {
        doubleValue = value/100.00;
        ui->spinBox_53->setValue(doubleValue);
    }
    else if(obj == ui->slider_54)
    {
        doubleValue = value/100.00;
        ui->spinBox_54->setValue(doubleValue);
    }
    else if(obj == ui->slider_55)
    {
        doubleValue = value/100.00;
        ui->spinBox_55->setValue(doubleValue);
    }
    else if(obj == ui->slider_56)
    {
        doubleValue = value/100.00;
        ui->spinBox_56->setValue(doubleValue);
    }
    if(obj == ui->slider_503)
    {
        doubleValue = value/100.00;
        ui->spinBox_503->setValue(doubleValue);
    }
    else if(obj == ui->slider_504)
    {
        doubleValue = value/100.00;
        ui->spinBox_504->setValue(doubleValue);
    }
    else if(obj == ui->slider_505)
    {
        doubleValue = value/100.00;
        ui->spinBox_505->setValue(doubleValue);
    }
    else if(obj == ui->slider_506)
    {
        doubleValue = value/100.00;
        ui->spinBox_506->setValue(doubleValue);
    }
}

void Parameters::setIntValue(double value)
{
    int intValue;
    QObject* obj = sender();
    if(obj == ui->spinBox_53)
    {
        intValue = value*100;
        ui->slider_53->setValue(intValue);
    }
    else if(obj == ui->spinBox_54)
    {
        intValue = value*100;
        ui->slider_54->setValue(intValue);
    }
    else if(obj == ui->spinBox_55)
    {
        intValue = value*100;
        ui->slider_55->setValue(intValue);
    }
    else if(obj == ui->spinBox_56)
    {
        intValue = value*100;
        ui->slider_56->setValue(intValue);
    }
    else if(obj == ui->spinBox_503)
    {
        intValue = value*100;
        ui->slider_503->setValue(intValue);
    }
    else if(obj == ui->spinBox_504)
    {
        intValue = value*100;
        ui->slider_504->setValue(intValue);
    }
    else if(obj == ui->spinBox_505)
    {
        intValue = value*100;
        ui->slider_505->setValue(intValue);
    }
    else if(obj == ui->spinBox_506)
    {
        intValue = value*100;
        ui->slider_506->setValue(intValue);
    }
}

void Parameters::receiveFrame(QImage frame)
{
    if(posChanged)
    {
        if(!ui->inRangeEnabled->isChecked())
            getColor = frame.pixel(mousePos);
        else
        {
                binaryValue = frame.pixelIndex(mousePos);
        }
    }
    ui->labelView->setPixmap(QPixmap::fromImage(frame));

}

void Parameters::receiveToggleStream()
{
    if(ui->pushButtonPlay->isChecked())
    {
        ui->pushButtonPlay->setText(">");
        ui->pushButtonPlay->setToolTip("Play");
    }
    else
    {
        ui->pushButtonPlay->setToolTip("Pause");
        ui->pushButtonPlay->setText("||");
    }

    emit sendToggleStream(!ui->pushButtonPlay->isChecked());
}

void Parameters::changePage1()
{
    visible = !visible;

    if(visible)
    {
        ui->stackedWidget->setCurrentIndex(1);
    }
    else
    {
        ui->stackedWidget->setCurrentIndex(0);
    }
    visible2 = 0;
    visible3 = 0;
    visible4 = 0;
}

void Parameters::changePage2()
{
    visible2 = !visible2;
    if(visible2)
    {
        ui->stackedWidget->setCurrentIndex(2);
    }
    else
    {
        ui->stackedWidget->setCurrentIndex(0);
    }
    ui->radioButton_4->click();
    visible = 0;
    visible3 = 0;
    visible4 = 0;

}

void Parameters::changePage3()
{
    visible3 = !visible3;

    if(visible3)
    {
        ui->stackedWidget->setCurrentIndex(3);
    }
    else
    {
        ui->stackedWidget->setCurrentIndex(0);
    }
    visible = 0;
    visible2 = 0;
    visible4 = 0;
}

void Parameters::changePage4()
{
    visible4 = !visible4;

    if(visible4)
    {
        ui->stackedWidget->setCurrentIndex(4);
    }
    else
    {
        ui->stackedWidget->setCurrentIndex(0);
    }
    visible = 0;
    visible2 = 0;
    visible3 = 0;
    if(!ui->stop->isChecked())
    {
        ui->stop->click();
    }
}

void Parameters::changeText1(bool state)
{
    if(state)
    {
        ui->label_1->setText("Min_Hue");
        ui->label_2->setText("Max_Hue");
        ui->label_3->setText("Min_Sat");
        ui->label_4->setText("Max_Sat");
        ui->label_5->setText("Min_Value");
        ui->label_6->setText("Max_Value");

        if(worker->hsvPar.param[6] == 0)
            ui->label_7->setText("Erode");
        else if(worker->hsvPar.param[6] == 1)
            ui->label_7->setText("Dilate");

        ui->slider1->setValue(worker->hsvPar.param[0]);
        ui->slider2->setValue(worker->hsvPar.param[1]);
        ui->slider3->setValue(worker->hsvPar.param[2]);
        ui->slider4->setValue(worker->hsvPar.param[3]);
        ui->slider5->setValue(worker->hsvPar.param[4]);
        ui->slider6->setValue(worker->hsvPar.param[5]);
        ui->slider7->setValue(worker->hsvPar.param[7]);
    }
}
void Parameters::changeText2(bool state)
{
    if(state)
    {
        ui->label_1->setText("Min_Luma");
        ui->label_2->setText("Max_Luma");
        ui->label_3->setText("Min_Blue_Dif");
        ui->label_4->setText("Max_Blue_Dif");
        ui->label_5->setText("Min_Red_Dif");
        ui->label_6->setText("Max_Red_Dif");
        if(worker->yccPar.param[6] == 0)
            ui->label_7->setText("Erode");
        else if(worker->yccPar.param[6] == 1)
            ui->label_7->setText("Dilate");

        ui->slider1->setValue(worker->yccPar.param[0]);
        ui->slider2->setValue(worker->yccPar.param[1]);
        ui->slider3->setValue(worker->yccPar.param[2]);
        ui->slider4->setValue(worker->yccPar.param[3]);
        ui->slider5->setValue(worker->yccPar.param[4]);
        ui->slider6->setValue(worker->yccPar.param[5]);
        ui->slider7->setValue(worker->yccPar.param[7]);
    }
}

void Parameters::changeTrackStyleSheet()
{
    track = !track;
    if(track)
    {
        ui->track->setStyleSheet("background-color:rgb(115, 210, 22);");
    }
    else
    {
        ui->track->setStyleSheet("background-color:rgb(239, 41, 41);");
    }
}

void Parameters::changeRoiSize(int value)
{
    QObject *obj = sender();
    if(obj == ui->roi_size_x)
    {
        roiSize.setX(value);
    }
    else if(obj == ui->roi_size_y)
    {
        roiSize.setY(value);
    }
    emit(sendRoiSize(roiSize));
}

void Parameters::loadVideo()
{
    QString filename = QFileDialog::getOpenFileName(this, tr("Load File"), "/Videos", tr("Video Files (*.avi);;All Files(*)"));

    boost::filesystem::path p(filename.toStdString());
    std::string path;

    if(!filename.isEmpty())
    {
        videosInDir.clear();
        for (auto i = boost::filesystem::directory_iterator(p.parent_path()); i != boost::filesystem::directory_iterator(); i++)
        {
            if (!is_directory(i->path()))
            {
                path = p.parent_path().string()+ "/" + i->path().filename().string();
                videosInDir.push_back(QString::fromUtf8(path.c_str()));
            }
        }
        std::sort(videosInDir.begin(), videosInDir.end());

        emit(workerTrigger->stop());
        emit(timerReset(50));
        emit(sendVideoName(filename));
        ui->file_mode->setText(QString("Video"));
        lastVideo = filename;
        ui->movieLabel->hide();
        ui->previous->show();
        ui->next->show();
    }
}

void Parameters::toggleRecording()
{
    if(!ui->stop->isChecked())
    {
        ui->movieLabel->hide();
        ui->stop->setIcon(QIcon("Icons/reset.png"));
        ui->stop->setIconSize(QSize(20,15));
        emit(endRecording());
    }
    else
    {
        QString filename = QFileDialog::getSaveFileName(this, tr("Save File"), "Videos/.avi",
                                                        tr("AVI Files (*.avi);;All Files(*)"));
        ui->stop->setIcon(QIcon("Icons/stop.png"));
        ui->stop->setIconSize(QSize(20,15));
        ui->previous->hide();
        ui->next->hide();
        ui->stop->show();
        if(!filename.isEmpty())
        {
            ui->file_mode->setText(QString("Record"));
            ui->movieLabel->show();
            emit(recordMode(filename));
        }
        else
        {
            ui->stop->setChecked(false);
            ui->stop->setIcon(QIcon("Icons/reset.png"));
            ui->stop->setIconSize(QSize(20,15));
        }
    }
}

void Parameters::saveImage()
{
    ui->pushButtonPlay->setChecked(false);
    ui->pushButtonPlay->click();

    QString filename = QFileDialog::getSaveFileName(this, tr("Save File"), "Images/.png",
                                                    tr("Image Files (*.png *.jpeg);;All Files(*)"));

    if(!filename.isEmpty())
    {
        emit(sendImagePath(filename));
    }
}

void Parameters::saveRoi()
{
    ui->pushButtonPlay->setChecked(false);
    ui->pushButtonPlay->click();

    QString filename = QFileDialog::getSaveFileName(this, tr("Save File"), "Images/.png",
                                                    tr("Image Files (*.png *.jpeg);;All Files(*)"));

    if(!filename.isEmpty())
    {
        emit(sendRoiPath(filename));
    }
}

void Parameters::loadImage()
{
    QString filename = QFileDialog::getOpenFileName(this, tr("Load File"), QString(), tr("Image Files (*.png *.jpeg);;All Files(*)"));

    boost::filesystem::path p(filename.toStdString());
    std::string path;

    if(!filename.isEmpty())
    {
        imagesInDir.clear();
        for (auto i = boost::filesystem::directory_iterator(p.parent_path()); i != boost::filesystem::directory_iterator(); i++)
        {
            if (!is_directory(i->path()))
            {
                path = p.parent_path().string()+ "/" + i->path().filename().string();
                imagesInDir.push_back(QString::fromUtf8(path.c_str()));
            }
        }
        std::sort(imagesInDir.begin(), imagesInDir.end());

        emit(sendImageName(filename));
        ui->file_mode->setText(QString("Image"));
        lastImage = filename;
        ui->movieLabel->hide();
    }
    ui->previous->show();
    ui->next->show();
}

void Parameters::next()
{
    if(ui->file_mode->text() == "Image")
    {
        int index = imagesInDir.indexOf(lastImage);
        if(index != imagesInDir.size()-1)
        {
            lastImage = imagesInDir[index + 1];
        }
        else
        {
            lastImage = imagesInDir[0];
        }
        emit(sendImageName(lastImage));
    }
    else if(ui->file_mode->text() == "Video")
    {
        int index = videosInDir.indexOf(lastVideo);
        if(index != videosInDir.size()-1)
        {
            lastVideo = videosInDir[index + 1];
        }
        else
        {
            lastVideo = videosInDir[0];
        }
        emit(sendVideoName(lastVideo));
    }
}

void Parameters::previous()
{
    if(ui->file_mode->text() == "Image")
    {
        int index = imagesInDir.indexOf(lastImage);
        if(index != 0)
        {
            lastImage = imagesInDir[index - 1];
        }
        else
        {
            lastImage = imagesInDir.back();
        }
        emit(sendImageName(lastImage));
    }
    else if(ui->file_mode->text() == "Video")
    {
        int index = videosInDir.indexOf(lastVideo);
        if(index != 0)
        {
            lastVideo = videosInDir[index - 1];
        }
        else
        {
            lastVideo = videosInDir.back();
        }
        emit(sendVideoName(lastVideo));
    }
}

void Parameters::saveFile(bool clicked)
{
    if(!clicked){
        QString local = QString("../../config_files/vision/.xml");
        QString filename = QFileDialog::getSaveFileName(this, tr("Save File"), local,
                                                        tr("XML Files (*.xml);;All Files(*)"));
        lastFileOpened = filename;
        ui->fileDisplay->setText(lastFileOpened);
        if(filename.isEmpty())
            return;
        else
        {
            QFile file(filename);
            if(!file.open(QIODevice::WriteOnly))
            {
                QMessageBox::information(this, tr("Unable to save file"), file.errorString());
                return;
            }
            QXmlStreamWriter stream(&file);
            stream.writeStartDocument();
            stream.setAutoFormatting(true);
            stream.writeStartElement("opencv_storage");
            if(!worker->ballEnabled && !worker->cannyEnabled && !worker->goalEnabled)
            {
                if(worker->hsv)
                    stream.writeTextElement("color_space", "HSV");
                else if(worker->ycc)
                    stream.writeTextElement("color_space", "YCC");
                else if(worker->gray)
                    stream.writeTextElement("color_space", "GRAY");
                stream.writeTextElement("Normalize", QString::number(worker->normalizeEnabled));
                stream.writeTextElement(ui->label_1->text(), QString::number(worker->firstParam));
                stream.writeTextElement(ui->label_2->text(), QString::number(worker->secondParam));
                stream.writeTextElement(ui->label_3->text(), QString::number(worker->thirdParam));
                stream.writeTextElement(ui->label_4->text(), QString::number(worker->fourthParam));
                stream.writeTextElement(ui->label_5->text(), QString::number(worker->fifthParam));
                stream.writeTextElement(ui->label_6->text(), QString::number(worker->sixthParam));
                if(worker->hsv)
                {
                    stream.writeTextElement("Size", QString::number(worker->hsvPar.morph.size()));
                    for(unsigned int i = 0; i < worker->hsvPar.morph.size(); i++)
                    {
                        std::ostringstream morphStream;
                        morphStream << "Morphology" << i;
                        stream.writeTextElement(QString::fromStdString(morphStream.str()), QString::number(worker->hsvPar.morph.at(i).x));
                    }

                    for(unsigned int i = 0; i < worker->hsvPar.morph.size(); i++)
                    {
                        std::ostringstream valueStream;
                        valueStream << "Value" << i;
                        stream.writeTextElement(QString::fromStdString(valueStream.str()), QString::number(worker->hsvPar.morph.at(i).y));
                    }
                    for(unsigned int i = 0; i < worker->hsvPar.shape.size(); i++)
                    {
                        std::ostringstream shapeStream;
                        shapeStream << "Shape" << i;
                        stream.writeTextElement(QString::fromStdString(shapeStream.str()), QString::number(worker->hsvPar.shape.at(i)));
                    }
                }
                else if(worker->ycc)
                {
                    stream.writeTextElement("Size", QString::number(worker->yccPar.morph.size()));
                    for(unsigned int i = 0; i < worker->yccPar.morph.size(); i++)
                    {
                        std::ostringstream morphStream;
                        morphStream << "Morphology" << i;
                        stream.writeTextElement(QString::fromStdString(morphStream.str()), QString::number(worker->yccPar.morph.at(i).x));
                    }

                    for(unsigned int i = 0; i < worker->yccPar.morph.size(); i++)
                    {
                        std::ostringstream valueStream;
                        valueStream << "Value" << i;
                        stream.writeTextElement(QString::fromStdString(valueStream.str()), QString::number(worker->yccPar.morph.at(i).y));
                    }

                    for(unsigned int i = 0; i < worker->yccPar.shape.size(); i++)
                    {
                        std::ostringstream shapeStream;
                        shapeStream << "Shape" << i;
                        stream.writeTextElement(QString::fromStdString(shapeStream.str()), QString::number(worker->yccPar.shape.at(i)));
                    }
                }
            }
            else
            {
                if(worker->ballEnabled)
                {
                    stream.writeTextElement("object", "BALL");
                    stream.writeTextElement("raio_min", QString::number(ui->slider_20->value()));
                    stream.writeTextElement("raio_max", QString::number(ui->slider_21->value()));
                    stream.writeTextElement("circle_percentage", QString::number(ui->slider_22->value()));
                    stream.writeTextElement("epsilon", QString::number(ui->slider_23->value()));
                    stream.writeTextElement("area_min", QString::number(ui->slider_24->value()));
                    stream.writeTextElement("area_max", QString::number(ui->slider_25->value()));
                }
                else if(worker->cannyEnabled)
                {
                    if(!worker->hough)
                    {
                        stream.writeTextElement("which_hough", "Standard");
                        stream.writeTextElement("canny_apertureSize", QString::number(ui->spinBox_51->value()));
                        stream.writeTextElement("canny_threshold", QString::number(ui->spinBox_50->value()));
                        stream.writeTextElement("canny_L2gradient", QString::number(ui->gradient->isChecked()));
                        stream.writeTextElement("Standard_threshold", QString::number(ui->spinBox_52->value()));
                        stream.writeTextElement("Standard_rho", QString::number(ui->spinBox_53->value()));
                        stream.writeTextElement("Standard_theta", QString::number(ui->spinBox_54->value()));
                        stream.writeTextElement("srn", QString::number(ui->spinBox_55->value()));
                        stream.writeTextElement("stn", QString::number(ui->spinBox_56->value()));
                    }
                    else
                    {
                        stream.writeTextElement("which_hough", "Probabilistic");
                        stream.writeTextElement("canny_apertureSize", QString::number(ui->spinBox_501->value()));
                        stream.writeTextElement("canny_threshold", QString::number(ui->spinBox_500->value()));
                        stream.writeTextElement("canny_L2gradient", QString::number(ui->gradient->isChecked()));
                        stream.writeTextElement("Probabilistic_threshold", QString::number(ui->spinBox_502->value()));
                        stream.writeTextElement("Probabilistic_rho", QString::number(ui->spinBox_503->value()));
                        stream.writeTextElement("Probabilistic_theta", QString::number(ui->spinBox_504->value()));
                        stream.writeTextElement("minLineLength", QString::number(ui->spinBox_505->value()));
                        stream.writeTextElement("maxLineGap", QString::number(ui->spinBox_506->value()));
                    }
                }
                else if(worker->goalEnabled)
                {
                    stream.writeTextElement("object", "GOAL");
                    stream.writeTextElement("whiteLimit", QString::number(ui->spinBox_30->value()));
                    stream.writeTextElement("blackLimit", QString::number(ui->spinBox_31->value()));
                }
            }
            stream.writeEndElement();
            stream.writeEndDocument();
        }
    }

}

void Parameters::readFile(bool clicked)
{
    QString filename = QFileDialog::getOpenFileName(this, tr("Read File"), "../../config_files/vision/.xml",
                                                    tr("XML Files (*.xml);;All Files(*)"));
    int size = 0;
    std::vector<int> morphRead;
    std::vector<int> valueRead;
    std::vector<int> shapeRead;

    if(!clicked)
    {
        if(filename.isEmpty())
            return;
        else
        {
            QFile file(filename);
            lastFileOpened = filename;
            ui->fileDisplay->setText(lastFileOpened);
            if(file.open(QIODevice::ReadOnly))
            {
                QXmlStreamReader xml;
                xml.setDevice(&file);
                xml.readNext();
                while(!xml.atEnd())
                {
                    if(xml.readNext() == QXmlStreamReader::StartElement)
                    {
                        if(xml.name() == "Normalize")
                            worker->normalizeEnabled = xml.readElementText().toInt();
                        else if(xml.name() == ui->label_1->text())
                            worker->firstParam = xml.readElementText().toInt();
                        else if(xml.name() == ui->label_2->text())
                            worker->secondParam = xml.readElementText().toInt();
                        else if(xml.name() == ui->label_3->text())
                            worker->thirdParam = xml.readElementText().toInt();
                        else if(xml.name() == ui->label_4->text())
                            worker->fourthParam = xml.readElementText().toInt();
                        else if(xml.name() == ui->label_5->text())
                            worker->fifthParam = xml.readElementText().toInt();
                        else if(xml.name() == ui->label_6->text())
                            worker->sixthParam = xml.readElementText().toInt();
                        else if(xml.name() == "color_space")
                        {
                            QString colorspace = xml.readElementText();
                            if(colorspace == "HSV")
                            {
                                worker->hsv = true;
                                ui->radioButton->setChecked(true);
                                worker->hsvPar.morph.clear();
                            }
                            else if(colorspace == "YCC")
                            {
                                worker->ycc = true;
                                ui->radioButton_2->setChecked(true);
                                worker->yccPar.morph.clear();
                            }
                            else if(colorspace == "GRAY")
                            {
                                worker->gray = true;
                                ui->radioButton_3->setChecked(true);
                            }
                        }
                        else if(xml.name() == "Size")
                            size = xml.readElementText().toInt();

                        std::ostringstream morphStream, valueStream, shapeStream;
                        morphStream << "Morphology" << 0;
                        valueStream << "Value" << 0;
                        shapeStream << "Shape" << 0;
                        QString tempString, valueTemp, shapeTemp;
                        tempString = QString::fromStdString(morphStream.str());
                        for(int i = 1; i <= size; i++)
                        {
                            if(xml.name() == tempString)
                                morphRead.push_back(xml.readElementText().toInt());
                            morphStream.str("");
                            morphStream << "Morphology" << i;
                            tempString = QString::fromStdString(morphStream.str());
                        }

                        valueTemp = QString::fromStdString(valueStream.str());
                        for(int i = 1; i <= size; i++)
                        {
                            if(xml.name() == valueTemp)
                                valueRead.push_back(xml.readElementText().toInt());
                            valueStream.str("");
                            valueStream << "Value" << i;
                            valueTemp = QString::fromStdString(valueStream.str());
                        }
                        shapeTemp = QString::fromStdString(shapeStream.str());
                        for(int i = 1; i <=size; i++)
                        {
                            if(xml.name() == shapeTemp)
                                shapeRead.push_back(xml.readElementText().toInt());
                            shapeStream.str("");
                            shapeStream << "Shape" << i;
                            shapeTemp = QString::fromStdString(shapeStream.str());
                        }
                        if(xml.name() == "object")
                        {
                            if(xml.readElementText() == "BALL")
                                ui->ball->click();
                            else if(xml.readElementText() == "GOAL")
                                ui->goal->click();
                        }
                        ///LEITURA DO XML DA BOLA
                        else if(xml.name() == "raio_min")
                            ui->slider_20->setValue(xml.readElementText().toInt());
                        else if(xml.name() == "raio_max")
                            ui->slider_21->setValue(xml.readElementText().toInt());
                        else if(xml.name() == "circle_percentage")
                            ui->slider_22->setValue(xml.readElementText().toInt());
                        else if(xml.name() == "epsilon")
                            ui->slider_23->setValue(xml.readElementText().toInt());
                        else if(xml.name() == "area_min")
                            ui->slider_24->setValue(xml.readElementText().toInt());
                        else if(xml.name() == "area_max")
                            ui->slider_25->setValue(xml.readElementText().toInt());
                        ///LEITURA DO XML DO GOL
                        else if(xml.name() == "whiteLimit")
                            ui->slider_30->setValue(xml.readElementText().toInt());
                        else if(xml.name() == "blackLimit")
                            ui->slider_31->setValue(xml.readElementText().toInt());

                        if(xml.name() == "which_hough")
                        {
                            ui->stackedWidget->setCurrentIndex(2);
                            worker->cannyEnabled = true;
                            QString houghType = xml.readElementText();
                            if(houghType == "Standard")
                            {
                                ui->radioButton_4->setChecked(true);
                                ui->stackedWidget_2->setCurrentIndex(0);
                            }
                            else if(houghType == "Probabilistic")
                            {
                                ui->radioButton_5->setChecked(true);
                                ui->stackedWidget_2->setCurrentIndex(1);
                            }
                        }

                        if(ui->radioButton_4->isChecked())
                        {
                            if(xml.name() == "canny_apertureSize")
                                ui->spinBox_51->setValue(xml.readElementText().toInt());
                            else if(xml.name() == "canny_threshold")
                                ui->spinBox_50->setValue(xml.readElementText().toInt());
                            else if(xml.name() == "canny_L2gradient")
                                ui->gradient->setChecked(xml.readElementText().toInt());

                            else if(xml.name() == "Standard_threshold")
                                ui->spinBox_52->setValue(xml.readElementText().toInt());
                            else if(xml.name() == "Standard_rho")
                                ui->spinBox_53->setValue(xml.readElementText().toDouble());
                            else if(xml.name() == "Standard_theta")
                                ui->spinBox_54->setValue(xml.readElementText().toDouble());
                            else if(xml.name() == "srn")
                                ui->spinBox_55->setValue(xml.readElementText().toDouble());
                            else if(xml.name() == "stn")
                                ui->spinBox_56->setValue(xml.readElementText().toDouble());
                        }
                        else if(ui->radioButton_5->isChecked())
                        {
                            if(xml.name() == "canny_apertureSize")
                                ui->spinBox_501->setValue(xml.readElementText().toInt());
                            else if(xml.name() == "canny_threshold")
                                ui->spinBox_500->setValue(xml.readElementText().toInt());
                            else if(xml.name() == "canny_L2gradient")
                                ui->gradient->setChecked(xml.readElementText().toInt());

                            else if(xml.name() == "Probabilistic_threshold")
                                ui->spinBox_502->setValue(xml.readElementText().toInt());
                            else if(xml.name() == "Probabilistic_rho")
                                ui->spinBox_503->setValue(xml.readElementText().toDouble());
                            else if(xml.name() == "Probabilistic_theta")
                                ui->spinBox_504->setValue(xml.readElementText().toDouble());
                            else if(xml.name() == "minLineLength")
                                ui->spinBox_505->setValue(xml.readElementText().toDouble());
                            else if(xml.name() == "maxLineGap")
                                ui->spinBox_506->setValue(xml.readElementText().toDouble());
                        }
                    }
                }
                ui->normalizeEnabled->setChecked(worker->normalizeEnabled);

                ui->slider1->setValue(worker->firstParam);
                ui->slider2->setValue(worker->secondParam);
                ui->slider3->setValue(worker->thirdParam);
                ui->slider4->setValue(worker->fourthParam);
                ui->slider5->setValue(worker->fifthParam);
                ui->slider6->setValue(worker->sixthParam);
                ui->slider7->setValue(worker->morphValue);

                if(worker->morphType == 0)
                    ui->label_7->setText("Erode");
                else if(worker->morphType == 1)
                    ui->label_7->setText("Dilate");

                if(ui->radioButton->isChecked())
                {
                    for(unsigned int n = 0; n < morphRead.size(); n++)
                    {
                        worker->hsvPar.morph.push_back(cv::Point(morphRead[n], valueRead[n]));
                        worker->hsvPar.shape.push_back(shapeRead[n]);
                    }
                }
                else if(ui->radioButton_2->isChecked())
                {
                    for(unsigned int n = 0; n < morphRead.size(); n++)
                    {
                        worker->yccPar.morph.push_back(cv::Point(morphRead[n], valueRead[n]));
                        worker->yccPar.shape.push_back(shapeRead[n]);
                    }
                }
                worker->fileRead = true;
                xml.clear();
                file.close();
            }
        }
    }
}


void Parameters::quickSave(bool clicked)
{
    if(!clicked)
    {
        if(lastFileOpened.isEmpty())
        {
            QString filename = QFileDialog::getSaveFileName(this, tr("Save File"), "../../config_files/vision/.xml",
                                                            tr("XML Files (*.xml);;All Files(*)"));
            if(filename.isEmpty())
                return;
            else
            {
                lastFileOpened = filename;
                ui->fileDisplay->setText(lastFileOpened);
            }
        }
        if(!lastFileOpened.isEmpty())
        {
            QFile file(lastFileOpened);

            if(!file.open(QIODevice::WriteOnly))
            {
                QMessageBox::information(this, tr("Unable to save file"), file.errorString());
                return;
            }
            QXmlStreamWriter stream(&file);
            stream.writeStartDocument();
            stream.setAutoFormatting(true);
            stream.writeStartElement("opencv_storage");
            if(!worker->ballEnabled && !worker->cannyEnabled && !worker->goalEnabled)
            {
                if(worker->hsv)
                    stream.writeTextElement("color_space", "HSV");
                else if(worker->ycc)
                    stream.writeTextElement("color_space", "YCC");
                else if(worker->gray)
                    stream.writeTextElement("color_space", "GRAY");
                stream.writeTextElement("Normalize", QString::number(worker->normalizeEnabled));
                stream.writeTextElement(ui->label_1->text(), QString::number(worker->firstParam));
                stream.writeTextElement(ui->label_2->text(), QString::number(worker->secondParam));
                stream.writeTextElement(ui->label_3->text(), QString::number(worker->thirdParam));
                stream.writeTextElement(ui->label_4->text(), QString::number(worker->fourthParam));
                stream.writeTextElement(ui->label_5->text(), QString::number(worker->fifthParam));
                stream.writeTextElement(ui->label_6->text(), QString::number(worker->sixthParam));
                if(worker->hsv)
                {
                    stream.writeTextElement("Size", QString::number(worker->hsvPar.morph.size()));
                    for(unsigned int i = 0; i < worker->hsvPar.morph.size(); i++)
                    {
                        std::ostringstream morphStream;
                        morphStream << "Morphology" << i;
                        stream.writeTextElement(QString::fromStdString(morphStream.str()), QString::number(worker->hsvPar.morph.at(i).x));
                    }

                    for(unsigned int i = 0; i < worker->hsvPar.morph.size(); i++)
                    {
                        std::ostringstream valueStream;
                        valueStream << "Value" << i;
                        stream.writeTextElement(QString::fromStdString(valueStream.str()), QString::number(worker->hsvPar.morph.at(i).y));
                    }
                    for(unsigned int i = 0; i < worker->hsvPar.shape.size(); i++)
                    {
                        std::ostringstream shapeStream;
                        shapeStream << "Shape" << i;
                        stream.writeTextElement(QString::fromStdString(shapeStream.str()), QString::number(worker->hsvPar.shape.at(i)));
                    }
                }
                else if(worker->ycc)
                {
                    stream.writeTextElement("Size", QString::number(worker->yccPar.morph.size()));
                    for(unsigned int i = 0; i < worker->yccPar.morph.size(); i++)
                    {
                        std::ostringstream morphStream;
                        morphStream << "Morphology" << i;
                        stream.writeTextElement(QString::fromStdString(morphStream.str()), QString::number(worker->yccPar.morph.at(i).x));
                    }

                    for(unsigned int i = 0; i < worker->yccPar.morph.size(); i++)
                    {
                        std::ostringstream valueStream;
                        valueStream << "Value" << i;
                        stream.writeTextElement(QString::fromStdString(valueStream.str()), QString::number(worker->yccPar.morph.at(i).y));
                    }

                    for(unsigned int i = 0; i < worker->yccPar.shape.size(); i++)
                    {
                        std::ostringstream shapeStream;
                        shapeStream << "Shape" << i;
                        stream.writeTextElement(QString::fromStdString(shapeStream.str()), QString::number(worker->yccPar.shape.at(i)));
                    }
                }
            }
            else
            {
                if(worker->ballEnabled)
                {
                    stream.writeTextElement("object", "BALL");
                    stream.writeTextElement("raio_min", QString::number(ui->slider_20->value()));
                    stream.writeTextElement("raio_max", QString::number(ui->slider_21->value()));
                    stream.writeTextElement("circle_percentage", QString::number(ui->slider_22->value()));
                    stream.writeTextElement("epsilon", QString::number(ui->slider_23->value()));
                    stream.writeTextElement("area_min", QString::number(ui->slider_24->value()));
                    stream.writeTextElement("area_max", QString::number(ui->slider_25->value()));
                }
                else if(worker->cannyEnabled)
                {
                    if(!worker->hough)
                    {
                        stream.writeTextElement("which_hough", "Standard");
                        stream.writeTextElement("canny_apertureSize", QString::number(ui->spinBox_51->value()));
                        stream.writeTextElement("canny_threshold", QString::number(ui->spinBox_50->value()));
                        stream.writeTextElement("canny_L2gradient", QString::number(ui->gradient->isChecked()));
                        stream.writeTextElement("Standard_threshold", QString::number(ui->spinBox_52->value()));
                        stream.writeTextElement("Standard_rho", QString::number(ui->spinBox_53->value()));
                        stream.writeTextElement("Standard_theta", QString::number(ui->spinBox_54->value()));
                        stream.writeTextElement("srn", QString::number(ui->spinBox_55->value()));
                        stream.writeTextElement("stn", QString::number(ui->spinBox_56->value()));
                    }
                    else
                    {
                        stream.writeTextElement("which_hough", "Probabilistic");
                        stream.writeTextElement("canny_apertureSize", QString::number(ui->spinBox_501->value()));
                        stream.writeTextElement("canny_threshold", QString::number(ui->spinBox_500->value()));
                        stream.writeTextElement("canny_L2gradient", QString::number(ui->gradient->isChecked()));
                        stream.writeTextElement("Probabilistic_threshold", QString::number(ui->spinBox_502->value()));
                        stream.writeTextElement("Probabilistic_rho", QString::number(ui->spinBox_503->value()));
                        stream.writeTextElement("Probabilistic_theta", QString::number(ui->spinBox_504->value()));
                        stream.writeTextElement("minLineLength", QString::number(ui->spinBox_505->value()));
                        stream.writeTextElement("maxLineGap", QString::number(ui->spinBox_506->value()));
                    }
                }
                else if(worker->goalEnabled)
                {
                    stream.writeTextElement("object", "GOAL");
                    stream.writeTextElement("whiteLimit", QString::number(ui->spinBox_30->value()));
                    stream.writeTextElement("blackLimit", QString::number(ui->spinBox_31->value()));
                }
            }
            stream.writeEndElement();
            stream.writeEndDocument();
        }
    }
}

void Parameters::help(bool clicked)
{
    if(!clicked)
    {
        QMessageBox msg;
        msg.setText("Shortcuts:\n\n"
                    "Save File  \t\t                 CTRL+S\n\n"
                    "Quick Save \t\t                             S\n\n"
                    "Read File \t\t                             R\n\n"
                    "Activate In Range\t\t      I\n\n"
                    "Activate Normalize\t\t     N\n\n"
                    "Set HSV\t\t                             1\n\n"
                    "Set YCC    \t\t                             2\n\n"
                    "Exit           \t\t                        ESC\n\n"
                    "Help            \t\t                            H\n");
        msg.exec();
    }
}

void Parameters::activateOnUnite(bool checked)
{
    if(checked)
    {
        ui->inRangeEnabled->setChecked(true);
    }
}

bool Parameters::eventFilter(QObject *obj, QEvent *event)
{
    if(event->type() == QEvent::MouseMove && qobject_cast<QLabel*>(obj) == ui->labelView)
    {
        QMouseEvent *mouseEvent = static_cast<QMouseEvent*>(event);
        QString value;
        if(ui->inRangeEnabled->isChecked())
            value = "\tValue:" + QString::number(binaryValue);
        else
            value = "\tB:" + QString::number(getColor.blue()) + "\tG:" + QString::number(getColor.green())
                    + "\tR:" + QString::number(getColor.red());
        mousePos = QPoint(mouseEvent->x(),mouseEvent->y());
        QString position = "(" + QString::number(mouseEvent->x()) + "," + QString::number(mouseEvent->y()) + ")"
                + value;
        ui->coordinates->setText(position);
        posChanged = true;
        if(ui->stackedWidget->currentIndex() == 4 && moveRect)
        {
            if(ui->top_left->isChecked())
            {
                emit(sendMousePos(mousePos));
            }
            else if(ui->centered->isChecked())
            {
                emit(sendMousePos(QPoint(mousePos.x() - roiSize.x()/2, mousePos.y() - roiSize.y()/2)));
            }
            else if(ui->bottom_right->isChecked())
            {
                emit(sendMousePos(QPoint(mousePos.x() - roiSize.x(), mousePos.y() - roiSize.y())));
            }
        }
        return true;
    }
    else if(event->type() == QEvent::MouseButtonPress && qobject_cast<QLabel*>(obj) == ui->labelView)
    {
        moveRect = !moveRect;
    }
    else
    {
        return false ;
    }
}

void Parameters::morphology(bool clicked)
{
    if(!clicked)
    {
        QMessageBox msgBox;
        if(worker->hsv)
        {
            if(worker->hsvPar.morph.size() < 1)
                msgBox.setText("Choose the morphology type for your HSV color filter");
            else
            {
                QString texto;
                if(worker->hsvPar.morph.back().x == 0)
                    texto = "This is the " + QString::number(worker->hsvPar.morph.size()+1) + " effect that you are adding,\n"
                                    + "the last one was a ERODE of " + QString::number(worker->hsvPar.morph.back().y);
                else if(worker->hsvPar.morph.back().x == 1)
                    texto = "This is the " + QString::number(worker->hsvPar.morph.size()+1) + " effect that you are adding,\n"
                                    + "the last one was a DILATE of " + QString::number(worker->hsvPar.morph.back().y);
                msgBox.setText(texto);
            }
        }
        else if(worker->ycc)
        {
            if(worker->yccPar.morph.size() < 1)
                msgBox.setText("Choose the morphology type for your YCC color filter");
            else
            {
                QString texto;
                if(worker->yccPar.morph.back().x == 0)
                    texto = "This is the " + QString::number(worker->yccPar.morph.size()+1) + " effect that you are adding,\n"
                                    + "the last one was a ERODE of " + QString::number(worker->yccPar.morph.back().y);
                else if(worker->yccPar.morph.back().x == 1)
                    texto = "This is the " + QString::number(worker->yccPar.morph.size()+1) + " effect that you are adding,\n"
                                    + "the last one was a DILATE of " + QString::number(worker->yccPar.morph.back().y);
                msgBox.setText(texto);
            }
        }

        QPushButton *erodeButton = msgBox.addButton(tr("Erode"), QMessageBox::ActionRole);
        QPushButton *dilateButton = msgBox.addButton(tr("Dilate"), QMessageBox::ActionRole);
        msgBox.addButton(QMessageBox::Cancel);
        QPushButton *clearMat = msgBox.addButton(tr("Clear Vector"), QMessageBox::ActionRole);

        msgBox.exec();

        QMessageBox morphShape;
        morphShape.setText("Choose the morphology shape:");
        QPushButton *ellipseButton = morphShape.addButton(tr("Ellipse"), QMessageBox::ActionRole);
        QPushButton *squareButton = morphShape.addButton(tr("Square"), QMessageBox::ActionRole);
        QPushButton *crossButton = morphShape.addButton(tr("Cross"), QMessageBox::ActionRole);
        morphShape.addButton(QMessageBox::Cancel);

        if(msgBox.clickedButton() == erodeButton)
        {
            ui->label_7->setText("Erode");
            worker->morphType = 0;
            morphShape.exec();
        }
        else if(msgBox.clickedButton() == dilateButton)
        {
            ui->label_7->setText("Dilate");
            worker->morphType = 1;
            morphShape.exec();
        }

        else if(msgBox.clickedButton() == clearMat)
        {
            if(worker->hsv)
            {
                worker->hsvPar.morph.clear();
                worker->hsvPar.shape.clear();
            }
            else if(worker->ycc)
            {
                worker->yccPar.morph.clear();
                worker->yccPar.shape.clear();
            }
        }

        if(morphShape.clickedButton() == ellipseButton) //0- square, 1- cross, 2-ellipse
        {
            worker->tempShape = 2;
        }
        else if(morphShape.clickedButton() == crossButton)
        {
            worker->tempShape = 1;
        }
        else if(morphShape.clickedButton() == squareButton)
        {
            worker->tempShape = 0;
        }
    }
}


void Parameters::storeMorph(bool clicked)
{
    if(!clicked)
    {
        if(ui->label_7->text() == "Erode")
        {
            if(worker->hsv)
            {
                worker->hsvPar.morph.push_back(cv::Point(0,worker->morphValue));
                worker->hsvPar.shape.push_back(worker->tempShape);
            }
            else if(worker->ycc)
            {
                worker->yccPar.morph.push_back(cv::Point(0,worker->morphValue));
                worker->yccPar.shape.push_back(worker->tempShape);
            }
        }
        else if(ui->label_7->text() == "Dilate")
        {
            if(worker->hsv)
            {
                worker->hsvPar.morph.push_back(cv::Point(1,worker->morphValue));
                worker->hsvPar.shape.push_back(worker->tempShape);
            }
            else if(worker->ycc)
            {
                worker->yccPar.morph.push_back(cv::Point(1,worker->morphValue));
                worker->yccPar.shape.push_back(worker->tempShape);
            }

        }
    }
}

void Parameters::changeMode()
{
    QMessageBox msgBox;
    msgBox.setText(QString("Qual o modo desejado?"));
    QPushButton *liveButton = msgBox.addButton(tr("Live"), QMessageBox::ActionRole);
    QPushButton *videoButton = msgBox.addButton(tr("Video"), QMessageBox::ActionRole);
    QPushButton *imageButton = msgBox.addButton(tr("Image"), QMessageBox::ActionRole);
    QPushButton *recordButton = msgBox.addButton(tr("Record"), QMessageBox::ActionRole);
    if(lastVideo.isEmpty())
    {
        videoButton->setDisabled(true);
    }
    else
    {
        videoButton->setEnabled(true);
    }
    if(lastImage.isEmpty())
    {
        imageButton->setDisabled(true);
    }
    else
    {
        imageButton->setEnabled(true);
    }
    msgBox.addButton(QMessageBox::Cancel);
    msgBox.exec();
    if(msgBox.clickedButton() == liveButton)
    {
        ui->previous->hide();
        ui->next->hide();
        ui->file_mode->setText(QString("Live"));
        emit(liveMode());
        emit(timerReset(1));
        ui->movieLabel->hide();
    }
    else if(msgBox.clickedButton() == videoButton)
    {
        ui->previous->show();
        ui->next->show();
        ui->file_mode->setText(QString("Video"));
        emit(videoMode(lastVideo));
        emit(timerReset(50));
        ui->movieLabel->hide();
    }
    else if(msgBox.clickedButton() == imageButton)
    {
        ui->previous->show();
        ui->next->show();
        ui->file_mode->setText(QString("Image"));
        emit(imageMode(lastImage));
        ui->movieLabel->hide();
    }
    else if(msgBox.clickedButton() == recordButton)
    {
        QString filename = QFileDialog::getSaveFileName(this, tr("Save File"), "Videos/.avi",
                                                        tr("AVI Files (*.avi);;All Files(*)"));
        ui->previous->hide();
        ui->next->hide();
        ui->stop->show();
        if(!filename.isEmpty())
        {
            ui->file_mode->setText(QString("Record"));
            ui->movieLabel->show();
            emit(recordMode(filename));
        }
    }
}
