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
void scan();
void setupDynamixel();
void configSyncHandlers(DynamixelWorkbench wb, uint8_t address);

/* 
 *  Variáveis globais
 */
bool receivedRequest;;
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

int32_t *openCmData;
int32_t *expData;

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
  if(receivedRequest) {
    if(command == live) {
      setupDynamixel();
    }
    if(command == position_dt) {
      nh.loginfo("1");
//    for (int index = 0; index < opencmMotorCount; index++)
//    {
//      int id = opencmMotors[index];
//      //openCmData[index] = (int32_t)data[id];
//      openCmData[index] = 2048;
//    } 
      nh.loginfo("1");
      for (int index = 0; index < expMotorCount; index++)
      {
        int id = expMotors[index];
        expData[index] = (int32_t)data[id];
      //expData[index] = 2800;
      }
      nh.loginfo("1");
    
//    if(opencmMotorCount > 0){
//      openCmWb.syncWrite(0,&openCmData[0]);
//    }
      
      nh.loginfo("2");
      if(expMotorCount > 0) {
        expWb.syncWrite(0,&expData[0]);
      }
      
      nh.loginfo("3");
    } 
    receivedRequest = false;
  }
  
  
  nh.spinOnce();
  delay(50);
}

void request(const movement_msgs::MotorDataMsg& rqt){
  /*
   * Por algum motivo ainda desconhecido, quando tento executar alguma ação dentro do request a OpenCM trava, por isso estou copiando o 
   * conteúdo da mensagem para executar dentro do loop
   */
  if(strcmp (rqt.command,"position_dt") == 0){
    command = position_dt;
  }
  if(strcmp (rqt.command,"live") == 0){
    command = live;
  }
//  strcpy(command,"live");
  nh.loginfo("aqui");
  for(int i = 0; i < DOF; i++){
    data[i] = rqt.data[i];
    vel[i] = rqt.vel[i];
  }
  receivedRequest = true;
}

void scan() {
  char buffer [35];

  free(openCmData);
  free(expData);
  
  if(openCmWb.scan(opencmMotors,&opencmMotorCount,DOF)){
    for (uint8_t i = 0; i < opencmMotorCount; i++)
    {
        openCmWb.jointMode(opencmMotors[i], 300, 0);
        sprintf (buffer, "[OPENCM] Motor: %d  Modelo: %s encontrado",opencmMotors[i],openCmWb.getModelName(opencmMotors[i]));
        nh.loginfo(buffer);
    }
    openCmData = (int32_t*)malloc(opencmMotorCount * sizeof(int32_t));
    configSyncHandlers(openCmWb,opencmMotors[0]);
  } else {
    nh.logerror("[OPENCM] Erro ao escanear motores da OpenCM");
  }
  
  nh.logwarn("[OPENCM] Procurando motores conectados na Placa de Extensão");
  if(expWb.scan(expMotors,&expMotorCount,DOF)){
    for (uint8_t i = 0; i < expMotorCount; i++)
    {
      expWb.jointMode(expMotors[i], 300, 0);
      sprintf (buffer, "[OPENCM] Motor: %d  Modelo: %s encontrado",expMotors[i],expWb.getModelName(expMotors[i]));
      nh.loginfo(buffer);
    }
    configSyncHandlers(expWb,expMotors[0]);
    expData = (int32_t*)malloc(expMotorCount * sizeof(int32_t));
  } else {
    nh.logerror("[OPENCM] Erro ao escanear motores da Placa de Extensão");
  }
}

void configSyncHandlers(DynamixelWorkbench wb, uint8_t address) {
  if(wb.getProtocolVersion() == 1.0) {
    //nh.loginfo("PROTOCOLO 1.0");
    wb.addSyncWriteHandler(address,"Goal_Position");
    wb.addSyncWriteHandler(address,"Moving_Speed");
    wb.addSyncWriteHandler(address,"Torque_Enable");
    wb.addSyncWriteHandler(address,"P_Gain");
  }
  if(wb.getProtocolVersion() == 2.0) {
     //nh.loginfo("PROTOCOLO 2.0");
    wb.addSyncWriteHandler(address,"Goal_Position");
    wb.addSyncWriteHandler(address,"Profile_Velocity");
    wb.addSyncWriteHandler(address,"Torque_Enable");
    wb.addSyncWriteHandler(address,"Position_P_Gain");
  }
}

void setupDynamixel() {
  if(!expWb.init("3",BAUDRATE)) {
    nh.logerror("[OPENCM] Erro ao iniciar workbench da Placa de Extensão");
  }
  if(!openCmWb.init("",BAUDRATE)){
    nh.logerror("[OPENCM] Erro ao iniciar workbench da OpenCm");
  }
  scan();
}
