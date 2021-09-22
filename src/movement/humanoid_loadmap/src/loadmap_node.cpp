
#include "ros/ros.h"
#include "humanoid_loadmap/LoadMapNode.h"


int main(int argc, char **argv)
{
    ros::init (argc, argv, "LoadMapNode");
    ros::NodeHandle nh;
    LoadMapNode loadmap_node(nh);
    ros::spin();
    return 0;
}



