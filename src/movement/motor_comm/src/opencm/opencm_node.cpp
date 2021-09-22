#include "opencm/opencm.h"
#include "ros/ros.h"

int main(int argc, char **argv)
{
    ros::init (argc, argv, "OpenCMNode");
    ros::NodeHandle nh;
    OpenCM opencm_node(nh);
    ros::spin();
    return 0;
}

