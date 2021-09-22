cmake_minimum_required(VERSION 2.8.3)

project(motor_comm)

find_package(catkin REQUIRED COMPONENTS
    movement_msgs
    humanoid_loadmap
    dynamixel_sdk
    dynamixel_workbench_toolbox
    movement_util
)

set(CMAKE_BUILD_TYPE Debug)
add_definitions(-std=c++11 -Wall)

catkin_package(
   INCLUDE_DIRS include
   LIBRARIES ${PROJECT_NAME}
   CATKIN_DEPENDS movement_msgs humanoid_loadmap dynamixel_sdk dynamixel_workbench_toolbox movement_util
)

include_directories(include ${catkin_INCLUDE_DIRS})

add_library(opencm        src/opencm/opencm.cpp)
add_executable(opencm_node src/opencm/opencm_node.cpp)
target_link_libraries(opencm_node  opencm map ${catkin_LIBRARIES})

add_executable(conversion_webots_node src/opencm/conversion_webots.cpp)
target_link_libraries(conversion_webots_node    ${catkin_LIBRARIES})