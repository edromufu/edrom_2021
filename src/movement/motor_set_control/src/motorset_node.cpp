#include "ros/ros.h"
#include "motor_set_control/motorset.h"

int main(int argc, char **argv)
{
    ros::init (argc, argv, "MotorSetNode");
    ros::NodeHandle nh;
    MotorSet motorset_node(nh);
    ros::spin();
    return 0;
}
