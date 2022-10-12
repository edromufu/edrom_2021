#include <ros.h>
#include <DynamixelWorkbench.h>
#include <movement_msgs/OpencmRequestMsg.h>
#include <movement_msgs/OpencmResponseMsg.h>
#include <movement_msgs/CommandToOpenCMSrv.h>

#define BAUDRATE 1000000
#define DOF 20

ros::NodeHandle  nh;

// Variaveis de tratamento
uint8_t opencmMotors[DOF];
uint16_t modelMotors[DOF];
uint8_t opencmMotorCount = 0;

int32_t *openCmData;
int32_t *openCmSpeed;
int32_t *openCmDataFeedback;
int32_t *openCmSpeedFeedback;

enum Command {
    live, position_dt, shutdown_now, reborn, feedback
};

int32_t data[DOF] = {2048, 1050, 2048, 2200, 2048, 2048,
                     2060, 1919, 1959, 2016, 2075, 2048, 2152, 2053, 2022, 2051, 2076, 2009,
                     2048, 2048};
int32_t vel[DOF] = {40, 40, 40, 40, 40, 40,
                    40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40,
                    40, 40}; 
bool has_executed = true;
Command command;

// Funções
void setupDynamixel();
void scan();
void feedbackMotor();
void requestMovement(const movement_msgs::OpencmRequestMsg& rqt);

// Service para alteração do estado de execução da opencm entre os commands enumerados
void resquestCommand(movement_msgs::CommandToOpenCMSrv::Request &req, movement_msgs::CommandToOpenCMSrv::Response &res);
void resquestCommand(const movement_msgs::CommandToOpenCMSrv::Request &req, movement_msgs::CommandToOpenCMSrv::Response &res)
{   
    if (strcmp (req.opencm_command,"feedback") == 0)
    {
        feedbackMotor();
        res.command_executed = true;
    }
    else if(strcmp (req.opencm_command,"position_dt") == 0)
    {
        command = position_dt;
        res.command_executed = true;
        has_executed = !res.command_executed;
    }
    else if(strcmp (req.opencm_command,"shutdown_now") == 0)
    {
        command = shutdown_now;
        res.command_executed = true;
        has_executed = !res.command_executed;
    }
    else if (strcmp (req.opencm_command,"reborn") == 0)
    {
        command = reborn;
        res.command_executed = true;
        has_executed = !res.command_executed;
    }
    else if (strcmp (req.opencm_command,"live") == 0)
    {
        command = live;
        res.command_executed = true;
        has_executed = !res.command_executed;
    }
    else
    {
        res.command_executed = false;   
        has_executed = !res.command_executed; 
    }
    
}

// Workbenchs
DynamixelWorkbench openCmWb;  //Procura motores via TTL na opencm
DynamixelWorkbench expWb; //Procura motores via TTL na placa de expansão

// ROS
movement_msgs::OpencmResponseMsg response_msg;
ros::Subscriber<movement_msgs::OpencmRequestMsg> sub("opencm/request_move", requestMovement);
ros::ServiceServer<movement_msgs::CommandToOpenCMSrv::Request, movement_msgs::CommandToOpenCMSrv::Response> service("opencm/request_command", &resquestCommand);
ros::Publisher pub("opencm/response", &response_msg);

//"Main" da opencm, configura os tópicos de ros e chama função de encontrar os motores
void setup()
{   
    // Esperando a conexão com o computador para iniciar
    while (!nh.connected())
    {
        nh.initNode();
        nh.subscribe(sub);
        nh.advertise(pub);
        nh.advertiseService(service);
        nh.spinOnce();
    }
}

void loop()
{   
    if(command == live && !has_executed)
    {
        setupDynamixel();
        has_executed = true;
    }
    else if(command == shutdown_now && !has_executed)
    {
        torqueDisable();
        has_executed = true;
    }
    else if(command == reborn && !has_executed)
    {
        torqueEnable();
        has_executed = true;
    }
    else if(command == position_dt)
    {   
        //int pingCount = 0;
        int id;
        for (int index = 0; index < opencmMotorCount; index++)
        {
            id = opencmMotors[index];
            //pingCount += openCmWb.ping(id);
            openCmData[index] = (int32_t)data[id];
            openCmSpeed[index] = (int32_t)vel[id];
        }
        if(opencmMotorCount > 0)
        {
            openCmWb.syncWrite(1,&openCmSpeed[0]);
            openCmWb.syncWrite(0,&openCmData[0]);
        }
        /*
        if(opencmMotorCount == pingCount && opencmMotorCount != 0)
        {
            openCmWb.syncWrite(1,&openCmSpeed[0]);
            openCmWb.syncWrite(0,&openCmData[0]);
        } 
        else
        {
            setupDynamixel();
        }*/
    }
    nh.spinOnce();
    delay(50);
}

// Recebe os dados de posição e velocidade para serem enviados aos motores no próximo loop
void requestMovement(const movement_msgs::OpencmRequestMsg& rqt)
{
    for(int i = 0; i < DOF; i++)
    {
        data[i] = rqt.motors_position[i];
        vel[i] = rqt.motors_velocity[i];
    }
}

// Ativa o torque de todos os motores
void torqueEnable()
{
  for (int index = 0; index < opencmMotorCount; index++)
  { 
    openCmWb.torqueOn(opencmMotors[index]);
  }
  nh.loginfo ("");
  nh.loginfo (" _______________________________ ");
  nh.logwarn("|        TORQUE  ATIVADO        |");
}

// Desativa o torque de todos os motores
void torqueDisable()
{
    for (int index = 0; index < opencmMotorCount; index++)
    {
        openCmWb.torqueOff(opencmMotors[index]);
        
    }

    nh.loginfo ("");
    nh.loginfo (" _______________________________ ");
    nh.logwarn("|      TORQUE  DESATIVADO       |");
}

//Captura as posições e velocidades dos motores, enviando via /opencm/response
void feedbackMotor()
{
  for (int index = 0; index < DOF; index++)
  {
    bool resultOpencmData   = openCmWb.itemRead(index, "Present_Position", &openCmDataFeedback[index]);
    bool resultOpencmSpeed  = openCmWb.itemRead(index, "Present_Velocity", &openCmSpeedFeedback[index]);
        
    if (resultOpencmData)
    {
      response_msg.motors_position[index] = openCmDataFeedback[index];
      response_msg.motors_velocity[index] = openCmSpeedFeedback[index];
    }
    else
    {
      response_msg.motors_position[index] = 0;
      response_msg.motors_velocity[index] = 0;
    }

  }
  pub.publish(&response_msg);
  nh.spinOnce();
}

//Inicia workbench da placa de expansão e da OpenCm, chama função de procurar por motores nelas
void setupDynamixel() 
{
    if(!expWb.init("3",BAUDRATE)) 
    {
        nh.logerror("[OPENCM] Erro ao iniciar workbench da Placa de Extensão");
    }
    if(!openCmWb.init("",BAUDRATE))
    {
        nh.logerror("[OPENCM] Erro ao iniciar workbench da OpenCm");
    }
    scan();
}
void scan() 
{
    free(openCmData);
    free(openCmSpeed);
    free(openCmDataFeedback);
    free(openCmSpeedFeedback);

    opencmMotorCount = 0;
    memset(opencmMotors, 0, DOF);
    memset(modelMotors, 0, DOF);
    
    nh.loginfo("[OPENCM] PROCURANDO MOTORES CONECTADOS");
    nh.loginfo("");
    char buffer[35];
        
    if(openCmWb.scan(opencmMotors,&opencmMotorCount,DOF))
    {
        nh.loginfo("[OPENCM] Procurando motores conectados via TTL");
        for (uint8_t i = 0; i < opencmMotorCount; i++)
        {
            int id = opencmMotors[i];
            openCmWb.jointMode(opencmMotors[i], 300, 0);
            modelMotors[id] = openCmWb.getModelNumber(opencmMotors[i]);

            sprintf (buffer, "|    Model do motor %d: %d|", opencmMotors[i], modelMotors[id]);
            nh.loginfo(buffer);
        }

        openCmData = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
        openCmDataFeedback = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
        openCmSpeed = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
        openCmSpeedFeedback = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
        
        if(openCmWb.getProtocolVersion() == 1.0) 
        {
        nh.loginfo("PROTOCOLO 1.0");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Goal_Position");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Moving_Speed");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Torque_Enable");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"P_Gain");
        }
        else if(openCmWb.getProtocolVersion() == 2.0)
        {
        nh.loginfo("PROTOCOLO 2.0");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Goal_Position");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Profile_Velocity");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Torque_Enable");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Position_P_Gain");
        }
    } 
    nh.loginfo (" _______________________________ ");
    sprintf (buffer,"|    MOTORES ENCONTRADOS: %d     |", opencmMotorCount);
    nh.logwarn(buffer);
}
