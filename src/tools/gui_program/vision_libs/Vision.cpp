#include "Vision.hpp"

Vision::Vision()
{
}

void Vision::start()
{
    int sharedMemoryID = shmget(Config::VISION_KEY,Config::VISION_SIZE,IPC_CREAT | 0666);
    
    if (sharedMemoryID < 0)
    {
        std::cout<<"Problema em criar a memória compartilhada\n";
        exit(1);
    }
    
    data = (int *) shmat(sharedMemoryID, NULL, 0);
    
    //TODO: Verificar forma de identificação de erro
    
    if (data == (void*)  -1)
    {
        std::cout<<"Problema em conectar com a memória compartilhada\n";
        exit(1);
    }

    pid_t pid;
    pid = fork();
    
    //Processo filho, visão em si
    if(pid == 0)
    {
        execv("./Vision",NULL);
    }
    
}

void Vision::readInformation()
{
    //Variável usada para manter data como o inicio da memória compartilhada
    int *dataAuxiliar;
    dataAuxiliar = data;
    
    width = *dataAuxiliar;
    dataAuxiliar++;
    
    height = *dataAuxiliar;
    dataAuxiliar++;
    
    hasBall = *dataAuxiliar;
    dataAuxiliar++;
    
    int ballX = *dataAuxiliar;
    dataAuxiliar++;
    
    int ballY = *dataAuxiliar;
    dataAuxiliar++;
    ballPosition.x = ballX;
    ballPosition.y = ballY;
    
    hasGoal = *dataAuxiliar;
    dataAuxiliar++;
    
    int goalX = *dataAuxiliar;
    dataAuxiliar++;
    
    int goalY = *dataAuxiliar;
    
    goalPosition.x = goalX;
    goalPosition.y = goalY;
    
    
    //~ std::cout<<"PAI:\n";
    //~ std::cout<<"width:"<<width<<"\n";
    //~ std::cout<<"height:"<<height<<"\n";
    //~ std::cout<<"ball:"<<hasBall<<"\n";
    //~ std::cout<<"ballPos:"<<ballPosition.x<<","<<ballPosition.y<<"\n";
    //~ std::cout<<"goal:"<<hasGoal<<"\n";
    //~ std::cout<<"goalPos:"<<goalPosition.x<<","<<goalPosition.y<<"\n\n";
    
}

int Vision::getWidth()
{
    readInformation();
    return width;
}

int Vision::getHeight()
{
    readInformation();
    return height;
}
    
bool Vision::ballFound()
{
    readInformation();
    return hasBall;
}

bool Vision::goalFound()
{
    readInformation();
    return hasGoal;
}

VisionPoint Vision::getBallPosition()
{
    readInformation();
    return ballPosition;
}

VisionPoint Vision::getGoalPosition()
{
    readInformation();
    return goalPosition;
}
