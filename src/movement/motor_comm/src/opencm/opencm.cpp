#include "opencm/opencm.h"

OpenCM::OpenCM(ros::NodeHandle nh_): nh(nh_) 
{
    if (!nh.getParam("dt", dt)) dt = 0.07;

    mapCli = nh.serviceClient<movement_msgs::LoadMapConfigsSrv>("humanoid_loadmap/load");
    StateService = nh.advertiseService("/motor_comm/state_request", &OpenCM::CurrentState,this);

    opencmRequestPub = nh.advertise<movement_msgs::OpencmRequestMsg>("opencm/request",1000);

    opencmResponseSub = nh.subscribe<movement_msgs::OpencmResponseMsg>("opencm/response",1000,&OpenCM::opencmResponse, this);
    MoveCreatorSub = nh.subscribe<movement_msgs::JointStateMsg>("humanoid_model/jointState",1000,&OpenCM::JointMoveCreatorSub, this);
    motorRequestSub = nh.subscribe<movement_msgs::MotorRequestMsg>("motor_comm/request",1000,&OpenCM::motorRequest, this);
    headSub = nh.subscribe<movement_msgs::HeadMoveMsg>("/motor_comm/head_params",1000,&OpenCM::sendHeadPosition, this);

    loadMap();
    position.resize(OPEN_CM_DOF,0);
    velocity.resize(OPEN_CM_DOF,0);
    data.resize(OPEN_CM_DOF,0);
    previousPosition.resize(OPEN_CM_DOF,0);

    stateSM = "";
    stateBefore = "_empty"; // Inicialido com um valor quaquer apenas para diferir de stateSM
    firstLoop = true;

    // Iniciando a OpenCM
    ros::Duration(5).sleep(); // Para dar tempo da opencm inicializar, não é a forma mais adequada
    init();
    timer = nh.createTimer(ros::Duration(dt), &OpenCM::run, this);
}

OpenCM::~OpenCM(){}

void OpenCM::loadMap()
{
    mapMsg.request.update = false;
    if (mapCli.call(mapMsg))
    {
        int height = mapMsg.response.idMap.map.layout.dim[0].size;
        int width = mapMsg.response.idMap.map.layout.dim[1].size;
        std::vector<int> data = mapMsg.response.idMap.map.data;
        Eigen::Map<Eigen::MatrixXi> mat(data.data(), height, width);
        map.map = mat;
        for (int i = 0; i < int(mapMsg.response.idMap.jNames.size()); i++)
        {
            map.enumMap.insert(std::make_pair(mapMsg.response.idMap.jNames[i], i));
        }    
    }
}

bool OpenCM::CurrentState(movement_msgs::MovementStatesSrv::Request  &req, movement_msgs::MovementStatesSrv::Response &res)
{
    stateSM = req.state;
    if(stateBefore != stateSM)
    {
        ROS_INFO("request: %s", stateSM.c_str());
    }
    stateBefore = stateSM;
    return true;
}

void OpenCM::opencmResponse(const movement_msgs::OpencmResponseMsg::ConstPtr& msg)
{       
    std::cout << " Models: [";
    motorModel.clear();
    for (int i = 0; i < OPEN_CM_DOF; i++)
    {
        motorModel.push_back(msg->model[i]);
        //ROS_INFO("Value: %d", motorModel[i]);   
    }
    std::cout << "]";
}

void OpenCM::JointMoveCreatorSub(const movement_msgs::JointStateMsg::ConstPtr& rqtPages)
{   
    posCheck = rqtPages->pos;
    velCheck = rqtPages->vel;

    if (stateSM == "S_Page_exec")
    {
        movecreatorValue(posCheck, velCheck);
    }
}

void OpenCM::motorRequest(const movement_msgs::MotorRequestMsg::ConstPtr& rqt)
{
    posWalk = rqt->data;
    velWalk = rqt->velocity;
    if (stateSM == "S_Walking"   || stateSM == "S_Walking_head" ||
        stateSM == "S_Move_head" || stateSM == "S_First_pose")
    {
        radian2MotorValue(posWalk,velWalk);
    }
} 

void OpenCM::sendHeadPosition(const movement_msgs::HeadMoveMsg::ConstPtr& msg)
{   
    headDecision = msg->pos;
    if (headDecision != headDecisionBefore)
    {   
        switchHead();
    }
    headDecisionBefore = headDecision;
}

void OpenCM::switchHead()
{   
    if (stateSM == "S_Move_head" || stateSM == "S_Walking_head")
    {   
        for(int i = 0; i <= 17; i++){
            opencmReq.data[i] = forcedFirstPose[i];
        }
        switch (headDecision)
        {
            case -1: // Mover para a esquerda
                if (opencmReq.data[18] < convertToMX(LEFT_LIMIT, motorModel[18]))
                {
                    int Motor_18 = notConvMotor18 + DP;
                    notConvMotor18 = Motor_18;
                    opencmReq.data[18] = convertToMX(notConvMotor18, motorModel[18]);
                    opencmReq.velocity[18] = VEL;

                    position[19] = opencmReq.data[19];
                    velocity[19] = opencmReq.velocity[19];
                }
                else
                {
                    opencmReq.data[18] = convertToMX(LEFT_LIMIT, motorModel[18]);
                    opencmReq.velocity[18] = VEL;

                    position[19] = opencmReq.data[19];
                    velocity[19] = opencmReq.velocity[19];
                }
                break;  

            case 1: // Mover para a direita
                if (opencmReq.data[18] > convertToMX(RIGHT_LIMIT, motorModel[18]))
                {
                    int Motor_18 = notConvMotor18 - DP;
                    notConvMotor18 = Motor_18;
                    std::cout << "\n" << "Motor 18 em 1: " << notConvMotor18 << std::endl;
                    opencmReq.data[18] = convertToMX(notConvMotor18, motorModel[18]);
                    opencmReq.velocity[18] = VEL;

                    position[19] = opencmReq.data[19];
                    velocity[19] = opencmReq.velocity[19];
                }
                else
                {
                    opencmReq.data[18] = convertToMX(RIGHT_LIMIT, motorModel[18]);
                    opencmReq.velocity[18] = VEL;

                    position[19] = opencmReq.data[19];
                    velocity[19] = opencmReq.velocity[19];
                }
                break;
                
            case -2: // Mover para baixo
                if (opencmReq.data[19] < convertToMX(DOWN_LIMIT, motorModel[19]))
                {
                    int Motor_19 = notConvMotor19 + DP;
                    notConvMotor19 = Motor_19;
                    std::cout << "\n" << "Motor 19 em -2: " << notConvMotor19 << std::endl;
                    opencmReq.data[19] = convertToMX(notConvMotor19, motorModel[19]);
                    opencmReq.velocity[19] = VEL;

                    position[18] = opencmReq.data[18];
                    velocity[18] = opencmReq.velocity[18];
                }
                else
                {
                    opencmReq.data[19] = convertToMX(DOWN_LIMIT, motorModel[19]);
                    opencmReq.velocity[19] = VEL;

                    position[18] = opencmReq.data[18];
                    velocity[18] = opencmReq.velocity[18];
                }
                break;

            case 2: // Mover para cima
                if (opencmReq.data[19] > convertToMX(UP_LIMIT, motorModel[19]))
                {
                    int Motor_19 = notConvMotor19 - DP;
                    notConvMotor19 = Motor_19;
                    opencmReq.data[19] = convertToMX(notConvMotor19, motorModel[19]);
                    opencmReq.velocity[19] = VEL;

                    position[18] = opencmReq.data[18];
                    velocity[18] = opencmReq.velocity[18];
                }
                else
                {
                    opencmReq.data[19] = convertToMX(UP_LIMIT, motorModel[19]);
                    opencmReq.velocity[19] = VEL;

                    position[18] = opencmReq.data[18];
                    velocity[18] = opencmReq.velocity[18];
                }
                break;

            case 3: // Procurar
                //vai para o centro caso alguma posicao esteja fora do range maximo definido
                if (opencmReq.data[18] > convertToMX(LEFT_LIMIT, motorModel[18]) || opencmReq.data[18] < convertToMX(RIGHT_LIMIT, motorModel[18]) ||
                    opencmReq.data[19] < convertToMX(UP_LIMIT, motorModel[19]) || opencmReq.data[19] > convertToMX(DOWN_LIMIT, motorModel[19]) )
                {
                    opencmReq.data[18] = convertToMX(2048, motorModel[18]);
                    opencmReq.velocity[18] = VEL;
                    opencmReq.data[19] = convertToMX(2048, motorModel[19]);
                    opencmReq.velocity[18] = VEL;
                }
                //caso os motores estejam na regiao central, move para cima
                else if(convertToMX(RIGHT_LIMIT+GAP, motorModel[18]) <= opencmReq.data[18] &&
                        opencmReq.data[18] <= convertToMX(LEFT_LIMIT-GAP, motorModel[18]) && 
                        convertToMX(UP_LIMIT+GAP, motorModel[19]) <= opencmReq.data[19] && 
                        opencmReq.data[19]< convertToMX(DOWN_LIMIT-GAP, motorModel[19])){

                    int Motor_19 = notConvMotor19 - DP;
                    notConvMotor19 = Motor_19;
                    opencmReq.data[19] = convertToMX(notConvMotor19, motorModel[19]);
                    opencmReq.velocity[19] = VEL;

                    position[18] = opencmReq.data[18];
                    velocity[18] = opencmReq.velocity[18];
                }
                //caso os motores estejam na regiao superior direita ou superior central, vai para esquerda
                else if(convertToMX(RIGHT_LIMIT, motorModel[18]) <= opencmReq.data[18] &&
                        opencmReq.data[18] <= convertToMX(LEFT_LIMIT-GAP, motorModel[18]) &&
                        convertToMX(UP_LIMIT, motorModel[19]) <= opencmReq.data[19] &&
                        opencmReq.data[19]< convertToMX(UP_LIMIT+GAP, motorModel[19])){

                    int Motor_18 = notConvMotor18 + DP;
                    notConvMotor18 = Motor_18;
                    opencmReq.data[18] = convertToMX(notConvMotor18, motorModel[18]);
                    opencmReq.velocity[18] = VEL;

                    position[19] = opencmReq.data[19];
                    velocity[19] = opencmReq.velocity[19];
                }
                //caso os motores estejam na regiao superior esquerda ou central esquerda, vai para baixo
                else if(convertToMX(LEFT_LIMIT-GAP, motorModel[18]) < opencmReq.data[18]  && 
                        opencmReq.data[18] <= convertToMX(LEFT_LIMIT, motorModel[18]) &&
                        convertToMX(UP_LIMIT, motorModel[19]) <= opencmReq.data[19] && 
                        convertToMX(opencmReq.data[19], motorModel[19])<= (DOWN_LIMIT-GAP)){

                    int Motor_19 = notConvMotor19 + DP;
                    notConvMotor19 = Motor_19;
                    opencmReq.data[19] = convertToMX(notConvMotor19, motorModel[19]);
                    opencmReq.velocity[19] = VEL;

                    position[18] = opencmReq.data[18];
                    velocity[18] = opencmReq.velocity[18];
                }
                //caso os motores estejam na regiao inferior esquerda ou inferior central, vai para direita
                else if(convertToMX(RIGHT_LIMIT+GAP, motorModel[18]) <= opencmReq.data[18] && 
                        opencmReq.data[18] <= convertToMX(LEFT_LIMIT, motorModel[18])  && 
                        convertToMX(DOWN_LIMIT-GAP, motorModel[19]) < opencmReq.data[19]  && 
                        opencmReq.data[19]<= convertToMX(DOWN_LIMIT, motorModel[19])){

                    int Motor_18 = notConvMotor18 - DP;
                    notConvMotor18 = Motor_18;
                    opencmReq.data[18] = convertToMX(notConvMotor18, motorModel[18]);

                    opencmReq.velocity[18] = VEL;
                    position[19] = opencmReq.data[19];
                    velocity[19] = opencmReq.velocity[19];
                }
                //caso esteja na regiao inferior direita ou central direita, vai para cima
                else if(convertToMX(RIGHT_LIMIT, motorModel[18]) <= opencmReq.data[18] && 
                        opencmReq.data[18] < convertToMX(RIGHT_LIMIT+GAP, motorModel[18])  && 
                        convertToMX(UP_LIMIT+GAP, motorModel[19]) <= opencmReq.data[19] &&
                        opencmReq.data[19]<= convertToMX(DOWN_LIMIT, motorModel[19])){

                    int Motor_19 = notConvMotor19 - DP;
                    notConvMotor19 = Motor_19;
                    opencmReq.data[19] = convertToMX(notConvMotor19, motorModel[19]);

                    opencmReq.velocity[19] = VEL;
                    position[18] = opencmReq.data[18];
                    velocity[18] = opencmReq.velocity[18];
                } 
                break;

            case 0:
                //ROS_INFO("Case 0");  
                position[19] = opencmReq.data[19];
                position[18] = opencmReq.data[18];
                opencmReq.velocity[18] = 1;
                opencmReq.velocity[19] = 1;
                break;

            default:
                opencmReq.data[19] = convertToMX(2048, motorModel[19]);
                opencmReq.data[18] = convertToMX(2048, motorModel[18]);
                opencmReq.velocity[18] = INIT_VEL;
                opencmReq.velocity[19] = INIT_VEL;
        }
    }
}

void OpenCM::init() {
    ROS_INFO("Detectando Motores");
    opencmReq.commandRead = "live";
    opencmReq.source = "not_walking";
    opencmRequestPub.publish(opencmReq);
}

void OpenCM::run(const ros::TimerEvent&)
{   
    if (stateSM == "S_Move_head")
    {
        int count = 0;
        for (int i = 0; i < OPEN_CM_DOF; i++)
        {   
            if (i < 18)
            {
                opencmReq.data[i] = position[i];
                opencmReq.velocity[i] = velocity[i]; // Teste deve ser feito na robo
                if(opencmReq.data[i] == 0)
                    count++; 
            }
            else 
            {
                switchHead();
                if(opencmReq.data[i] == 0)
                {
                    opencmReq.data[i] = convertToMX(2048, motorModel[i]);
                }   
            }
        }
        if (count >= 2 && count <= 18)
        {
            opencmReq.source = "ERROR";
            opencmReq.commandRead = "nothing_to_do";
        }
        else
        {
            opencmReq.source = "not_walking";
            opencmReq.commandRead = "position_dt_head"; 
        } 
        opencmRequestPub.publish(opencmReq);   
    }
    else if (stateSM == "S_Test_mode")
    {   
        motorModel.clear();
        for (int i = 0; i < OPEN_CM_DOF; i++)
        {
            //Valor hipotetico apenas para incializar o modo de testes
            motorModel.push_back(302);
        }
    }
    else if (stateSM == "S_Walking"   || stateSM == "S_Walking_head")
    {
        int count = 0;
        for (int i = 0; i < OPEN_CM_DOF; i++)
        {
            if (i < 18)
            {
                opencmReq.data[i] = position[i];
                opencmReq.velocity[i] = velocity[i];
                if(opencmReq.data[i] == 0)
                {
                    count++;
                } 
            }
            else
            {
                if (stateSM == "S_Walking_head")
                    switchHead();

                if(opencmReq.data[i] == 0)
                {
                    opencmReq.data[i] = convertToMX(2048, motorModel[i]);
                }
            }
        }
        if (count >= 2 && count <= 18)
        {
            opencmReq.source = "ERROR";
            opencmReq.commandRead = "nothing_to_do";
        }
        else
        {
            opencmReq.source = "walking";
            opencmReq.commandRead = "position_dt"; 
        }  
        opencmRequestPub.publish(opencmReq);
    }
    else if (stateSM == "S_Page_exec")
    {
        for (int i = 0; i < OPEN_CM_DOF; i++)
        {   
            if (i < 18)
            {
                opencmReq.data[i] = position[i];
                opencmReq.velocity[i] = velocity[i]; 
            }
            else
            {
                opencmReq.data[i] = convertToMX(2048, motorModel[i]);
                opencmReq.velocity[i] = 5;
            }   
        }
        opencmReq.source = "movecreator";
        opencmReq.commandRead = "position_dt";   
        opencmRequestPub.publish(opencmReq);
    }
    else if(stateSM == "S_First_pose")
    {
        int count = 0;
        for (int i = 0; i < OPEN_CM_DOF; i++)
        {   
            if (i < 18)
            {
                if (firstLoop)
                {
                    initPose[i] = position[i];
                }
                opencmReq.data[i] = initPose[i];
                opencmReq.velocity[i] = INIT_VEL; 
                if(opencmReq.data[i] == 0)
                {
                    count++;
                }
            }
            else 
            {
                opencmReq.data[i] = convertToMX(2048, motorModel[i]);
                opencmReq.velocity[i] = INIT_VEL;
            }
        }
        if (count >= 2 && count <=20)
        {
            opencmReq.source = "ERROR";
            opencmReq.commandRead = "nothing_to_do";
        }
        else
        {
            opencmReq.source = "not_walking";
            opencmReq.commandRead = "position_dt";
            firstLoop = false;
        }    
        opencmRequestPub.publish(opencmReq);
    }
}

int OpenCM::convertToMX(const int motorValue, const int motorModel)
{
    //Branchless Programming
    const double value = (motorModel == AX_12)*(((3.0*motorValue)/10.0)-102.4) + (motorModel == AX_18)*(((3.0*motorValue)/10.0)-102.4) +
    (motorModel == RX_64)*(((3.0*motorValue)/10.0)-102.4) + (motorModel == EX_106)*(((360.0*motorValue)/250.92)-890.31) +
    (motorModel == MX_106)*motorValue + (motorModel == MX_106_2)*motorValue + (motorModel == MX_64)*motorValue + (motorModel == MX_64_2)*motorValue;

    //ROS_INFO("Value motor: %f, Motor model: %d", value, motorModel);
    return (value + 0.5);
}

void OpenCM::radian2MotorValue(std::vector<double> radPosition, std::vector<double> radVelocity)
{
    Eigen::MatrixXi& mapEigen = map.map;
    radPosition.resize(OPEN_CM_DOF,0);
    radVelocity.resize(OPEN_CM_DOF,0);

    double deltaPos = 0;
    for (int i = 0; i < int(mapEigen.rows()); i++)
    {        
        int index = mapEigen(i, ROBOT_IDS);
        if (index != -1)
        {
            int offset      = mapEigen(i, ROBOT_OFFSET);
            int motorRef    = mapEigen(i, MOTOR_REF);
            int motorCCWLim = mapEigen(i, MOTOR_CCWLIM);
            int motorCWLim  = mapEigen(i, MOTOR_CWLIM);

            position[index] = (radPosition[index] + offset) * rad2motor + motorRef;
            deltaPos     = MathUtils::absf(radPosition[index] - previousPosition[index]);
            velocity[index] = radvel2motor * ((deltaPos) / (dt)) + 1;
            
            if (position[index] >= motorCCWLim)
            {
                position[index] = motorCCWLim;
            }
            else if(position[index] <= motorCWLim)
            {
                position[index] = motorCWLim;
            }
            if (motorModel[index] > 0)
            {
                //ROS_INFO("");
                //ROS_INFO("Position Before = %d, id = %d", position[index], index);
                position[index] = ((motorModel[i]==MX_106_2) || (motorModel[i]==MX_106) || (motorModel[i]==MX_64) || (motorModel[i]==MX_64_2))*position[index] +
                (!((motorModel[i]==MX_106_2) || (motorModel[i]==MX_106) || (motorModel[i]==MX_64) || (motorModel[i]==MX_64_2)))*convertToMX(position[index], motorModel[index]);
                //ROS_INFO("New Position = %d",position[index]);
                //ROS_INFO("");
            }
            if (velocity[index] >= 500 || velocity[index] <= 0)
            {
                velocity[index] = 500;
            }
        }
    }
}

void OpenCM::movecreatorValue(std::vector<double> movecreatorPosition, std::vector<double> movecreatorVelocity)
{
    Eigen::MatrixXi& mapEigen = map.map;
    movecreatorPosition.resize(OPEN_CM_DOF,0);
    movecreatorVelocity.resize(OPEN_CM_DOF,0);

    double deltaPos = 0;
    for (int i = 0; i < int(mapEigen.rows()); i++)
    {        
        int index = mapEigen(i, ROBOT_IDS);
        if (index != -1)
        {
            int motorCCWLim = mapEigen(i, MOTOR_CCWLIM);
            int motorCWLim  = mapEigen(i, MOTOR_CWLIM);
            deltaPos     = MathUtils::absf(movecreatorPosition[index] - previousPosition[index]);
            velocity[index] = ((deltaPos) / (dt)) + 1;
            position[index] = posCheck[index];
            if (position[index] >= motorCCWLim)
            {
                position[index] = motorCCWLim;
            }
            else if(position[index] <= motorCWLim)
            {
                position[index] = motorCWLim;
            }
            if (velocity[index] >= 500 || velocity[index] <= 0)
            {
                velocity[index] = 150;
            }
        }
        previousPosition[index] = position[index];
    }
}
