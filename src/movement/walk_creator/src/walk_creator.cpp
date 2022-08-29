#include "walk_creator.h"
#include "movement_msgs/WalkingPositionsMsg.h"

bool WalkCreator::walkRequest(movement_msgs::WalkCreatorRequestSrv::Request  &req_params, movement_msgs::WalkCreatorRequestSrv::Response &res)
{
    params.enabledGain = req_params.enabledGain;
    params.stepGain = req_params.stepGain*1;
    params.lateralGain = req_params.lateralGain*0.02;
    params.turnGain = req_params.turnGain*0.02;

    res.success = runWalk(params, 5.12, phase, time);

    return true;
}

bool WalkCreator::runWalk(const Rhoban::IKWalkParameters& params, double timeLength, double& phase, double& time)
{
    ros::Rate loop_rate(15.625);
    for (double t=0.0;t<=timeLength;t+=1.0/engineFrequency) {
        time += 1.0/engineFrequency;
        bool success = Rhoban::IKWalk::walk(params, 1.0/engineFrequency, phase, outputs);
        
        if (!success) {
            std::cout << time << " Inverse Kinematics error. Position not reachable." << std::endl;

            return false;
        } else {
            positions.positions = { outputs.right_hip_yaw, outputs.left_hip_yaw,
                                    outputs.right_hip_roll, outputs.left_hip_roll, 
                                    -outputs.right_hip_pitch, -outputs.left_hip_pitch,                                    
                                    -outputs.right_knee, outputs.left_knee, 
                                    outputs.right_ankle_roll, outputs.left_ankle_roll,
                                    -outputs.right_ankle_pitch, outputs.left_ankle_pitch                                    
                                  };

            walk_motor_positions_pub.publish(positions);
            loop_rate.sleep();
        }
    }

    return true;
}

WalkCreator::WalkCreator(ros::NodeHandle nh){
    walk_motor_positions_pub = nh.advertise<movement_msgs::WalkingPositionsMsg>("/walk_creator/positions", 1000);

    request_walk_creation = nh.advertiseService("/approved_movement_prep/IKWalk", &WalkCreator::walkRequest, this);

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
    params.trunkRoll = 0;
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
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Walk_creator_node");
    ros::NodeHandle nh;
    
    WalkCreator WalkCreatorObject(nh);

    ros::spin();
    return 0;
}