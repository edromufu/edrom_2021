#ifndef VISION_HPP_INCLUDED
#define VISION_HPP_INCLUDED

#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <iostream>
#include "../behaviour/Config.hpp"

struct VisionPoint
{
    int x;
    int y;
};

//Classe que junta toda a parte da visão, serve para organizar e para modularizar o código, assim qualquer coisa fora da visão 
//que precisar acessar algum recurso dela o faz por meio dessa classe, não deve ser feito diretamente. Ela inicia uma thread e,
//seu construtor.
class Vision
{
public:
    Vision();
    void start();
    VisionPoint getBallPosition();
    VisionPoint getGoalPosition();
    bool ballFound();
    bool goalFound();
    int getWidth();
    int getHeight();
private:
    int *data;
    void readInformation();

    bool hasBall;
    bool hasGoal;
    VisionPoint ballPosition;
    VisionPoint goalPosition;
    int width;
    int height;
};


#endif
