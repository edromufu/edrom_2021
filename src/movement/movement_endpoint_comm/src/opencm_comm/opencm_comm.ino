#include <ros.h>
#include <DynamixelWorkbench.h>
#include <movement_msgs/OpencmRequestMsg.h>
#include <movement_msgs/OpencmResponseMsg.h>
#include <movement_msgs/CommandToOpenCMSrv.h>

#define BAUDRATE 1000000
#define DOF 20

enum Command {
  position_dt, shutdown_now, reborn
};

/* 
 *  Funções
 */
 
void requestMovement(const movement_msgs::OpencmRequestMsg& rqt);
void resquestCommand(movement_msgs::CommandToOpenCMSrv::Request &req, movement_msgs::CommandToOpenCMSrv::Response &res);

Command command;

void resquestCommand(const movement_msgs::CommandToOpenCMSrv::Request &req, movement_msgs::CommandToOpenCMSrv::Response &res)
{
  if(strcmp (req.opencm_command,"position_dt") == 0)
  {
    command = position_dt;
  }
  else if(strcmp (req.opencm_command,"shutdown_now") == 0)
  {
    command = shutdown_now;
  }
  else if (strcmp (req.opencm_command,"reborn") == 0)
  {
    command = reborn;
  }
}

void scan();
void setupDynamixel();
void torqueDisable();
void torqueEnable();
void feedbackMotor();

/* 
 *  Variáveis globais
 */
bool receivedRequest = false;
bool headMotorOpenCm = false;
bool headMotorExp= false;
ros::NodeHandle  nh;

// Conexão para o ttl da OpenCM
DynamixelWorkbench openCmWb;

// Conexão para as entradas da placa de extensão
DynamixelWorkbench expWb;

// Mensagem
movement_msgs::OpencmRequestMsg rqt;
movement_msgs::OpencmResponseMsg response_msg;

// Topicos
ros::Subscriber<movement_msgs::OpencmRequestMsg> sub("opencm/request_move", requestMovement);
ros::ServiceServer<movement_msgs::CommandToOpenCMSrv::Request, movement_msgs::CommandToOpenCMSrv::Response> service("opencm/request_command", &resquestCommand);
ros::Publisher pub("opencm/response", &response_msg);

unsigned long initialTime = 0;

// Variaveis de Tratamento
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

int countZeroMotor = 0;

int32_t data[DOF] = {0};
int32_t vel[DOF] = {0}; 

void setup()
{
  initialTime = millis();
  receivedRequest = false;
  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(pub);
  nh.advertiseService(service);

  setupDynamixel();
  
  // Esperando a conexão com o computador para continuar a execução
  while (!nh.connected())
  {
    nh.spinOnce();
  }
}

void loop() 
{
  countZeroMotor = 0;
    
  if(receivedRequest) 
  { 
    if(command == shutdown_now) 
    {
      torqueDisable();
    }
    
    else if(command == reborn) 
    {
      torqueEnable();
      setupDynamixel(); 
    }

    else if(command == position_dt) 
    {
      for (int index = 0; index < opencmMotorCount; index++)
      {
        int id = opencmMotors[index];
        openCmData[index] = (int32_t)data[id];
        openCmSpeed[index] = (int32_t)vel[id] + 1;
        checkZero(openCmData[index], "OpenCm");
      } 
      for (int index = 0; index < expMotorCount; index++)
      {
        int id = expMotors[index];
        expData[index] = (int32_t)data[id];
        expSpeed[index] = (int32_t)vel[id] + 1;
        checkZero(expData[index], "Exp");
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
    // nh.loginfo("[OPENCM] Procurando motores conectados via TTL");
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
    // nh.loginfo("[OPENCM] Procurando motores conectados na Placa de Extensão");
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
 
void requestMovement(const movement_msgs::OpencmRequestMsg& rqt)
{
  /*
   * Por algum motivo ainda desconhecido, quando tento executar alguma ação dentro do request a OpenCM trava, por isso estou copiando o 
   * conteúdo da mensagem para executar dentro do loop
   */

  for(int i = 0; i < DOF; i++)
  {
    data[i] = rqt.motors_position[i];
    vel[i] = rqt.motors_velocity[i];
  }
  receivedRequest = true;
}

void feedbackMotor()
{
  nh.loginfo("FeedBack");
  for (int index = 0; index < DOF; index++)
  {
    bool resultOpencmData = openCmWb.itemRead(index, "Present_Position", &openCmDataFeedback[index]);
    bool resultExpData = expWb.itemRead(index, "Present_Position", &expDataFeedback[index]);
    bool resultOpencmSpeed = openCmWb.itemRead(index, "Present_Velocity", &openCmSpeedFeedback[index]);
    bool resultExpSpeed = expWb.itemRead(index, "Present_Velocity", &expSpeedFeedback[index]);

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

void torqueDisable()
{
  /* Desativa todos os motores */
  for (int index = 0; index < MotorCount; index++)
  {
    
    int id = opencmMotors[index];
    bool resultOpencm = openCmWb.torqueOff(opencmMotors[index]);
    bool resultExp = expWb.torqueOff(expMotors[index]);
  }
    
  nh.loginfo ("");
  nh.loginfo (" _______________________________ ");
  nh.logwarn("|      TORQUE  DESATIVADO       |");
}

void torqueEnable()
{
  /* Ativa todos os motores */
  for (int index = 0; index < MotorCount; index++)
  { 
    int id = opencmMotors[index];
    bool resultOpencm = openCmWb.torqueOn(opencmMotors[index]);
    bool resultExp = expWb.torqueOn(expMotors[index]);
  }
    
  nh.loginfo ("");
  nh.loginfo (" _______________________________ ");
  nh.logwarn("|        TORQUE  ATIVADO        |");
}

int checkZero(int32_t motorPosition, String board)
{
  if (motorPosition == 0)
  {
    countZeroMotor++;
  }

  if(countZeroMotor > 2)
  {
    nh.loginfo("Security activated");
    for (int index = 0; index < 20; index++)
    {
      if (board == "OpenCm") openCmData[index] = (int32_t)2048;
      else if (board == "Exp") expData[index] = (int32_t)2048;
      countZeroMotor = 0;
    }
  }
}
