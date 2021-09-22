#include <ros.h>
#include <DynamixelWorkbench.h>
#include <movement_msgs/OpencmRequestMsg.h>
#include <movement_msgs/OpencmResponseMsg.h>
#include <vision_msgs/Ball.h>

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
  live, position_dt_head, position_dt, shutdown_now,
};

/* 
 *  Funções
 */
 
void request(const movement_msgs::OpencmRequestMsg& rqt);
void scan();
void setupDynamixel();
int checkZero(int32_t , String);
void ballRequest(const vision_msgs::Ball& pid_rqt);




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
vision_msgs::Ball pid_rqt;

// Topicos
ros::Subscriber<movement_msgs::OpencmRequestMsg> sub("opencm/request", request);
ros::Publisher pub("opencm/response", &response_msg);
ros::Subscriber<vision_msgs::Ball> subPid("topico_da_visao_do_PID", ballRequest);

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

int32_t xCentro;
int32_t yCentro;


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
      
    else if(command == position_dt) 
    {
      
      for (int index = 0; index < expMotorCount; index++)
      {
        int id = expMotors[index];
        expData[index] = (int32_t)data[id];
        expSpeed[index] = (int32_t)vel[id] + 1;
        checkZero(expData[index], "Exp");
      }
                    
      if(expMotorCount > 0) 
      {
        expWb.syncWrite(1,&expSpeed[0]);
        expWb.syncWrite(0,&expData[0]);
      }
      
      
    } 
    
    if (command == position_dt_head)
    {
           
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
                   
      if(expMotorCount > 0 && headMotorExp == true) 
      {
        expWb.syncWrite(1,&expSpeed[0]);
        expWb.syncWrite(0,&expData[0]);
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
  else
  {
     nh.logerror("[OPENCM] Motores conectados");
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
  MotorCount = expMotorCount;
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

  for(int i = 0; i < DOF; i++)
  {
    data[i] = rqt.data[i];
    vel[i] = rqt.velocity[i];
  }
  receivedRequest = true;
}

void ballRequest(const vision_msgs::Ball& pid_rqt)
{
  char buffer [35];
  xCentro = pid_rqt.x;
  yCentro = pid_rqt.y;

  nh.loginfo (" _______________________________ ");
  sprintf (buffer,"|    Posição em y: %d     |", yCentro);
  nh.logwarn(buffer);
  nh.loginfo (" _______________________________ ");
  sprintf (buffer,"|    Posição em x: %d     |", xCentro);
  nh.logwarn(buffer);
  
  
}
