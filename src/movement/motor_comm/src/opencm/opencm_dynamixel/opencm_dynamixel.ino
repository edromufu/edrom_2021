#include <ros.h>
#include <DynamixelWorkbench.h>
#include <movement_msgs/OpencmRequestMsg.h> ///
#include <movement_msgs/DynamixelCreatorSrv.h>

#define BAUDRATE 1000000
#define DOF 20

// Funções Utilizadas
void DynamixelService(movement_msgs::DynamixelCreatorSrv::Request &req, movement_msgs::DynamixelCreatorSrv::Response &res);
void request(const movement_msgs::OpencmRequestMsg &rqt); ///
void value2Radian(int id, int32_t valueData);
void setupDynamixel();
void scan();
void setTorque();
void getMotorPose();
void motor2Rad();
void getVcc();

// NodeHandle
ros::NodeHandle nh;

// Variaveis 
float radPosition[DOF];
float *filteredData;
float rad2motor = 4096/(2*PI); //passivel de erro

int32_t *openCmData; ///
int32_t *openCmSpeed; ///
int32_t *expData; /// 
int32_t *expSpeed; ///
int32_t *DataFeedback;
int32_t onoff;
int32_t presentPosition[DOF] = {0};
int32_t data[DOF] = {0};
int32_t vel[DOF] = {0}; 

uint8_t opencmMotors[DOF];
uint8_t opencmMotorCount = 0;
uint8_t expMotors[DOF];
uint8_t torque[DOF];
uint8_t expMotorCount = 0;
uint8_t MotorCount = 0;

uint16_t motorCCWLimNatasha[] = {4095,  //0
                          3000,   //1
                          2300,   //2
                          4095,   //3 
                          3700,   //4
                          2500,   //5
                          2320,   //6
                          2320,   //7
                          2300,   //8
                          3100,   //9
                          2900,   //10
                          2600,   //11
                          3400,   //12
                          2300,   //13
                          2300,   //14
                          3000,   //15
                          3100,   //16
                          3300,   //17
                          3070,   //18
                          4096};

uint16_t motorCwLimNatasha[] = {1100 ,   //0
                            0    ,   //1
                            0    ,   //2
                            1900 ,   //3
                            1600 ,   //4
                            380  ,   //5
                            1773 ,   //6
                            1773 ,   //7
                            1100 ,   //8
                            2000 ,   //9
                            800  ,   //10
                            1100 ,   //11
                            1600 ,   //12
                            800  ,   //13
                            1700 ,   //14
                            1500 ,   //15
                            1000 ,   //16
                            1500 ,   //17
                            1080 ,   //18
                            0    //,   //19
                            //0    ,   //20
                            };

int motorRefNatasha = 2048;
int countZeroMotor = 0;

bool received = false;
bool topicReceived = false;

String wish;
String commandRead; ///

// Conexão para o ttl da OpenCM
DynamixelWorkbench openCmWb;

// Conexão para as entradas da placa de extensão
DynamixelWorkbench expWb;

// Mensagens Utilizadas para os Services
movement_msgs::DynamixelCreatorSrv dynamixelCreatorSrv;

// Mensagens Utilizadas para os Topicos
movement_msgs::OpencmRequestMsg rqt; ///

// Função callback do DynamixelCreatorSrv (deve ser definida antes do ros::ServiceServer)
void DynamixelService(const movement_msgs::DynamixelCreatorSrv::Request &req, movement_msgs::DynamixelCreatorSrv::Response &res)
{
  topicReceived = false;
  wish = req.wish;
  if(wish == "scan")
  {
    received = true;
  }
  else if(wish == "torque")
  {
    char buffer [35];
    //for(int i = 0; i < sizeof(req.torque); i++)
    for(int i = 0; i < 20; i++)
    {
      torque[i] = req.torque[i];
    }
    nh.loginfo("Torque Alterado");
    received = true;
  }
  else if(wish == "scan_pose")
  { 
    getMotorPose();
    for(uint8_t i = 0; i < opencmMotorCount; i++)
    {
      int id = opencmMotors[i];
      res.feedbackPosition[id] = DataFeedback[id];
    }
    for(uint8_t i = 0; i < expMotorCount; i++)
    {
      int id = expMotors[i];
      res.feedbackPosition[id] = DataFeedback[id];
    }
    received = true;
  }
  else if(wish == "scan_vcc")
  { 
    getVcc();
    for(uint8_t i = 0; i < opencmMotorCount; i++)
    {
      int id = opencmMotors[i];
      res.feedbackVcc[id] = DataFeedback[id];
    }
    for(uint8_t i = 0; i < expMotorCount; i++)
    {
      int id = expMotors[i];
      res.feedbackVcc[id] = DataFeedback[id];
    }
    received = true;
  }
  else
  {
    received = false;    
  }
}

// Definição do Service
ros::ServiceServer<movement_msgs::DynamixelCreatorSrv::Request, movement_msgs::DynamixelCreatorSrv::Response> service("motor_comm/opencm/dynamixelServiceSrv", &DynamixelService); 

// Mensagens Utilizadas para os Topicos
ros::Subscriber<movement_msgs::OpencmRequestMsg> sub("opencm/request", request); ///

// Inicialização da Opencm
void setup()
{
  nh.initNode();
  nh.subscribe(sub);
  nh.advertiseService(service);
  while (!nh.connected())
  {
    nh.spinOnce();
  }
  setupDynamixel();
}

void loop() 
{  
  if(received)
  {
    if(wish == "scan")
    {
      setupDynamixel();
      received = false; 
    }
    else if(wish == "torque")
    {
      setTorque();
      received = false; 
    }
    else if(wish == "scan_pose")
    {
      nh.loginfo("Dentro do scan");
      received = false;
    }
    else if(wish == "scan_vcc")
    {
      nh.loginfo("Leitura de Tensão");
      received = false;
    }  
  }
  else if(topicReceived)
  {
    if(commandRead == "position_dt") ///
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
      topicReceived = false;
    } 
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
  free(filteredData);
  free(DataFeedback);
  
  nh.loginfo("[OPENCM] PROCURANDO MOTORES CONECTADOS");
  nh.loginfo("");
    
  if(openCmWb.scan(opencmMotors,&opencmMotorCount,DOF))
  {
    // nh.loginfo("[OPENCM] Procurando motores conectados via TTL");
    for (uint8_t i = 0; i < opencmMotorCount; i++)
    {
        openCmWb.jointMode(opencmMotors[i], 300, 0);
        sprintf (buffer, "|    MOTOR - %d -ENCONTRADO      |", opencmMotors[i]);
        nh.loginfo(buffer);
    }
    filteredData = (float*)malloc(opencmMotorCount * sizeof(float));
    DataFeedback = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
    openCmData = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
    openCmSpeed = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
    
    
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
      expWb.jointMode(expMotors[i], 300, 0);
      sprintf (buffer, "|    MOTOR - %d -ENCONTRADO      |", expMotors[i]);
      nh.loginfo(buffer);
    }

    filteredData = (float*)malloc(expMotorCount * sizeof(float));
    DataFeedback = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
    expData = (int32_t*)malloc(expMotorCount * sizeof(int32_t));
    expSpeed = (int32_t*)malloc(expMotorCount * sizeof(int32_t));

    
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

void getMotorPose()
{
  nh.loginfo("Inicio Poses");
  for(uint8_t i = 0; i < opencmMotorCount; i++)
  {
    int id = opencmMotors[i];
    openCmWb.itemRead(id, "Present_Position", &DataFeedback[id]);
    filteredData[i] = openCmWb.convertValue2Radian(id, DataFeedback[id]);
  }
  
  for(uint8_t i = 0; i < expMotorCount; i++)
  {
    int id = expMotors[i];
    expWb.itemRead(id, "Present_Position", &DataFeedback[id]);
    filteredData[i] = expWb.convertValue2Radian(id, DataFeedback[id]);

  }  
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

void setTorque()
{
  for(uint8_t i = 0; i < opencmMotorCount; i++)
  {
    int id = opencmMotors[i];
    openCmWb.torque(id, torque[id]);
  }
  
  for(uint8_t i = 0; i < expMotorCount; i++)
  {
    int id = expMotors[i];
    expWb.torque(id, torque[id]);    
  }
  
  nh.logwarn("Torque Alterado");
}

void motor2Rad()
{
  for (uint8_t index = 0; index < DOF ; index++)
  {
    radPosition[index] = (DataFeedback[index] - motorRefNatasha)/(rad2motor);
  }  
}

void getVcc()
{
  for(uint8_t i = 0; i < opencmMotorCount; i++)
  {
    int id = opencmMotors[i];
    openCmWb.itemRead(id, "Present_Input_Voltage", &DataFeedback[id]);
  }
  
  for(uint8_t i = 0; i < expMotorCount; i++)
  {
    int id = expMotors[i];
    expWb.itemRead(id, "Present_Input_Voltage", &DataFeedback[id]);
  } 

}

void request(const movement_msgs::OpencmRequestMsg &rqt) ///
{
  received = false;
  nh.loginfo("Entrei no request");
  commandRead = rqt.commandRead;
  if(commandRead == "position_dt")
  {
    nh.loginfo("Entrei no position dt");
    for(int i = 0; i < DOF; i++)
    {
      data[i] = rqt.data[i];
      vel[i] = rqt.velocity[i];
    }
    topicReceived= true;
  }
}
