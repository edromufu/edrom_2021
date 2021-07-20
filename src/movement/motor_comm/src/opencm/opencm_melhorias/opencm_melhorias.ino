#include <ros.h>
#include <DynamixelWorkbench.h>
#include <movement_msgs/OpencmRequestMsg.h>
#include <movement_msgs/OpencmResponseMsg.h>

#define BAUDRATE 1000000
#define DOF 20

/*
 Nomes de Modelos

#define MX_106 302
#define MX_106_2 321
#define MX_64 310
#define MX_64_2 311
#define EX_106 107
#define AX_12 12
#define AX_18 18
#define RX_64 64
 */

enum Command {
  live, position_dt_head, position_dt, shutdown_now, reborn, motor_feed_back
};

/* 
 *  Funções
 */
 
void request(const movement_msgs::OpencmRequestMsg& rqt);
void scan();
void setupDynamixel();
void torqueDisable();
void torqueEnable();
void feedbackMotor();
void feedbackMotorHead();
double mapDouble(double, double, double, double, double);

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
ros::Subscriber<movement_msgs::OpencmRequestMsg> sub("opencm/request", request);
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

Command command;
int32_t data[DOF] = {0};
int32_t vel[DOF] = {0}; 

void setup()
{
  initialTime = millis();
  receivedRequest = false;
  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(pub);
  
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
    if(command == live) 
    {
      setupDynamixel();
    }
    
    else if(command == shutdown_now) 
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
      
      /*if (millis() > 10000 + initialTime)
      {
        nh.spinOnce();
        feedbackMotor();
        nh.spinOnce();
        initialTime = millis();
      } */
    } 
    
    if (command == position_dt_head)
    {
      for (int index = 0; index < opencmMotorCount; index++)
      {
        int id = opencmMotors[index];
        if (id > 17)
        {
          headMotorOpenCm = true;
          openCmData[index] = (int32_t)data[id];
          openCmSpeed[index] = (int32_t)vel[id] + 1;
        }
        else
        {
          headMotorOpenCm = false; 
        }
      } 
      
      for (int index = 0; index < expMotorCount; index++)
      {
        int id = expMotors[index];
        if (id > 17)
        {
          headMotorExp = true;
          expData[index] = (int32_t)data[id];
          expSpeed[index] = (int32_t)vel[id] + 1;
        }
        else
        {
          headMotorExp = false; 
        }
      }
      
      if(opencmMotorCount > 0 && headMotorOpenCm == true)
      {
        openCmWb.syncWrite(1,&openCmSpeed[0]);
        openCmWb.syncWrite(0,&openCmData[0]);
      }
              
      else if(expMotorCount > 0 && headMotorExp == true) 
      {
        expWb.syncWrite(1,&expSpeed[0]);
        expWb.syncWrite(0,&expData[0]);
      }
      
      if (millis() > 100 + initialTime)
      {
        feedbackMotorHead();
        initialTime = millis();
      } 
    }
    receivedRequest = false;
  }
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

  for (uint8_t i = 0; i < DOF; i++)
  {
    response_msg.model[i] = modelMotors[i];
  }
  pub.publish(&response_msg);
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
 
void request(const movement_msgs::OpencmRequestMsg& rqt)
{
  /*
   * Por algum motivo ainda desconhecido, quando tento executar alguma ação dentro do request a OpenCM trava, por isso estou copiando o 
   * conteúdo da mensagem para executar dentro do loop
   */
  if(strcmp (rqt.commandRead,"position_dt") == 0)
  {
    command = position_dt;
  }
  else if(strcmp (rqt.commandRead,"position_dt_head") == 0)
  {
    command = position_dt_head;
  }
  else if(strcmp (rqt.commandRead,"live") == 0)
  {
    command = live;
  }
  else if(strcmp (rqt.commandRead,"shutdown_now") == 0)
  {
    command = shutdown_now;
  }
  else if(strcmp (rqt.commandRead,"reborn") == 0)
  {
    command = reborn;
  }

  else if(strcmp (rqt.commandRead,"motor_feed_back") == 0)
  {
    command = motor_feed_back;
    receivedRequest = false;
  }

  for(int i = 0; i < DOF; i++)
  {
    data[i] = rqt.data[i];
    vel[i] = rqt.velocity[i];
  }
  receivedRequest = true;
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
      response_msg.data[index] = 0;
      response_msg.velocity[index] = 0;
    }
    
    else if (resultOpencmData == 1 && resultExpData == 0)
    {
      response_msg.data[index] = openCmDataFeedback[index];
      response_msg.velocity[index] = openCmSpeedFeedback[index];
    }
    
    else if (resultOpencmData == 0 && resultExpData == 1)
    { 
      response_msg.data[index] = expDataFeedback[index];
      response_msg.velocity[index] = expSpeedFeedback[index];
    }
  }
  pub.publish(&response_msg);
  nh.spinOnce();
}

void feedbackMotorHead()
{
  for (int index = 18; index < DOF; index++)
  {
    bool resultOpencm = openCmWb.itemRead(index, "Present_Position", &openCmDataFeedback[index]);
    bool resultExp = expWb.itemRead(index, "Present_Position", &expDataFeedback[index]);

    if (resultOpencm == 0 && resultExp == 0)
    {
      response_msg.data[index] = 0;
    }
    
    else if (resultOpencm == 1 && resultExp == 0)
    {
      response_msg.data[index] = openCmDataFeedback[index];
    }
    
    else if (resultOpencm == 0 && resultExp == 1)
    { 
      response_msg.data[index] = expDataFeedback[index];
    }
  }
  pub.publish(&response_msg);
}

double mapDouble(double x, double in_min, double in_max, double out_min, double out_max) 
{ 
  return ((x - in_min) * (out_max - out_min)) / ((in_max - in_min) + out_min); 
}
