#include "VisionProcess.hpp"

void VisionProcess::start()
{
    int sharedMemoryID = shmget(Config::VISION_KEY,Config::VISION_SIZE, 0666);
    
    if (sharedMemoryID < 0)
    {
        std::cout<<"Problema em localizar a memória compartilhada\n";
        exit(1);
    }
    
    data = (int *) shmat(sharedMemoryID, NULL, 0);
    
    //TODO: Verificar forma de identificação de erro
    
    if ((data) == (void*) -1)
    {
        std::cout<<"Problema em conectar com a memória compartilhada\n";
        exit(1);
    }
    
    camera.start();
    cv::Mat image = camera.getRawImage();
    width = image.cols;
    height = image.rows;
    while(true)
    {
		field.setImage(camera.getRawImage(),"../../config_files/vision/");
        ball.setImage(field.getField(), "../../config_files/vision/");
        ballPosition = ball.getBall();
        goal.setImage(camera.getRawImage(), "../../config_files/vision/");
        goal.processImage(field.getBinaryField());
        goalPosition = goal.getGoal();
        player.setAlly(BLUE);
        player.setImage(camera.getRawImage(), "../../config_files/vision/");
        confirmGoal(goalPosition, player);
        sendInformation();
        
        ball.showBall();
    }
        
}

void VisionProcess::confirmGoal(cv::Point goalPos, Players jogador)
{
	std::vector<cv::Point> jogadores = jogador.getCentroides();
	if(goal.found())
	{
		for(int i = 0; i < jogadores.size(); i++)
		{
			if(abs((goalPos.x  - jogadores[i].x)) <= 10)
			{
				goalState = TARGET_GOAL;
				break;
			}
			else
			{
				goalState = UNKNOWN;
			}
		}
	}
	else
	{
		goalState = GOAL_NOT_FOUND;
	}
}


void VisionProcess::sendInformation()
{
    // Informações mandadas na ordem: Width Height BallFound Ball.x Ball.y GoalFound Goal.x Goal.y
    //Variável auxiliar para manter a varialve data como o inicio da memória compartilhada
    int *auxiliarData;
    auxiliarData = data;
    
    *auxiliarData = width;
    auxiliarData++;
    *auxiliarData = height;
    auxiliarData++;
    *auxiliarData = (int)goalState;
    auxiliarData++;
    *auxiliarData = ball.getBall().x;
    auxiliarData++;
    *auxiliarData = ball.getBall().y;
    auxiliarData++;
    *auxiliarData = (int)goal.found();
    auxiliarData++;
    *auxiliarData = goal.getGoal().x;
    auxiliarData++;
    *auxiliarData = goal.getGoal().y;



    //~ std::cout<<"FILHO:\n";
    //~ std::cout<<"width:"<<width<<"\n";
    //~ std::cout<<"height:"<<height<<"\n";
    //~ std::cout<<"ball:"<<ball.found()<<"\n";
    //~ std::cout<<"ballPos:"<<ball.getBall().x<<","<<ball.getBall().y<<"\n";
    //~ std::cout<<"goal:"<<goal.found()<<"\n";
    //~ std::cout<<"goalPos:"<<goal.getGoal().x<<","<<goal.getGoal().y<<"\n";
    
}

int main()
{
    VisionProcess vision;
    vision.start();
    return 0;
}
