#include "../include/IKWalk.hpp"
#include "ros/ros.h"
#include <iostream>
using namespace std;

static void runWalk(
    const Rhoban::IKWalkParameters& params, 
    double timeLength, 
    double& phase, 
    double& time)
{
    //Leg motor computed positions
    struct Rhoban::IKWalkOutputs outputs;
    
    //Walk engine frequency
    double engineFrequency = 50.0;

    for (double t=0.0;t<=timeLength;t+=1.0/engineFrequency) {
        time += 1.0/engineFrequency;
        bool success = Rhoban::IKWalk::walk(
            params, //Walk parameters
            1.0/engineFrequency, //Time step
            phase, //Current walk phase -will be updated)
            outputs); //Result target position (updated)
        if (!success) {
            //The requested position for left or right foot is not feasible
            //(phase is not updated)
            std::cout << time << " Inverse Kinematics error. Position not reachable." << std::endl;
        } else {
            std::cout << "[" << outputs.left_hip_yaw << ", ";
            std::cout << outputs.left_hip_pitch << ", ";
            std::cout << outputs.left_hip_roll << ", ";
            std::cout << outputs.left_knee << ", ";
            std::cout << outputs.left_ankle_pitch << ", ";
            std::cout << outputs.left_ankle_roll << ", ";
            std::cout << outputs.right_hip_yaw << ", ";
            std::cout << outputs.right_hip_pitch << ", ";
            std::cout << outputs.right_hip_roll << ", ";
            std::cout << outputs.right_knee << ", ";
            std::cout << outputs.right_ankle_pitch << ", ";
            std::cout << outputs.right_ankle_roll << "] ";
            std::cout << std::endl;
            std::cout << std::endl;
        }
    }
}

int main(){

    struct Rhoban::IKWalkParameters params;

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

    double phase = 0.0;
    double time = 0.0;

    //Walk forward
    params.enabledGain = 1.0;
    params.stepGain = 0.02;
    params.lateralGain = 0.0;
    params.turnGain = 0.0;
    
    runWalk(params, 2, phase, time);

    return 0;
}

