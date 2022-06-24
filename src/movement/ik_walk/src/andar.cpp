#include "std_msgs/String.h"
#include "ros/ros.h"
#include "../include/andar.h"
/*
Andar::Andar(ros::NodeHandle nh_): nh(nh_) {
  paramsWalkSub = nh.subscribe<movement_msgs::WalkingParamsMsg>("walk_params/request",1000,&Andar::setParams, this);

}

void setParams(movement_msgs::WalkingParamsMsg::ConstPtr& request){
  //std::cout << request << " ";
  return;
}
*/
void callbackprincipal(const movement_msgs::WalkingParamsMsg::ConstPtr& request)
{    
  
  struct Rhoban::IKWalkParameters params;
  if(request->walk_on){
    params.distHipToKnee = 0.093;
    params.distKneeToAnkle = 0.105;
    params.distAnkleToGround = 0.032;
    params.distFeetLateral = 0.092;
    params.freq = 1.7;
    params.enabledGain = 1.0;
    params.supportPhaseRatio = 0.0;
    params.footYOffset = 0.025;
    params.stepGain = 0.0;
    params.riseGain = 0.035;
    params.turnGain = 0.0;
    params.lateralGain = 0.0;
    params.trunkZOffset = 0.02;
    params.swingGain = 0.02;
    params.swingRollGain = 0.0;
    params.swingPhase = 0.25;
    params.stepUpVel = 4.0;
    params.stepDownVel = 4.0;
    params.riseUpVel = 4.0;
    params.riseDownVel = 4.0;
    params.swingPause = 0.0;
    params.swingVel = 4.0;
    params.trunkXOffset = 0.02;
    params.trunkYOffset = 0.0;
    params.trunkPitch = 0.15;
    params.trunkRoll = 0.0;
    params.extraLeftX = 0.0;
    params.extraLeftY = 0.0;
    params.extraLeftZ = 0.0;
    params.extraRightX = 0.0;
    params.extraRightY = 0.0;
    params.extraRightZ = 0.0;
    params.extraLeftYaw = 0.0;
    params.extraLeftPitch = 0.0;
    params.extraLeftRoll = 0.0;
    params.extraRightYaw = 0.0;
    params.extraRightPitch = 0.0;
    params.extraRightRoll = 0.0;
    double time = 1.0;
    double phase = 2.0;
    int count = 0;
    std::cout << "Chamando função gerar parametros";
    std::cout << std::endl;
    runWalk(params,2.0, time, phase);
    
  }


}

int main(int argc, char **argv)
{
  
  ros::init(argc, argv, "andar");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("params_walk", 1000, callbackprincipal);
  
  ros::spin();

  return 0;
}
static void runWalk(const Rhoban::IKWalkParameters& params, double timeLength, double& phase, double& time)
{
  //Leg motor computed positions
  ros::Rate loop_rate(10);
  std::cout << "runWalk Chamado";
  std::cout << std::endl;
  ros::NodeHandle np;
  ros::Publisher params_pub = np.advertise<movement_msgs::MotorDatasMsg>("parametros", 1000);
  struct Rhoban::IKWalkOutputs outputs;
  ros::spinOnce();
  //Walk engine frequency
  double engineFrequency = 50.0;
  for (double t=0.0;t<=timeLength;t+=1.0/engineFrequency) {
      time += 1.0/engineFrequency;
      double temp = (1.0/engineFrequency);
      bool success = Rhoban::IKWalk::walk(params,temp,phase,outputs); 
      if (!success) {
          std::cout << time << " Inverse Kinematics error. Position not reachable." << std::endl;
          ROS_INFO(" Inverse Kinematics error. Position not reachable. : %f", time);
      } else {
          std::cout << "runWalk Gerador on";
          std::cout << std::endl;
          //std::cout << time << " Aqui mesmo";
          //std::cout << phase << " ";
          //ROS_INFO("outputs.left_hip_yaw : %f", outputs.left_hip_yaw);
          //ROS_INFO("outputs.right_ankle_roll : %f", outputs.right_ankle_roll);
        
          
          walkinRes.left_hip_yaw = outputs.left_hip_yaw;
          walkinRes.left_hip_pitch = outputs.left_hip_pitch;
          walkinRes.left_hip_roll = outputs.left_hip_roll;
          walkinRes.left_knee = outputs.left_knee;
          walkinRes.left_ankle_pitch  = outputs.left_ankle_pitch;
          walkinRes.left_ankle_roll = outputs.left_ankle_roll;
          walkinRes.right_hip_yaw = outputs.right_hip_yaw;
          walkinRes.right_hip_pitch = outputs.right_hip_pitch;
          walkinRes.right_hip_roll = outputs.right_hip_roll;
          walkinRes.right_knee = outputs.right_knee;
          walkinRes.right_ankle_pitch = outputs.right_ankle_pitch;
          walkinRes.right_ankle_roll = outputs.right_ankle_roll;
          params_pub.publish(walkinRes); 
          ros::spinOnce();       
          loop_rate.sleep();
      }
      params_pub.publish(walkinRes); 
      ros::spin();
  }
}
