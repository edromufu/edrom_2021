#include "humanoid_interface/HumanoidInterface.h"

HumanoidInterface::HumanoidInterface(ros::NodeHandle nh_, ros::NodeHandle nh_private_)
    : nh(nh_)
    , nh_private(nh_private_)
{

    // Service Server Stuff
    interfaceSrv = nh.advertiseService("humanoid_interface/cmd", &HumanoidInterface::interfaceService, this);

    // Dynamic Reconfigure Server
    config_server.reset(new HumanoidInterfaceConfigServer(nh_private));
    HumanoidInterfaceConfigServer::CallbackType f = boost::bind(&HumanoidInterface::reconfigCallback, this, _1, _2);
    config_server->setCallback(f); /**/

    if (!nh_private.getParam("dt", dt))
        dt = 0.07;
    if (!nh_private.getParam("robotPID", robotPID))
        robotPID = 0.07;
    if (!nh_private.getParam("gazeboPID", gazeboPID))
        gazeboPID = 0.07;
    if (!nh_private.getParam("toGazebo", toGazebo))
        toGazebo = false;
    if (!nh_private.getParam("toRobot", toRobot))
        toRobot = true;
    if (!nh_private.getParam("send2Motor", send2Motor))
        send2Motor = true;
    if (!nh_private.getParam("readMotor", readMotor))
        readMotor = true;
    if (!nh_private.getParam("pingAll", pingAll))
    {
        pingAll  = false;
        pingScan = false;
    }
    if (!nh_private.getParam("testDT", testDT))
        testDT = false;

    readParam = 0;

    // Service Stuff
    mapCli = nh.serviceClient<movement_msgs::LoadMapConfigsSrv>("humanoid_loadmap/load");

    // Publisher Stuff
    motorStateTopic = nh.advertise<movement_msgs::MotorStateMsg>("humanoid_interface/motorState", 1000);
    motorPIDTopic   = nh.advertise<movement_msgs::MotorPIDMsg>("humanoid_interface/get_motorPID", 1000);
    jointStateTopic = nh.advertise<movement_msgs::JointStateMsg>("humanoid_interface/get_jointState", 1000);

    // Subscriber Stuff
    jointStateSubPtr.reset(new JointStateSub(nh, "humanoid_model/jointState", 1));
    jointStateSubPtr->registerCallback(&HumanoidInterface::jointStateCallback, this);

    jointHeadStateSubPtr.reset(new JointStateSub(nh, "humanoid_model/jointHeadState", 1));
    jointHeadStateSubPtr->registerCallback(&HumanoidInterface::jointHeadStateCallback, this);

    motorPIDSubPtr.reset(new MotorPIDSub(nh, "humanoid_interface/set_motorPID", 1));
    motorPIDSubPtr->registerCallback(&HumanoidInterface::motorPIDCallback, this);

    if (toGazebo)
    {
        jointStateGazeboSubPtr.reset(new JointStateGazeboSub(nh, "/SAKURA/joint_position_controller/state", 1));
        jointStateGazeboSubPtr->registerCallback(&HumanoidInterface::jointStateGazeboCallback, this);
    }

    loadMap();

    if (toGazebo)
    {
        // Action stuff
        // tell the action client that we want to spin a thread by default
        trj_client = new actionlib::SimpleActionClient<control_msgs::FollowJointTrajectoryAction>("/SAKURA/joint_position_controller/follow_joint_trajectory/", true);

        // wait for action server to come up
        while (!trj_client->waitForServer(ros::Duration(5.0)))
            ROS_WARN("[HUMANOID_INTERFACE] Waiting for the joint_trajectory_action server");
        initActionSettings();
        readFromGazebo(READ_PID);
        readFromGazebo(READ_POS);
    }
    count = 0;
    if (toRobot)
    {
        // Protocol 2.0
        // Load Paramameter For Connection
        dynamixel_info_scan_ = new dynamixel_driver::DynamixelInfo;

        dynamixel_info_scan_->lode_info.device_name      = std::string("/dev/ttyUSB0");
        dynamixel_info_scan_->lode_info.baud_rate        = 1000000;
        dynamixel_info_scan_->lode_info.protocol_version = 2.0;

        ROS_INFO("[HUMANOID_INTERFACE] DEVICE: %s  BAUD: %d  PROTOCOL: %f", dynamixel_info_scan_->lode_info.device_name.c_str(), dynamixel_info_scan_->lode_info.baud_rate,
            dynamixel_info_scan_->lode_info.protocol_version);

        dynamixel_driver_ = new dynamixel_driver::DynamixelDriver(
            dynamixel_info_scan_->lode_info.device_name, dynamixel_info_scan_->lode_info.baud_rate, dynamixel_info_scan_->lode_info.protocol_version);
        
        ids = scanDynamixel();
        for (size_t i = 0; i < 10; i++)
        {
            if (ids.size() >= 18)
            {
                break;
            }
            else
            {
                ROS_INFO("NEW SCAN");
                std::vector<int> newScan = scanDynamixel();
                if(newScan.size() > ids.size())
                    ids = newScan;
                ros::Duration(0.5);
            }
        }
        
        if (ids.empty())
            ROS_ERROR("NO MOTORS DETECTED: PLEASE CHECK CONNECTION");

        if (loadDynamixel())
        {
            ROS_INFO("[HUMANOID_INTERFACE] DYNAMIXELS WERE LOADED");
        }
        setTorque(false);
        setOperatingMode(3);
        setShutdown(52);
        setTorque(true);

        // setReturnLevel(1);

        ROS_INFO("[HUMANOID_INTERFACE] FOUND MOTORS:");
        if (!dynamixel_info_.empty())
        {
            ROS_INFO("[HUMANOID_INTERFACE] PROTOCOL 2.0: %d", int(dynamixel_info_.size()));
            for (int i = 0; i < int(dynamixel_info_.size()); ++i)
            {
                ROS_INFO("[HUMANOID_INTERFACE] ID: %d DEVICE: %s  BAUD: %d  PROTOCOL: %f", dynamixel_info_[i]->model_id, dynamixel_info_[i]->lode_info.device_name.c_str(),
                    dynamixel_info_[i]->lode_info.baud_rate, dynamixel_info_[i]->lode_info.protocol_version);
            }
        }
        for (int i = 0; i < robotDOF; i++)
        {
            motorPID.kp.push_back(850);
            motorPID.kd.push_back(0);
            motorPID.ki.push_back(0);
        }
    }
    // Run Callback
    runTimer  = nh.createTimer(ros::Duration(dt), &HumanoidInterface::runCallBack, this);
    firstCmd  = true;
    updatePID = false;

    fell = false;
}

HumanoidInterface::~HumanoidInterface()
{
}

void HumanoidInterface::reconfigCallback(movement_msgs::HumanoidInterfaceConfig& config, uint32_t level)
{
    boost::mutex::scoped_lock lock(mutex);
    toRobot    = config.toRobot;
    toGazebo   = config.toGazebo;
    send2Motor = config.send2Motor;
    readMotor  = config.readMotor;
    readParam  = config.readParam;

    if (pingAll != config.pingAll)
        pingScan = true;
    pingAll = config.pingAll;
    testDT  = config.testDT;

    dt = config.dt;
    runTimer.setPeriod(ros::Duration(dt));
}

std::vector<int> HumanoidInterface::scanDynamixel()
{
    inversePorts = false;
    // Procura ate o ID 30
    std::vector<int> idVec;
    int p = dynamixel_driver_->scan(idVec, 30);
    // ROS_WARN("[HUMANOID_INTERFACE] MOTOR: %d", p);
    // ROS_INFO("[HUMANOID_INTERFACE] PROTOCOL 2.0");
    for (int i = 0; i < p; i++)
    {
        ROS_INFO("[HUMANOID_INTERFACE] FOUND ID: %d", idVec[i]);
    }
    return idVec;
}

void HumanoidInterface::clearDynamixelDriver()
{
    if (multi_driver_read_ != NULL)
        delete multi_driver_read_;
    if (multi_driver_ != NULL)
        delete multi_driver_;
    if (writeValue_ != NULL)
        delete writeValue_;
    dynamixel_info_read_.clear();
    dynamixel_info_.clear();
}

bool HumanoidInterface::loadDynamixel()
{
    multi_driver_read_ = NULL;
    multi_driver_      = NULL;
    dynamixel_info_.clear();
    dynamixel_info_read_.clear();
    bool ret = true;
    for (int i = 0; i < int(ids.size()); ++i)
    {
        dynamixel_driver::DynamixelInfo* motor_info_ = new dynamixel_driver::DynamixelInfo;
        motor_info_->lode_info.device_name           = std::string("/dev/ttyUSB0");
        motor_info_->lode_info.baud_rate             = 1000000;
        motor_info_->lode_info.protocol_version      = 2.0;
        motor_info_->model_id                        = ids[i];
        // if(ids[i] == 12 || ids[i] == 13)
        if (ids[i] > 8)
        {
            dynamixel_info_read_.push_back(motor_info_);
        }
        dynamixel_info_.push_back(motor_info_);
    }
    if (!dynamixel_info_.empty())
    {
        multi_driver_ = new dynamixel_multi_driver::DynamixelMultiDriver(
            dynamixel_info_[0]->lode_info.device_name, dynamixel_info_[0]->lode_info.baud_rate, dynamixel_info_[0]->lode_info.protocol_version);
        ret *= multi_driver_->loadDynamixel(dynamixel_info_);
        // FIXME: Aqui é o ponto em que o Interface morre
        if (!multi_driver_->initSyncWrite())
            ROS_ERROR("[HUMANOID_INTERFACE] PROTOCOL 2.0: Init SyncWrite Failed!");
    }
    if (!dynamixel_info_read_.empty())
    {
        multi_driver_read_ = new dynamixel_multi_driver::DynamixelMultiDriver(
            dynamixel_info_read_[0]->lode_info.device_name, dynamixel_info_read_[0]->lode_info.baud_rate, dynamixel_info_read_[0]->lode_info.protocol_version);
        ret *= multi_driver_read_->loadDynamixel(dynamixel_info_read_);
    }
    writeValue_ = new WriteValue;

    return ret;
}

bool HumanoidInterface::setTorque(bool onoff)
{
    writeValue_->torque.clear();
    for (int i = 0; i < int(ids.size()); ++i)
    {
        writeValue_->torque.push_back(onoff);
    }
    if (!writeValue_->torque.empty())
    {
        if (!multi_driver_->syncWriteTorque(writeValue_->torque))
        {
            ROS_ERROR("[HUMANOID_INTERFACE] PROTOCOL 2.0: SyncWrite Torque Failed!");
            return false;
        }
    }

    return true;
}

bool HumanoidInterface::setTorque(std::vector<bool> onoff)
{
    writeValue_->torque.clear();

    for (int i = 0; i < int(ids.size()); ++i)
    {
        writeValue_->torque.push_back(onoff[i]);
    }

    if (!writeValue_->torque.empty())
    {
        if (!multi_driver_->syncWriteTorque(writeValue_->torque))
        {
            ROS_ERROR("[HUMANOID_INTERFACE] PROTOCOL 2.0: SyncWrite Torque Failed!");
            return false;
        }
    }

    return true;
}

bool HumanoidInterface::setReturnLevel(unsigned int level)
{
    writeValue_->returnLevel.clear();
    for (int i = 0; i < int(ids.size()); ++i)
    {
        writeValue_->returnLevel.push_back(level);
    }
    if (!writeValue_->returnLevel.empty())
    {
        if (!multi_driver_->syncWriteReturnLevel(writeValue_->returnLevel))
        {
            ROS_ERROR("[HUMANOID_INTERFACE] PROTOCOL 2.0: SyncWrite Return Level Failed!");
            return false;
        }
    }

    return true;
}

bool HumanoidInterface::setOperatingMode(unsigned int mode)
{
    writeValue_->operMode.clear();

    for (int i = 0; i < int(ids.size()); ++i)
    {
        writeValue_->operMode.push_back(mode);
    }

    if (!writeValue_->operMode.empty())
    {
        if (!multi_driver_->syncWriteOperatingMode(writeValue_->operMode))
        {
            ROS_ERROR("[HUMANOID_INTERFACE] PROTOCOL 2.0: SyncWrite Return Level Failed!");
            return false;
        }
    }

    return true;
}

bool HumanoidInterface::setShutdown(unsigned int mode)
{
    writeValue_->shutdown.clear();

    for (int i = 0; i < int(ids.size()); ++i)
    {
        writeValue_->shutdown.push_back(mode);
    }
    if (!writeValue_->shutdown.empty())
    {
        if (!multi_driver_->syncWriteShutdown(writeValue_->shutdown))
        {
            ROS_ERROR("[HUMANOID_INTERFACE] PROTOCOL 2.0: SyncWrite Shutdown Failed!");
            return false;
        }
    }
    return true;
}

void HumanoidInterface::runCallBack(const ros::TimerEvent&)
{
    if (toGazebo)
    {
        if (send2Motor)
        {
            if (!jointState.pos.empty())
            {
                if (!jointHeadState.pos.empty())
                {
                    jointState.pos[map.map(HEAD0, ROBOT_IDS)] = jointHeadState.pos[map.map(HEAD0, ROBOT_IDS)];
                    jointState.pos[map.map(HEAD1, ROBOT_IDS)] = jointHeadState.pos[map.map(HEAD1, ROBOT_IDS)];
                    jointState.vel[map.map(HEAD0, ROBOT_IDS)] = jointHeadState.vel[map.map(HEAD0, ROBOT_IDS)];
                    jointState.vel[map.map(HEAD1, ROBOT_IDS)] = jointHeadState.vel[map.map(HEAD1, ROBOT_IDS)];
                }
                send2Gazebo(jointState, dt);
            }
        }
        if (updatePID)
        {
            updateGazeboPID(motorPID);
            motorPIDTopic.publish(motorPID);
            updatePID = false;
        }
        if (readMotor)
        {
            switch (readParam)
            {
                case 0:
                    readFromGazebo(READ_POS);
                    break;
                case 1:
                    readFromGazebo(READ_VEL);
                    break;
                case 2:
                    readFromGazebo(READ_CURR);
                    break;
                case 3:
                    readFromGazebo(READ_TEMP);
                    break;
                case 4:
                    readFromGazebo(READ_CURR);
                    readFromGazebo(READ_TEMP);
                    break;
                case 5:
                    readFromGazebo(READ_ERROR);
                    break;
                default:
                    break;
            }
        }
    }
    if (toRobot)
    {
        if (testDT)
            lasttime = ros::Time::now();

        switch (jointState.source)
        {
            case MOTOR_HEAD:
                jointState.pos[map.map(HEAD0, ROBOT_IDS)] = jointHeadState.pos[map.map(HEAD0, ROBOT_IDS)];
                jointState.pos[map.map(HEAD1, ROBOT_IDS)] = jointHeadState.pos[map.map(HEAD1, ROBOT_IDS)];
                break;
            default:
                break;
        }
        if (send2Motor)
        {
            // setTorque(true);
            if (!jointStateOld.pos.empty() && !jointState.pos.empty())
            {
                if (!jointHeadState.pos.empty())
                {
                    jointState.pos[map.map(HEAD0, ROBOT_IDS)] = jointHeadState.pos[map.map(HEAD0, ROBOT_IDS)];
                    jointState.pos[map.map(HEAD1, ROBOT_IDS)] = jointHeadState.pos[map.map(HEAD1, ROBOT_IDS)];
                    jointState.vel[map.map(HEAD0, ROBOT_IDS)] = jointHeadState.vel[map.map(HEAD0, ROBOT_IDS)];
                    jointState.vel[map.map(HEAD1, ROBOT_IDS)] = jointHeadState.vel[map.map(HEAD1, ROBOT_IDS)];
                }
                if (firstCmd)
                {
                    jointState.source = CONST_VEL;
                    for (int i = 0; i < int(jointState.vel.size()); i++)
                    {
                        jointState.vel[i] = 0.3;
                    }
                    jointState.dt = 3;
                    firstCmd      = false;
                }
                send2Robot(jointStateMsg2Motor(map.map, jointStateOld, jointState, dt), dt);
                if (jointState.source == CONST_VEL)
                    ros::Duration(jointState.dt).sleep();
            }
        }
        if (readMotor)
        {
            switch (readParam)
            {
                case 0:
                    readFromRobot(READ_POS);
                    break;
                case 1:
                    readFromRobot(READ_VEL);
                    break;
                case 2:
                    readFromRobot(READ_CURR);
                    break;
                case 3:
                    readFromRobot(READ_TEMP);
                    break;
                case 4:
                    readFromRobot(READ_CURR);
                    readFromRobot(READ_TEMP);
                    break;
                case 5:
                    readFromRobot(READ_ERROR);
                    break;
                default:
                    break;
            }
        }
        if (updatePID)
        {
            updateRobotPID(motorPID);
            // updateRobotP(20);
            motorPIDTopic.publish(motorPID);
            updatePID = false;
        }
        /*  if(pingScan)
         {
             ROS_WARN("[HUMANOID_INTERFACE] PING SCAN");
             if(toRobot)
             {
                 ids = scanDynamixel();
                 clearDynamixelDriver();
                 if(loadDynamixel())
                 {
                     ROS_WARN("[HUMANOID_INTERFACE] DYNAMIXELS WERE RELOADED");
                     ROS_WARN("[HUMANOID_INTERFACE] DOFS: %3d",int(dynamixel_info_.size()));
                 }
             }
             setTorque(true);
             pingScan = false;
         } */
        if (testDT)
        {
            currtime           = ros::Time::now();
            ros::Duration diff = currtime - lasttime;
            double diffD       = diff.toSec();
            if (diffD > dt)
                ROS_INFO("[HUMANOID_INTERFACE] TIME DIFF: %4.6f", diffD);
            else
                ROS_INFO("[HUMANOID_INTERFACE] TIME DIFF: %4.6f", diffD);
        }
    }
}

void HumanoidInterface::loadMap()
{
    mapMsg.request.update = false;
    if (mapCli.call(mapMsg))
    {
        int h                 = mapMsg.response.idMap.map.layout.dim[0].size;
        int w                 = mapMsg.response.idMap.map.layout.dim[1].size;
        std::vector<int> data = mapMsg.response.idMap.map.data;
        Eigen::Map<Eigen::MatrixXi> mat(data.data(), h, w);
        map.map = mat;
        for (int i = 0; i < int(mapMsg.response.idMap.jNames.size()); i++)
        {
            map.enumMap.insert(std::make_pair(mapMsg.response.idMap.jNames[i], i));
        }
        robotDOF = mapMsg.response.idMap.robotDOF;
        urdfDOF  = mapMsg.response.idMap.urdfDOF;
        ikDOF    = mapMsg.response.idMap.ikDOF;
        // map.print();
        ROS_INFO("[HUMANOID_INTERFACE] ROBOT_DOF: %d  URDF_DOF: %d  IK_DOF: %d", robotDOF, urdfDOF, ikDOF);
    }
}

void HumanoidInterface::initActionSettings()
{
    // Init name maps
    goal.trajectory.joint_names.clear();

    goal.trajectory.joint_names.push_back("J_RARM0");
    goal.trajectory.joint_names.push_back("J_LARM0");
    goal.trajectory.joint_names.push_back("J_RARM1");
    goal.trajectory.joint_names.push_back("J_LARM1");
    goal.trajectory.joint_names.push_back("J_RARM2");
    goal.trajectory.joint_names.push_back("J_LARM2");
    goal.trajectory.joint_names.push_back("J_RLEG0");
    goal.trajectory.joint_names.push_back("J_LLEG0");

    goal.trajectory.joint_names.push_back("J_RLEG1");
    goal.trajectory.joint_names.push_back("J_LLEG1");
    goal.trajectory.joint_names.push_back("J_RLEG2");
    goal.trajectory.joint_names.push_back("J_LLEG2");
    goal.trajectory.joint_names.push_back("J_RLEG3");
    goal.trajectory.joint_names.push_back("J_LLEG3");
    goal.trajectory.joint_names.push_back("J_RFOOT");
    goal.trajectory.joint_names.push_back("J_LFOOT");
    goal.trajectory.joint_names.push_back("J_RLEG4");
    goal.trajectory.joint_names.push_back("J_LLEG4");

    goal.trajectory.joint_names.push_back("J_HEAD0");
    goal.trajectory.joint_names.push_back("J_HEAD1");

    goal.trajectory.points.resize(1);
    goal.trajectory.points[0].positions.resize(20);
    goal.trajectory.points[0].velocities.resize(20);
    for (int i = 0; i < 20; i++)
    {
        goal.trajectory.points[0].positions[i]  = 0;
        goal.trajectory.points[0].velocities[i] = 0;
    }
    goal.trajectory.points[0].time_from_start = ros::Duration(dt);
}

void HumanoidInterface::updateGazeboPID(const MotorPIDMsg& motorPID)
{
    // Dynamic Reconfigure
    for (int i = 0; i < int(goal.trajectory.joint_names.size()); i++)
    {
        conf.doubles.clear();
        double_param.name  = "p";
        double_param.value = motorPID.kp[i];
        conf.doubles.push_back(double_param);
        double_param.name  = "d";
        double_param.value = motorPID.kd[i];
        conf.doubles.push_back(double_param);
        double_param.name  = "i";
        double_param.value = motorPID.ki[i];
        conf.doubles.push_back(double_param);
        srv_req.config = conf;
        std::string str;
        str = "/SAKURA/joint_position_controller/gains/" + goal.trajectory.joint_names[i] + "/set_parameters";
        // std::cout << str << std::endl;
        // std::cout << "KP: " << motorPID.kp[i] << std::endl;
        ros::service::call(str, srv_req, srv_resp);
    }
}
void HumanoidInterface::updateRobotPID(const MotorPIDMsg& motorPID)
{
    writeValue_->kp.clear();

    for (int i = 0; i < int(ids.size()); i++)
    {
        int id = ids[i];
        writeValue_->kp.push_back(motorPID.kp[id]);
    }
    if (!writeValue_->kp.empty())
    {
        if (!multi_driver_->syncWriteKpPositionGain(writeValue_->kp))
        {
            ROS_ERROR("[HUMANOID_INTERFACE] PROTOCOL 2.0: SyncWrite KpPositionGain Failed!");
        }
    }
}

void HumanoidInterface::updateRobotP(const double kp)
{
    writeValue_->kp.clear();

    for (int i = 0; i < int(ids.size()); i++)
    {
        writeValue_->kp.push_back(kp);
    }
    if (!writeValue_->kp.empty())
    {
        if (!multi_driver_->syncWriteKpPositionGain(writeValue_->kp))
        {
            ROS_ERROR("[HUMANOID_INTERFACE] PROTOCOL 2.0: SyncWrite KpPositionGain Failed!");
        }
    }
}

void HumanoidInterface::send2Gazebo(const JointStateMsg& qState, const double& dt)
{
    for (int i = 0; i < 20; i++)
    {
        goal.trajectory.points[0].positions[i]  = qState.pos[i];
        goal.trajectory.points[0].velocities[i] = 0; //<--------
    }

    goal.trajectory.points[0].time_from_start = ros::Duration(dt);
    goal.trajectory.header.stamp              = ros::Time::now();
    trj_client->sendGoal(goal);
}

movement_msgs::JointStateMsg HumanoidInterface::jointStateMsg2Motor(const Eigen::MatrixXi& map, const JointStateMsg& q0, const JointStateMsg& q1, double dt)
{
    JointStateMsg q = q1;
    double deltaPos = 0;

    for (int i = 0; i < int(map.rows()); i++)
    {
        int index = map(i, ROBOT_IDS);
        if (index != -1)
        {
            int offset      = map(i, ROBOT_OFFSET);
            int motorRef    = map(i, MOTOR_REF);
            int motorCCWLim = map(i, MOTOR_CCWLIM);
            int motorCWLim  = map(i, MOTOR_CWLIM);

            double rad2motor    = 651.74;
            double radvel2motor = 83.72;
            // getRad2MotorConv(index,rad2motor,radvel2motor);
            if (index != map(HEAD0, ROBOT_IDS) && index != map(HEAD1, ROBOT_IDS))
            {
                q.pos[index] = (q1.pos[index] + offset) * rad2motor + motorRef;
                deltaPos     = MathUtils::absf(q1.pos[index] - q0.pos[index]);
                q.vel[index] = radvel2motor * ((deltaPos) / (dt)) + 1;
            }
            else
            {
                q.pos[index] = (q1.pos[index] + offset) * rad2motor + motorRef;
                q.vel[index] = q1.vel[index] * radvel2motor + 1;
                q.acc[index] = 0;
            }
            if (q.source == CONST_VEL)
                q.vel[index] = q1.vel[index] * radvel2motor + 1;
            if (q.pos[index] >= motorCCWLim || q.pos[index] <= motorCWLim)
            {
                /* ROS_WARN("[HUMANOID_MODEL] MOTOR POSITION OUT OF RANGE");
                ROS_WARN("[HUMANOID_MODEL]     i: %d", i);
                ROS_WARN("[HUMANOID_MODEL]     MAP_ROWS: %d", int(map.rows()));
                ROS_WARN("[HUMANOID_MODEL]     ID: %d", index);
                ROS_WARN("[HUMANOID_MODEL]     POSITION: : %f", q.pos[index]);
                ROS_WARN("[HUMANOID_MODEL]     LIMITS: : CW: %d   CCW: %d", motorCWLim, motorCCWLim);
                ROS_WARN("[HUMANOID_MODEL] ______________________________"); */
            }
            if (q.vel[index] >= 500 && q.vel[index] <= 0)
            {
                ROS_WARN("[HUMANOID_MODEL] MOTOR VELOCITY > 500");
                ROS_WARN("[HUMANOID_MODEL] MOTOR VELOCITY SET TO 500");
                q.vel[index] = 500;
            }
        }
    }
    return q;
}

movement_msgs::JointStateMsg HumanoidInterface::motor2JointState(const Eigen::MatrixXi& map, const JointStateMsg& qMotor)
{
    JointStateMsg qJoint = qMotor;
    for (int i = 0; i < int(map.rows()); i++)
    {
        int index = map(i, ROBOT_IDS);
        if (index != -1)
        {
            int offset       = map(i, ROBOT_OFFSET);
            int motorRef     = map(i, MOTOR_REF);
            double rad2motor = 651.74;
            // getRad2MotorConv(index,rad2motor,radvel2motor);
            qJoint.pos[index] = (qMotor.pos[index] - motorRef) * (1. / rad2motor) - offset;
        }
    }
    return qJoint;
}

bool HumanoidInterface::send2Robot(const JointStateMsg& qState, const double& dt)
{
    writeValue_->pos.clear();
    writeValue_->prof_vel.clear();
    writeValue_->prof_acc.clear();

    for (int i = 0; i < int(ids.size()); i++)
    {
        int id = ids[i];
        writeValue_->pos.push_back(uint32_t(qState.pos[id]));
        writeValue_->prof_vel.push_back(uint32_t(qState.vel[id]));
        writeValue_->prof_acc.push_back(uint32_t(qState.acc[id]));
    }
    if (!writeValue_->pos.empty())
    {
        if (!multi_driver_->syncWritePosVel2(writeValue_->pos, writeValue_->prof_vel))
        {
            ROS_ERROR("[HUMANOID_INTERFACE] PROTOCOL 2.0: SyncWrite Position/Velocity/Acceleration Failed!");
            return false;
        }
    }
    return true;
}

void HumanoidInterface::jointStateGazeboCallback(const control_msgs::JointTrajectoryControllerStatePtr& msg)
{
    this->jointStateGazeboMsg = *msg;
}

void HumanoidInterface::readFromGazebo(int option, bool publish)
{
    switch (option)
    {
        case READ_ALL:

            break;
        case READ_PID:
            motorPIDMsg.kp.resize(goal.trajectory.joint_names.size());
            motorPIDMsg.ki.resize(goal.trajectory.joint_names.size());
            motorPIDMsg.kd.resize(goal.trajectory.joint_names.size());
            for (int i = 0; i < int(goal.trajectory.joint_names.size()); i++)
            {
                std::string str   = "/SAKURA/joint_position_controller/gains/" + goal.trajectory.joint_names[i] + "/p";
                motorPIDMsg.kp[i] = nh.param<double>(str, 0);
                str               = "/SAKURA/joint_position_controller/gains/" + goal.trajectory.joint_names[i] + "/i";
                motorPIDMsg.ki[i] = nh.param<double>(str, 0);
                str               = "/SAKURA/joint_position_controller/gains/" + goal.trajectory.joint_names[i] + "/d";
                motorPIDMsg.kd[i] = nh.param<double>(str, 0);
                std::cout << str << std::endl;
                std::cout << "Kp: " << motorPIDMsg.kp[i] << " Ki: " << motorPIDMsg.ki[i] << " Kd: " << motorPIDMsg.kd[i] << std::endl;
            }
            if (publish)
                motorPIDTopic.publish(motorPIDMsg);

        case READ_POS:
            jointReadState.header.stamp = ros::Time::now();
            jointReadState.pos.resize(robotDOF);
            jointReadState.vel.resize(robotDOF);
            jointReadState.acc.resize(robotDOF);
            jointReadState.torq.resize(robotDOF);
            jointReadState.pos = jointStateGazeboMsg.actual.positions;
            if (publish)
                jointStateTopic.publish(jointReadState);
            break;
        default:
            break;
    }
}
void HumanoidInterface::readFromRobot(int option, bool publish)
{

    switch (option)
    {
        case READ_ALL:
            break;
        case READ_PID:
            motorPIDMsg.kp.resize(robotDOF);
            motorPIDMsg.ki.resize(robotDOF);
            motorPIDMsg.kd.resize(robotDOF);
            if (!dynamixel_info_read_.empty())
            {
                multi_driver_read_->readMultiRegister("position_p_gain");
                multi_driver_read_->readMultiRegister("position_i_gain");
                multi_driver_read_->readMultiRegister("position_d_gain");
                for (std::vector<dynamixel_tool::DynamixelTool*>::size_type num = 0; num < multi_driver_read_->multi_dynamixel_.size(); ++num)
                {
                    int id             = int(multi_driver_read_->multi_dynamixel_[num]->id_);
                    motorPIDMsg.kp[id] = multi_driver_read_->read_value_["position_p_gain"]->at(num);
                    motorPIDMsg.ki[id] = multi_driver_read_->read_value_["position_i_gain"]->at(num);
                    motorPIDMsg.kd[id] = multi_driver_read_->read_value_["position_d_gain"]->at(num);
                    // ROS_WARN("PID SIZE: %d  ID READ: %d  KP: %d",int(motorPIDMsg.kp.size()), id,int(motorPIDMsg.kp[id]));
                }
            }
            if (publish)
                motorPIDTopic.publish(motorPIDMsg);
            // ROS_WARN("DONE");
        case READ_POS:
            jointReadState.header.stamp = ros::Time::now();
            jointReadState.pos.resize(robotDOF);
            jointReadState.vel.resize(robotDOF);
            jointReadState.acc.resize(robotDOF);
            jointReadState.torq.resize(robotDOF);

            if (!dynamixel_info_.empty())
            {
                multi_driver_->readMultiRegister("present_position");
                for (std::vector<dynamixel_tool::DynamixelTool*>::size_type num = 0; num < multi_driver_->multi_dynamixel_.size(); ++num)
                {
                    int id                 = int(multi_driver_->multi_dynamixel_[num]->id_);
                    jointReadState.pos[id] = multi_driver_->read_value_["present_position"]->at(num);
                    // ROS_WARN("POS SIZE: %d  ID READ: %d  POS: %d",int(motorPIDMsg.kp.size()), id,int(jointReadState.pos[id]));
                }
            }
            if (publish)
                jointStateTopic.publish(motor2JointState(map.map, jointReadState));
            // if(publish)  jointStateTopic.publish(jointReadState);
            // ROS_WARN("DONE");
            break;
        case READ_CURR:
            jointReadState.header.stamp = ros::Time::now();
            jointReadState.torq.resize(robotDOF);
            if (!dynamixel_info_read_.empty())
            {
                multi_driver_read_->readMultiRegister("present_current");
                for (std::vector<dynamixel_tool::DynamixelTool*>::size_type num = 0; num < multi_driver_read_->multi_dynamixel_.size(); ++num)
                {
                    int id                  = int(multi_driver_read_->multi_dynamixel_[num]->id_);
                    jointReadState.torq[id] = multi_driver_read_->read_value_["present_current"]->at(num) * 0.00336;
                }
            }
            if (publish)
                jointStateTopic.publish(jointReadState);

            break;

        case READ_TEMP:
            motorStateMsg.header.stamp = ros::Time::now();
            motorStateMsg.temp.resize(robotDOF);
            if (!dynamixel_info_read_.empty())
            {
                multi_driver_read_->readMultiRegister("present_temperature");
                for (std::vector<dynamixel_tool::DynamixelTool*>::size_type num = 0; num < multi_driver_read_->multi_dynamixel_.size(); ++num)
                {
                    int id                 = int(multi_driver_read_->multi_dynamixel_[num]->id_);
                    motorStateMsg.temp[id] = multi_driver_read_->read_value_["present_temperature"]->at(num);
                }
            }
            if (publish)
                motorStateTopic.publish(motorStateMsg);

            break;
        case READ_ERROR:
            motorStateMsg.header.stamp = ros::Time::now();
            motorStateMsg.error.resize(robotDOF);
            if (!dynamixel_info_read_.empty())
            {
                multi_driver_read_->readMultiRegister("hardware_error_status");
                for (std::vector<dynamixel_tool::DynamixelTool*>::size_type num = 0; num < multi_driver_read_->multi_dynamixel_.size(); ++num)
                {
                    int id                  = int(multi_driver_read_->multi_dynamixel_[num]->id_);
                    motorStateMsg.error[id] = multi_driver_read_->read_value_["hardware_error_status"]->at(num);
                }
            }
            if (publish)
                motorStateTopic.publish(motorStateMsg);

            break;
        default:
            break;
    }
}

void HumanoidInterface::jointStateCallback(const movement_msgs::JointStateMsgPtr& jointState)
{
    this->jointStateOld = this->jointState;
    this->jointState    = *jointState;
}

void HumanoidInterface::jointHeadStateCallback(const movement_msgs::JointStateMsgPtr& jointHeadState)
{
    this->jointHeadState = *jointHeadState;
}

void HumanoidInterface::motorPIDCallback(const movement_msgs::MotorPIDMsgPtr& motorPID)
{
    this->motorPID = *motorPID;
    updatePID      = true;
}

bool HumanoidInterface::interfaceService(movement_msgs::InterfaceSrv::Request& msg, movement_msgs::InterfaceSrv::Response& res)
{
    if (msg.getPID)
    {
        if (toGazebo)
            readFromGazebo(READ_PID);
        if (toRobot)
            readFromRobot(READ_PID);
        res.motorPID = motorPIDMsg;
    }
    if (msg.scanMotors)
    {
        std::vector<int> idVec;
        idVec.clear();
        if (toRobot)
        {
            ids = scanDynamixel();
            clearDynamixelDriver();
            if (loadDynamixel())
            {
                ROS_WARN("[HUMANOID_INTERFACE] DYNAMIXELS WERE RELOADED");
                ROS_WARN("[HUMANOID_INTERFACE] DOFS: %3d", int(dynamixel_info_.size()));
            }
        }
        for (int i = 0; i < int(ids.size()); i++)
            res.ids.push_back(ids[i]);
        if (toGazebo)
            for (int i = 0; i < 20; i++)
                res.ids.push_back(i);
    }
    if (int(msg.setTorque.size()) > 1)
    {
        std::vector<bool> torqVec;
        torqVec.clear();
        for (int i = 0; i < int(msg.setTorque.size()); i++)
            torqVec.push_back(msg.setTorque[i]);
        if (toRobot)
            setTorque(torqVec);
    }
    if (msg.getMotorPos)
    {
        if (toRobot)
        {
            readFromRobot(READ_POS);
            res.motorState.pos.clear();
            res.motorState = motor2JointState(map.map, jointReadState);
        }
        if (toGazebo)
        {
            readFromGazebo(READ_POS);
            res.motorState.pos.clear();
            res.motorState = jointReadState;
        }
    }
    if (msg.fall == true)
    {
        if (!fell)
        {
            ROS_WARN("FALL");
            // if(toRobot) updateRobotP(1);
            std::vector<bool> torque(21, false);
            setTorque(torque);
            fell = true;
        }
        else
        {
            ROS_WARN("RECOVER PID");
            // readFromRobot(READ_POS);
            // this->jointStateOld = this->jointState;
            // this->jointState    = this->jointReadState;
            // if(toRobot) updateRobotPID(motorPID);
            std::vector<bool> torque(21, true);
            setTorque(torque);
            fell = false;
        }
    }
    else
    {
        if (toRobot && !motorPID.kp.empty())
            updateRobotPID(motorPID);
    }
    if (msg.toGazebo || msg.toRobot)
        send2Motor = msg.send2Motor;

    if (msg.ping)
        pingAll = true;

    return true;
}
