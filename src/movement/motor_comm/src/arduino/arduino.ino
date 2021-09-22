#include <ros.h>
#include <DynamixelWorkbench.h>
#include <movement_msgs/OpencmRequestMsg.h>
#include <movement_msgs/OpencmResponseMsg.h>
#include "constants.h"

#define BAUDRATE 1000000
#define DEVICE_NAME "" // "3" indica placa de extensão, "" indica o TTL direto da OpenCM, para Mojitaba indicar a porta no Linux
#define DOF 22

ros::NodeHandle  nh;
DynamixelWorkbench workbench;
movement_msgs::OpencmResponseMsg response_msg;
uint8_t motor_ids[DOF];
uint8_t motor_count = 0;
int32_t data[DOF] = {0};
int32_t auxiliarData[DOF] = {0};
int32_t *filteredData;
int32_t *filteredAuxiliarData;
uint8_t commandCount = 0;
uint8_t read;
uint8_t write;
bool success = true;
bool publish;

void request( const movement_msgs::OpencmRequestMsg& rqt);
void resetDevice();
void scanDynamixel();

ros::Subscriber<movement_msgs::OpencmRequestMsg> subcriber("opencm/request", request );
ros::Publisher publisher("opencm/response", &response_msg);

void setup() {
  
  // Iniciando node do ROS
  nh.initNode();
  nh.subscribe(subcriber);
  nh.advertise(publisher);
  
  // Esperando a conexão com o computador para continuar a execução
  while (!nh.connected())
  {
    nh.spinOnce();
  }
}

void loop() {
  const char *log;
  if(commandCount > 0){
    if(commandCount > 1){
      nh.logwarn("[OPENCM] Recebimento de comandos está mais rápido que o processamento.");
    }
    
    for (int index = 0; index < motor_count; index++)
    {
      int id = motor_ids[index];
      filteredData[index] = data[id];
      filteredAuxiliarData[index] = auxiliarData[id];
    } 
    success = true;
    switch(write) {
    case WRITE_POS_VEL: 
      success = workbench.syncWrite(1,&filteredAuxiliarData[0], &log);
      success = workbench.syncWrite(0,&filteredData[0], &log) && success;
      break;
    case WRITE_TORQ: 
      success = workbench.syncWrite(2,&filteredData[0], &log); // Torque_Enable    
      break;
    case WRITE_P_CONST:
      success = workbench.syncWrite(3,&filteredData[0], &log); // Position_P_Gain
      break;
    }
    if (success == false)
    {
      publish = true;
      response_msg.status = "[MOTOR_COMM] Falha na operação de escrita.\n";
    }

    success = true;
    switch(read){
      case INIT:
        resetDevice();
        break;
    }
    if (success == false)
    {
      publish = true;
      response_msg.status = "[MOTOR_COMM] Falha na operação de leitura.\n";
    }

    if(publish) {
      publish = false;
      publisher.publish(&response_msg);
    }
    
    commandCount--;
  }

  nh.spinOnce();
  delay(20);
  
}

void resetDevice(){
  const char *log;
  success = workbench.init(DEVICE_NAME,BAUDRATE,&log);
  if(success == false) {
    publish = true;
    response_msg.status = "[MOTOR_COMM] Falha na inicialização do dispositivo.\n";
    return;
  } 
  scanDynamixel(); 
}

void scanDynamixel(){
  
  free(filteredData);
  free(filteredAuxiliarData);
  motor_count = 0;
  
  const char *log;
  uint16_t model_number = 0;
  workbench.scan(motor_ids,&motor_count,DOF,&log);
  publish = true;
  response_msg.status = "motor_ids";
  for (uint8_t i = 0; i < DOF; i++) rqt.data[i] = -1;
  for (uint8_t i = 0; i < motor_count; i++)
  {
      workbench.jointMode(motor_ids[i], 300, 0,&log);
      response_msg.data[i] = motor_ids[i];
  }
 
  filteredData = (int32_t*)malloc(motor_count * sizeof(int32_t));
  filteredAuxiliarData = (int32_t*)malloc(motor_count * sizeof(int32_t));
  
  workbench.addSyncWriteHandler(motor_ids[0],"Goal_Position",&log);
  workbench.addSyncWriteHandler(motor_ids[0],"Profile_Velocity",&log);
  workbench.addSyncWriteHandler(motor_ids[0],"Torque_Enable",&log);
  workbench.addSyncWriteHandler(motor_ids[0],"Position_P_Gain",&log);
}

/*
 * Função chamada quando houver um request para a OpenCM, os dados do request são passados para variáveis internas, pois os comandos
 * devem ser rodados no loop() - executar os comandos de motor dentro dessa função gerava erro. 
 */
void request( const movement_msgs::OpencmRequestMsg& rqt){
  write = rqt.writeCommand;
  read = rqt.readCommand;
  for (uint8_t i = 0; i < DOF; i++){
    data[i] = rqt.data[i];
    auxiliarData[i] = rqt.data[i];
  }
  commandCount++;
}
