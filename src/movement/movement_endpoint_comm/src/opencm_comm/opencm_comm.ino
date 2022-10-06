#include <ros.h>
#include <DynamixelWorkbench.h>
#include <movement_msgs/OpencmRequestMsg.h>
#include <movement_msgs/OpencmResponseMsg.h>
#include <movement_msgs/CommandToOpenCMSrv.h>

#define BAUDRATE 1000000
#define DOF 20

// Variaveis de tratamento
uint8_t opencmMotors[DOF];
uint16_t modelMotors[DOF];
uint8_t opencmMotorCount = 0;
uint8_t expMotors[DOF];
uint8_t expMotorCount = 0;
uint8_t MotorCount = 0;

int32_t *openCmData;
int32_t *openCmSpeed;
int32_t *expData;
int32_t *expSpeed;
int32_t *openCmDataFeedback;
int32_t *expDataFeedback;
int32_t *openCmSpeedFeedback;
int32_t *expSpeedFeedback;

enum Command {
    position_dt, shutdown_now, reborn, live
};

char buffer [35];
bool loopOnce;
int32_t data[DOF] = {0};
int32_t vel[DOF] = {0}; 
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
    if(strcmp (req.opencm_command,"position_dt") == 0)
    {
        command = position_dt;
        res.command_executed = true;
    }
    else if(strcmp (req.opencm_command,"shutdown_now") == 0)
    {
        command = shutdown_now;
        res.command_executed = true;
    }
    else if (strcmp (req.opencm_command,"reborn") == 0)
    {
        command = reborn;
        res.command_executed = true;
    }
    else if (strcmp (req.opencm_command,"live") == 0)
    {
        command = live;
        res.command_executed = true;
    }
    else
    {
        res.command_executed = false;    
    }
    loopOnce = res.command_executed;
}

// Workbenchs
DynamixelWorkbench openCmWb;  //Procura motores via TTL na opencm
DynamixelWorkbench expWb; //Procura motores via TTL na placa de expansão

// ROS
ros::NodeHandle  nh;
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
        setupDynamixel();
        nh.spinOnce();
    }
}

void loop()
{   
    if (loopOnce)
    {
        if(command == live)
        {
            setupDynamixel();
            loopOnce = false;
        }
        else if(command == shutdown_now)
        {
            torqueDisable();
            loopOnce = false;
        }
        else if(command == reborn)
        {
            torqueEnable();
            loopOnce = false;
        }
        else if(command == position_dt)
        {
            for (int index = 0; index < opencmMotorCount; index++)
            {
                int id = opencmMotors[index];
                openCmData[index] = (int32_t)data[id];
                openCmSpeed[index] = (int32_t)vel[id];
            }
            for (int index = 0; index < expMotorCount; index++)
            {
                int id = expMotors[index];
                expData[index] = (int32_t)data[id];
                expSpeed[index] = (int32_t)vel[id];
            }
            if(opencmMotorCount > 0)
            {
                openCmWb.syncWrite(1,&openCmSpeed[0]);
                openCmWb.syncWrite(0,&openCmData[0]);
            }   
            if(expMotorCount > 0) 
            {
                expWb.syncWrite(1,&expSpeed[0]);
                expWb.syncWrite(0,&expData[0]);
            }
        }
    }
    feedbackMotor();
    nh.spinOnce();
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
  for (int index = 0; index < MotorCount; index++)
  { 
    openCmWb.torqueOn(opencmMotors[index]);
    expWb.torqueOn(expMotors[index]);
  }
    
  nh.loginfo ("");
  nh.loginfo (" _______________________________ ");
  nh.logwarn("|        TORQUE  ATIVADO        |");
}

// Desativa o torque de todos os motores
void torqueDisable()
{
    for (int index = 0; index < MotorCount; index++)
    {
        openCmWb.torqueOff(opencmMotors[index]);
        expWb.torqueOff(expMotors[index]);
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
    bool resultExpData      = expWb.itemRead(index, "Present_Position", &expDataFeedback[index]);
    bool resultOpencmSpeed  = openCmWb.itemRead(index, "Present_Velocity", &openCmSpeedFeedback[index]);
    bool resultExpSpeed     = expWb.itemRead(index, "Present_Velocity", &expSpeedFeedback[index]);

    if (resultOpencmData == 0 && resultExpData == 0)
    {
      response_msg.motors_position[index] = 0;
      response_msg.motors_velocity[index] = 0;
    }
    
    else if (resultOpencmData == 1 && resultExpData == 0)
    {
      response_msg.motors_position[index] = openCmDataFeedback[index];
      response_msg.motors_velocity[index] = openCmSpeedFeedback[index];
    }
    
    else if (resultOpencmData == 0 && resultExpData == 1)
    { 
      response_msg.motors_position[index] = expDataFeedback[index];
      response_msg.motors_velocity[index] = expSpeedFeedback[index];
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
    char buffer [35];
    free(openCmData);
    free(expData);
    free(openCmSpeed);
    free(expSpeed);

    nh.loginfo("[OPENCM] PROCURANDO MOTORES CONECTADOS");
    nh.loginfo("");
        
    if(openCmWb.scan(opencmMotors,&opencmMotorCount,DOF))
    {
        nh.loginfo("[OPENCM] Procurando motores conectados via TTL");
        for (uint8_t i = 0; i < opencmMotorCount; i++)
        {
            int id = opencmMotors[i];
            openCmWb.jointMode(opencmMotors[i], 300, 0);
            modelMotors[id] = openCmWb.getModelNumber(opencmMotors[i]);
            sprintf (buffer, "|    MOTOR - %d -ENCONTRADO     |", opencmMotors[i]);
            nh.loginfo(buffer);
        }
        openCmData = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
        openCmDataFeedback = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
        openCmSpeed = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
        openCmSpeedFeedback = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
        
        if(openCmWb.getProtocolVersion() == 1.0) 
        {
        //nh.loginfo("PROTOCOLO 1.0");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Goal_Position");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Moving_Speed");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Torque_Enable");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"P_Gain");
        }
        else if(openCmWb.getProtocolVersion() == 2.0)
        {
        //nh.loginfo("PROTOCOLO 2.0");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Goal_Position");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Profile_Velocity");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Torque_Enable");
        openCmWb.addSyncWriteHandler(opencmMotors[0],"Position_P_Gain");
        }
    } 
    if(expWb.scan(expMotors,&expMotorCount,DOF))
    {
        nh.loginfo("[OPENCM] Procurando motores conectados na Placa de Extensão");
        for (uint8_t i = 0; i < expMotorCount; i++)
        {
        int id = expMotors[i];
        expWb.jointMode(expMotors[i], 300, 0);
        modelMotors[id] = expWb.getModelNumber(expMotors[i]);
        sprintf (buffer, "|    MOTOR - %d -ENCONTRADO     |", expMotors[i]);
        nh.loginfo(buffer);
        }
        expData = (int32_t*)malloc(expMotorCount * sizeof(int32_t));
        expDataFeedback = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
        expSpeed = (int32_t*)malloc(expMotorCount * sizeof(int32_t));
        expSpeedFeedback = (int32_t*)malloc(expMotorCount * sizeof(int32_t));
        
        if(expWb.getProtocolVersion() == 1.0) 
        {
        //nh.loginfo("PROTOCOLO 1.0");
        expWb.addSyncWriteHandler(expMotors[0],"Goal_Position");
        expWb.addSyncWriteHandler(expMotors[0],"Moving_Speed");
        expWb.addSyncWriteHandler(expMotors[0],"Torque_Enable");
        expWb.addSyncWriteHandler(expMotors[0],"P_Gain");
        }
        
        else if(expWb.getProtocolVersion() == 2.0)
        {
        //nh.loginfo("PROTOCOLO 2.0");
        expWb.addSyncWriteHandler(expMotors[0],"Goal_Position");
        expWb.addSyncWriteHandler(expMotors[0],"Profile_Velocity");
        expWb.addSyncWriteHandler(expMotors[0],"Torque_Enable");
        expWb.addSyncWriteHandler(expMotors[0],"Position_P_Gain");
        }     
    }
    MotorCount = opencmMotorCount + expMotorCount;
    nh.loginfo (" _______________________________ ");
    sprintf (buffer,"|    MOTORES ENCONTRADOS: %d     |", MotorCount);
    nh.logwarn(buffer);
}