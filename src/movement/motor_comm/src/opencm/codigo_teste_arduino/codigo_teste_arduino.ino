#include <ros.h>
#include <std_msgs/Int64.h>
#include <DynamixelWorkbench.h>
#include <stdlib.h>
#include <sstream>
ros::NodeHandle  n;
void setup() {
  // put your setup code here, to run once:

}

int decision; 
void chatterCallback (const std_msgs::Int64& msg)
{ 
    const char* port_name = "/dev/ttyUSB0";
    int baud_rate = 1000000;
    uint16_t model_number = 0;
    uint8_t dxl_id[4] = {20, 21, 0, 1};
    DynamixelWorkbench dxl_wb;
    const char *log;
    bool result = false;
    result = dxl_wb.init(port_name, baud_rate, &log);

    if (result == false)
    {
      printf("%s\n", log);
      printf("Failed to init\n");
    }
    else
      printf("Succeed to init(%d)\n", baud_rate);  

    for (int cnt = 0; cnt < 4; cnt++)
    {
      result = dxl_wb.ping(dxl_id[cnt], &model_number, &log);
      if (result == false)
      {
        printf("%s\n", log);
        printf("Failed to ping\n");
      }
      else
      {
        printf("Succeeded to ping\n");
        printf("id : %d, model_number : %d\n", dxl_id[cnt], model_number);
      }
      //result = dxl_wb.jointMode(dxl_id[cnt], 0, 0, &log);

      result = dxl_wb.addSyncWriteHandler(dxl_id[0], "Goal_Position", &log);
      if (result == false)
      {
        printf("%s\n", log);
        printf("Failed to add sync write handler\n");
      }
    }

    int x, y;
    x=512;
    y=512;

    int32_t goal_position[4] = {x, y, 512, 512};
    const uint8_t handler_index = 0;
    dxl_wb.syncWrite(handler_index, &goal_position[0], &log);

    while (true)
    {
      int decision = msg.data;
    
      if (decision!=0){ 
        int32_t goal_position[4] = {x, y, 512, 512};
        const uint8_t handler_index = 0;
        result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);

        switch (decision){ 
        case 1:
          if(205<x){
              //ROS_INFO("estou vendo 1 \n");
              x=x-34; //graus
              int32_t goal_position[4] = {x, y, 512, 512};
              const uint8_t handler_index = 0;   
              result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
          }
          break;
      
        case -1:
          if(x<819){
              //ROS_INFO("estou vendo -1 \n");
              x=x+24; //graus
              int32_t goal_position[4] = {x,y, 512, 512}; 
              const uint8_t handler_index = 0;
              result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
          }
          break;
      
        case 2:
          if(359<y){ 
              //ROS_INFO("estou vendo 2 \n");
              y=y-34; //graus
              int32_t goal_position[4] = {x,y, 512, 512};
              const uint8_t handler_index = 0;
              result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
              }
          break;

        case -2:
          if(y<695){ 
                //ROS_INFO("estou vendo -2 \n");
                y=y+24; //graus
                int32_t goal_position[4] = {x,y, 512, 512};
                const uint8_t handler_index = 0;
                result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
          }
          break; 

        /*case 3:
          ROS_INFO("estou vendo 3 \n");
          x=205;
          int32_t goal_position[4] = {x,y, 512, 512}; 
          const uint8_t handler_index = 0;
          result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
          if(512<x && x<819){
              x=x+24; //graus
              int32_t goal_position[4] = {x,y, 512, 512}; 
              const uint8_t handler_index = 0;
              result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
              sleep (0.2);
          }
          if(x>=819 || x<=205){
              if(y<695){
                  y=y+24; //graus
                  int32_t goal_position[4] = {x,y, 512, 512}; 
                  const uint8_t handler_index = 0;
                  result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
                  sleep (0.2);
              }
              if(359<y){
                  y=y-34; //graus
                  int32_t goal_position[4] = {x,y, 512, 512}; 
                  const uint8_t handler_index = 0;
                  result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
                  sleep (0.2);
              }
          }
          if(512>x && x<205){
              x=x-34; //graus
              int32_t goal_position[4] = {x,y, 512, 512}; 
              const uint8_t handler_index = 0;
              result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
              sleep (0.2);
          }  
          break;*/
        }
      }
      else if (decision==0)
      {
        //ROS_INFO ("estou vendo 0 \n");
        int32_t goal_position[4] = {x, y, 1000, 12};
        const uint8_t handler_index = 0;
        result = dxl_wb.syncWrite(handler_index, &goal_position[0], &log);
      }
    }
    n.spinOnce();
    printf ("acabou td \n");
}

void loop() {
    n.initNode();
    n.spin();

    return 0;
}
