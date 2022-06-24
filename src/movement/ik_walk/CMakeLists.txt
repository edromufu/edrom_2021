cmake_minimum_required(VERSION 3.0.2)
project(ik_walk)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)
FIND_PACKAGE (Eigen3 REQUIRED)

find_package(catkin REQUIRED COMPONENTS roscpp movement_msgs rospy std_msgs movement_msgs genmsg) 
FIND_PACKAGE (Eigen3 REQUIRED)


## Declare a catkin package
catkin_package(
    INCLUDE_DIRS include
    LIBRARIES ${PROJECT_NAME}
    CATKIN_DEPENDS roscpp std_msgs eigen_conversions movement_msgs
)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(andar src/andar.cpp)
target_link_libraries(andar ${catkin_LIBRARIES})
