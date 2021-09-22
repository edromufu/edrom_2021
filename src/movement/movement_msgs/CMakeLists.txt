################################################################################
# CMake
################################################################################
cmake_minimum_required(VERSION 2.8.3)
project(movement_msgs)

################################################################################
# Packages
################################################################################
find_package(catkin REQUIRED COMPONENTS
  message_generation
  std_msgs 
  geometry_msgs
  sensor_msgs
  dynamic_reconfigure
)

################################################################################
# Declare ROS messages, services and actions
################################################################################
# Generate dynamic parameters
generate_dynamic_reconfigure_options(
	cfg/HumanoidModelConfig.cfg
	cfg/HumanoidModelMoveCreatorConfig.cfg
	cfg/HumanoidLipWalkingParams.cfg
	cfg/HumanoidLipWalkingCmd.cfg
	cfg/HumanoidLipWalkingCtrl.cfg
	cfg/HumanoidCtrl.cfg
	cfg/HumanoidInterface.cfg
	cfg/HumanoidLearning.cfg)


add_message_files(
  FILES
  FFTMsg.msg
  LipFeedBack.msg
  HumanoidControlMsg.msg
  LipParamsMsg.msg
  IDMapMsg.msg
  JointStateMsg.msg
  EndEffStateMsg.msg
  EndEffMsg.msg
  HumanoidPropertiesMsg.msg
  MotorStateMsg.msg
  MotorPIDMsg.msg
  WalkingMsg.msg
  HeadMoveMsg.msg
  MovementMsg.msg
  LearningMsg.msg
  PerformanceMsg.msg
  HumanoidStateMsg.msg
  ImpactMsg.msg
  OpencmRequestMsg.msg
  OpencmResponseMsg.msg
  MotorRequestMsg.msg
  MotorResponseMsg.msg
  MotorDataMsg.msg
  WebotsMsg.msg
)

add_service_files(
  FILES
  DynamixelCreatorSrv.srv
  LipCmdSrv.srv
  LipCtrlSrv.srv
  LipParamsSrv.srv
  LoadMapConfigsSrv.srv
  LoadHumanoidPropertiesSrv.srv
  InterfaceSrv.srv
  MotorSetSrv.srv
  MovementSrv.srv
  OpenCm.srv
  MovementStatesSrv.srv
  PredefinedMovementSrv.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
  geometry_msgs
)

################################################################################
# Declare ROS dynamic reconfigure parameters
################################################################################

################################################################################
# Catkin specific configuration
################################################################################
catkin_package(
   CATKIN_DEPENDS message_generation std_msgs geometry_msgs dynamic_reconfigure
)

################################################################################
# Build
################################################################################
include_directories(
  ${catkin_INCLUDE_DIRS}
)

################################################################################
# Install
################################################################################


################################################################################
# Test
################################################################################
