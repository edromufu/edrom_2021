#ifndef ENUMS_H
#define ENUMS_H

enum MAP_TYPES       {JOINT_BODY,ROBOT_IDS,URDF_IDS,IK_IDS,ROBOT_DIR,URDF_DIR,IK_DIR, ROBOT_OFFSET,URDF_OFFSET,IK_OFFSET,MOTOR_REF,MOTOR_CCWLIM,MOTOR_CWLIM, MAP_TYPES_SIZE};
enum JOINTS_GLOBAL   {TRUNK_ROLL,TRUNK_PITCH,TRUNK_YAW,TRUNK_X,TRUNK_Y,TRUNK_Z,HEAD0,HEAD1,LARM0,LARM1,LARM2,LLEG0,LLEG1,LLEG2,LLEG3,LLEG4,LFOOT,RARM0,RARM1,RARM2,RLEG0,RLEG1,RLEG2,RLEG3,RLEG4,RFOOT,SIZE};
enum BODY_TYPES      {LLEG,LARM,RLEG,RARM,TRUNK,HEAD,COM,WORLD_BODY,BODY_TYPES_SIZE};
enum LEG_PARAMS      {P_LEG_D0,P_LEG_D1,P_LEG_D2,P_LEG_D3,P_LEG_D4,PARAM_LEG_SIZE};
enum ARM_PARAMS      {P_ARM_D0,P_ARM_D1,P_ARM_D2,PARAM_ARM_SIZE};
enum FOOT_PARAMS     {P_FOOT_W,P_FOOT_H,P_FOOT_X,P_FOOT_Y,PARAM_FOOT_SIZE};
enum POSE_PARAMS     {P_POSE_LEG_SQUAT,P_POSE_LEG_OPEN,P_POSE_TORSO_INC,P_POSE_SIDE_INC,P_POSE_LEG_SQUAT_REF,P_POSE_LEG_OPEN_REF,P_POSE_TORSO_INC_REF,P_POSE_SIDE_INC_REF,PARAM_POSE_SIZE};
enum BODY_POINT_FLAG {BP_TOUCHING, BP_FREE};
enum MOTOR_READ_OPTS {READ_ALL,READ_PID,READ_KP,READ_KD,READ_KI,READ_POS,READ_VEL,READ_ACC,READ_POSVEL,READ_CURR,READ_TEMP,READ_ERROR};
enum POSE_SOURCES    {CONST_VEL,MOTOR_SET,MOTOR_HEAD,HUMANOID_MODEL,MOVECREATOR,NONE};

#endif // ENUMS_H

