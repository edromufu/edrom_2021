#include "ros/ros.h"
#include "movement_msgs/OpencmRequestMsg.h"
#include "movement_msgs/WebotsMsg.h"

#include <vector>

#define RAD2MOTOR 651.74
#define MOTORREF 2048

class Converter
{
    public:
    Converter()
    {
        subOpenCMReq = nh.subscribe("opencm/request", 1000, &Converter::callbackOpencmRequest, this);
        
        pub2Controller = nh.advertise<movement_msgs::WebotsMsg>("opencm/conversion", 1000);
        ros::Rate loop_rate(10);

    }

    private:
    movement_msgs::WebotsMsg convertedMsg;
    ros::Publisher pub2Controller;
    ros::Subscriber subOpenCMReq;
    ros::NodeHandle nh;

    void convertToWebots(std::vector<int> data)
    {  
        std::vector<float> radPosition(20,0);
        std::vector<std::string> motorNames {"RARM_0 [shoulder]", "LARM_0 [shoulder]", 
                                             "RARM_1", "LARM_1", 
                                             "LARM_2", "RARM_2",
                                             "RLEG_0", "LLEG_0",
                                             "RLEG_1 [hip]", "LLEG_1 [hip]",
                                             "RLEG_2", "LLEG_2",
                                             "RLEG_3", "LLEG_3",
                                             "RLEG_4", "LLEG_4", 
                                             "RFOOT", "LFOOT",
                                             "HEAD_0", "HEAD_1"};

        int countZeros = 0;

        radPosition.clear();

        for(int i=0; i<20; i++)
        {
            if (data[i] <= 0)
            {
                data[i] = 2048;
            }
            radPosition.push_back((data[i] - MOTORREF)/RAD2MOTOR);
            convertedMsg.position[i] = radPosition[i];
            if (i > 17)
                convertedMsg.velocity[i] = 0.5;

            else 
                convertedMsg.velocity[i] = 2;
                
            std::cout << motorNames[i] << "\n";
            convertedMsg.motor_name[i] = motorNames[i];
        }
        if (countZeros >= 12)
        {
            convertedMsg.control = "wait_values";
        }
        else
        {
            convertedMsg.control = "conversion_mode";
        }
        pub2Controller.publish(convertedMsg);
    }

    void callbackOpencmRequest(const movement_msgs::OpencmRequestMsg::ConstPtr &msg)
    {   
        std::vector<int> posOpencm;

        for(int i=0; i<20; i++){
            posOpencm.push_back(msg->data[i]);
        }

        convertToWebots(posOpencm);
        posOpencm.clear();
    }

};

int main(int argc, char **argv)
{
    ros::init (argc, argv, "Conversion");
    Converter *converter = new Converter();
    ros::spin();
    return 0;
}
