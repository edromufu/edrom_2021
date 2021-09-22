#include "../include/motor_set_control/motorset.h"

MotorSet::MotorSet(ros::NodeHandle nh_): nh(nh_)
{
    if (!nh.getParam("dt", dt))
        dt = 0.07; // s
    if (!nh.getParam("toRobot", toRobot))
        toRobot = true;
    if (!nh.getParam("main_movement/robot", robotName))
        robotName = "sakura"; 
        

    // Service Server Stuff
    motorSetSrv = nh.advertiseService("motor_set_control/cmd", &MotorSet::motorSetService, this);
    
    // Publisher Stuff
    jointStateTopic = nh.advertise<JointStateMsg>("humanoid_model/jointState", 1000);
    //motorCommPub = nh.advertise<MotorRequestMsg>("motor_comm/request",1000);

}

bool MotorSet::motorSetService(movement_msgs::MotorSetSrv::Request& msg, movement_msgs::MotorSetSrv::Response& res)
{
    // A implementação é a mesma, utilizasse campos diferentes na mensagem só por organização
    if (!msg.page.empty())
    {
        std::string filePath(msg.page);
        Page page(filePath);
        if (msg.toRobot){
            interpolConstVel(page, true);
        }
        else
            interpolConstVel(page, false);
    }
    if (!msg.pose.empty())
    {
        std::string filePath(msg.pose);
        Page page(filePath);
        if (msg.toRobot)
        {
            interpolConstVel(page, true);
        }
        else
            linearInterpol(page, false);
    }
    return true;
}

void MotorSet::sendPoseConstVel(Pose pose)
{
    movement_msgs::JointStateMsg  msg;
    msg.header.stamp = ros::Time::now();
    msg.pos.resize(21);
    msg.kind = "movecreator";
    msg.writeCommand = "const_velocity";

    for (unsigned int j = 0; j < 21; j++) // 21 Posições pq é assim que o humanoid_interface está definido atualmente
    {
        msg.pos[j] = pose.getJoints()[j].getPosition();
    }
    jointStateTopic.publish(msg);
    ros::Duration(3).sleep();
}

void MotorSet::linearInterpol(Page page, bool robot)
{/*
    std::vector<double> currentPose;
    std::vector<std::vector<double>> toSend;

    if (robot)
        currentPose = getCurrentPose();
    else
        currentPose.resize(21);

    if (page.getPoses().size() > 0)
    {
        for (unsigned int i = 0; i < page.getPoses().size(); i++)
        {
            int points = ceil(page.getPoses()[i].getTime() / dt);

            for (int j = 0; j < points; j++) // Novos pontos que surgem com a interpolação
            {
                std::vector<double> pose;
                for (int m = 0; m < 18; m++) // Motores do corpo
                {
                    double initial;
                    double final;
                    if (i == 0)
                        initial = currentPose[m];
                    else
                        initial = page.getPoses()[i - 1].getJoints()[m].getPosition();
                    final              = page.getPoses()[i].getJoints()[m].getPosition();
                    double dTheta      = j * (final - initial) / (points * 1.0);
                    double newPosition = initial + dTheta;
                    pose.push_back(newPosition);
                }
                toSend.push_back(pose);
            }
        }
    }
    else
    {
        ROS_INFO("INVALID PAGE");
        return;
    }

    ros::Rate rate(1.0 / dt);
    for (unsigned int i = 0; i < toSend.size(); i++)
    {
        movement_msgs::JointStateMsg msg;
        //msg.header.stamp = ros::Time::now();
        //msg.dt           = dt;
        //msg.type         = 1;
        msg.pos.resize(21);
        //msg.vel.resize(21);
        //msg.acc.resize(21);
        //msg.torq.resize(21);
        msg.kind = "movecreator";
        msg.writeCommand = "teste1";
        for (unsigned int j = 0; j < 21; j++) // 21 Posições pq é assim que o humanoid_interface está definido atualmente
        {
            if (j < 18) // Motores do corpo
            {
                double newPosition = toSend[i][j];
                msg.pos[j]         = newPosition;
            }
            else
            {
                msg.pos[j] = 0;
            }
        }
        jointStateTopic.publish(msg);

        rate.sleep();
    }*/
}

void MotorSet::interpolConstVel(Page page, bool robot)
{
    std::vector<std::vector<double>> toSend;
    if (page.getPoses().size() < 1)
        sendPoseConstVel(page.getPoses()[0]);

    if (page.getPoses().size() > 1)
    {
        for (unsigned int i = 0; i < page.getPoses().size() - 1; i++)
        {
            int points = ceil(page.getPoses()[i].getTime() / dt);

            for (int j = 0; j < points; j++) // Novos pontos que surgem com a interpolação
            {
                std::vector<double> pose;
                for (int m = 0; m < 18; m++) // Motores do corpo
                {
                    double initial = page.getPoses()[i].getJoints()[m].getPosition();
                    double finalPos = page.getPoses()[i + 1].getJoints()[m].getPosition();              
                    double dTheta      = j * (finalPos - initial) / (points * 1.0);
                    double newPosition = initial + dTheta;
                    pose.push_back(newPosition);
                }
                toSend.push_back(pose);
            }
        }
    }

    ros::Rate rate(1.0 / dt);
    for (unsigned int i = 0; i < toSend.size(); i++)
    {
        movement_msgs::JointStateMsg msg;
        msg.header.stamp = ros::Time::now();
        //msg.dt           = dt;
        //msg.type         = 1;
        msg.pos.resize(21);
        msg.kind = "movecreator";
        msg.writeCommand = "position_velocity";
        for (unsigned int j = 0; j < 21; j++) // 21 Posições pq é assim que o humanoid_interface está definido atualmente
        {
            if (j < 18) // Motores do corpo
            {
                double newPosition = toSend[i][j];
                msg.pos[j]         = newPosition;
            }
            else // Motores Cabeca
            {
                msg.pos[j] = 0;
            }
            if (toSend.size() - 1 == i)
            {
                msg.readCommand = "Last_Page";
            }
        }
        jointStateTopic.publish(msg);

        rate.sleep();
    }
}