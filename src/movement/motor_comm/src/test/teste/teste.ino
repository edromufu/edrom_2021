#include <ros.h>
#include <DynamixelWorkbench.h>
#include <movement_msgs/MotorDataMsg.h>

#define BAUDRATE 1000000
#define DOF 20

enum Command {
  live,position_dt
};


/* 
 *  Funções
 */
void request(const movement_msgs::MotorDataMsg& rqt);
void scanMotors();
void setupDynamixel();

/* 
 *  Variáveis globais
 */
bool success = true;
bool receivedRequest;
ros::NodeHandle  nh;

// Conexão para o ttl da OpenCM
DynamixelWorkbench openCmWb;
// Conexão para as entradas da placa de extensão
DynamixelWorkbench expWb;

movement_msgs::MotorDataMsg response_msg;
ros::Subscriber<movement_msgs::MotorDataMsg> sub("motor/request", request );
ros::Publisher pub("motor/response", &response_msg);

uint8_t opencmMotors[DOF];
uint8_t opencmMotorCount = 0;
uint8_t expMotors[DOF];
uint8_t expMotorCount = 0;
uint8_t MotorCount = 0;

int32_t *openCmData = {0};
int32_t *expData = {0};

Command command;
double data[DOF];
double vel[DOF]; 

void setup(){
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

void loop() {
  // TODO: pegar tempo para deixar ele mais constante
  if(receivedRequest) 
  {
    if(command == live) 
    {
      setupDynamixel();
    }
    if(command == position_dt) 
    {
      nh.loginfo("1");
      for (int index = 0; index < expMotorCount; index++)
      {
        int id = expMotors[index];
        expData[index] = (int32_t)data[id];
        nh.loginfo("11.");   
        expData[index] = 0;
        
        nh.spinOnce();
      }
      nh.loginfo("2");      
      if(expMotorCount > 0)
      {
        const char *log;
        nh.loginfo("Dentro do SyncWrite.");  
        expWb.syncWrite(0,&expData[0], &log);
      }
    }    
  }  
  receivedRequest = false;
  nh.spinOnce();
}

void request(const movement_msgs::MotorDataMsg& rqt)
{
  if(strcmp (rqt.command,"live") == 0)
  {
    command = live;
  }
  if(strcmp (rqt.command,"position_dt") == 0)
  {
    command = position_dt;   
  }
  nh.loginfo("No Request");
  for(uint8_t i = 0; i < DOF; i++, &log)
  {
    char buffer [35];
    data[i] = rqt.data[i];
    vel[i] = rqt.vel[i];
  }
  receivedRequest = true;
  delay(10);
}

void setupDynamixel() 
{
  const char *log;
  if(!expWb.init("3",BAUDRATE, &log))
  {
    nh.logerror("[OPENCM] Erro ao iniciar workbench da Placa de Extensão");
  }
  if(!openCmWb.init("",BAUDRATE, &log))
  {
    nh.logerror("[OPENCM] Erro ao iniciar workbench da OpenCm");
  }
  char buffer [35];
  free(openCmData);
  free(expData); 
  if(openCmWb.scan(opencmMotors,&opencmMotorCount,DOF, &log))
  {
    for (uint8_t i = 0; i < opencmMotorCount; i++)
    {
      openCmData = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
      openCmWb.jointMode(opencmMotors[i], 300, 0, &log);
      sprintf (buffer, "[OPENCM] TTL To Motor: %d  Modelo: %s encontrado",opencmMotors[i],openCmWb.getModelName(opencmMotors[i]));
      nh.loginfo(buffer);
    }
  } 
  else
  {
    nh.logerror("[OPENCM] Erro ao escanear motores da OpenCM");
  }
  nh.logwarn("[OPENCM] Procurando motores conectados na Placa de Extensão");
  expWb.scan(expMotors,&expMotorCount,DOF, &log);
  receivedRequest = true;
  for (uint8_t i = 0; i < expMotorCount; i++)
    {
      expWb.jointMode(expMotors[i], 300, 0, &log);
    }
     expData = (int32_t*)malloc(expMotorCount * sizeof(int32_t));
     sprintf (buffer, "[OPENCM] expData: %d",*expData);
  nh.loginfo(buffer);
  if(expWb.getProtocolVersion() == 1.0) 
  {
    nh.loginfo("PROTOCOLO 1.0");
    expWb.addSyncWriteHandler(expMotors[0],"Goal_Position", &log);
    expWb.addSyncWriteHandler(expMotors[0],"Moving_Speed", &log);
    expWb.addSyncWriteHandler(expMotors[0],"Torque_Enable", &log);
    expWb.addSyncWriteHandler(expMotors[0],"P_Gain", &log);
  } 
  if(expWb.getProtocolVersion() == 2.0)  
  {
    nh.loginfo("PROTOCOLO 2.0");
    expWb.addSyncWriteHandler(opencmMotors[0],"Goal_Position", &log);
    expWb.addSyncWriteHandler(opencmMotors[0],"Profile_Velocity");
    expWb.addSyncWriteHandler(opencmMotors[0],"Torque_Enable");
    expWb.addSyncWriteHandler(opencmMotors[0],"Position_P_Gain");
    nh.loginfo("saindo da configSyncHandlers");
  }  
}
