#ifndef VISION_PROCESS_HPP_INCLUDED
#define VISION_PROCESS_HPP_INCLUDED

#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include "../behaviour/Config.hpp"
#include "Ball.hpp"
#include "Field.hpp"
#include "Camera.hpp"
#include "Goal.hpp"
#include "Players.hpp"
#include "opencv2/opencv.hpp"
#include <iostream>
#include "Vision.hpp"

class VisionProcess
{
	enum goalStates{GOAL_NOT_FOUND, UNKNOWN, TARGET_GOAL};
	
public:
    void start();
    void sendInformation();
private:
    int *data;
    Camera camera;
    Ball ball;
    Field field;
    Goal goal;
    Players player;
    cv::Point ballPosition;
    cv::Point goalPosition;
    int width;
    int height;
    goalStates goalState;
    
    void confirmGoal(cv::Point goal, Players jogadores);
};


#endif
