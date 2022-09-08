#include "walk_creator.h"
#include "movement_msgs/WalkingPositionsMsg.h"

bool WalkCreator::parametersUpdateRequest(movement_msgs::WalkTestParametersSrv::Request  &req, movement_msgs::WalkTestParametersSrv::Response &res)
{
    params.freq                 = req.freq;
    params.supportPhaseRatio    = req.supportPhaseRatio;
    params.footYOffset          = req.footYOffset;
    params.riseGain             = req.riseGain;
    params.trunkZOffset         = req.trunkZOffset;
    params.swingGain            = req.swingGain;
    params.swingRollGain        = req.swingRollGain;
    params.swingPhase           = req.swingPhase;
    params.stepUpVel            = req.stepUpVel;
    params.stepDownVel          = req.stepDownVel;
    params.riseUpVel            = req.riseUpVel;
    params.riseDownVel          = req.riseDownVel;
    params.swingPause           = req.swingPause;
    params.swingVel             = req.swingVel;
    params.trunkXOffset         = req.trunkXOffset;
    params.trunkYOffset         = req.trunkYOffset;
    params.trunkPitch           = req.trunkPitch;
    params.trunkRoll            = req.trunkRoll;
    params.extraLeftX           = req.extraLeftX;
    params.extraLeftY           = req.extraLeftY;
    params.extraLeftZ           = req.extraLeftZ;
    params.extraRightX          = req.extraRightX;
    params.extraRightY          = req.extraRightY;
    params.extraRightZ          = req.extraRightZ;
    params.extraLeftYaw         = req.extraLeftYaw;
    params.extraLeftPitch       = req.extraLeftPitch;
    params.extraLeftRoll        = req.extraLeftRoll;
    params.extraRightYaw        = req.extraRightYaw;
    params.extraRightPitch      = req.extraRightPitch;
    params.extraRightRoll       = req.extraRightRoll;

    step = req.stepGain;
    lateral = req.lateralGain;
    turn = req.turnGain;
    
    res.success = true;

    return true;
}

bool WalkCreator::walkRequest(movement_msgs::WalkCreatorRequestSrv::Request  &req_params, movement_msgs::WalkCreatorRequestSrv::Response &res)
{
    params.enabledGain = req_params.enabledGain;
    params.stepGain = req_params.stepGain*step;
    params.lateralGain = req_params.lateralGain*lateral;
    params.turnGain = req_params.turnGain*turn;

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
    request_parameters_update = nh.advertiseService("/movement_interface/walking_params", &WalkCreator::parametersUpdateRequest, this);

    params.distHipToKnee = 0.093;
    params.distKneeToAnkle = 0.105;
    params.distAnkleToGround = 0.032;
    params.distFeetLateral = 0.092;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Walk_creator_node");
    ros::NodeHandle nh;
    
    WalkCreator WalkCreatorObject(nh);

    ros::spin();
    return 0;
}