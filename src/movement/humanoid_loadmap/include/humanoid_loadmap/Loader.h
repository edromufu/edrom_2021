#ifndef LOADER_H
#define LOADER_H


#include <iostream>
#include <vector>
#include <map>
#include <eigen3/Eigen/Dense>
#include "movement_util/MathUtils.h"
#include "movement_util/basicxml.hpp"
#include "movement_util/State.h"
#include "movement_util/Enums.h"
#include "humanoid_loadmap/Mapping.h"

#include <rbdl/rbdl.h>
#ifndef RBDL_BUILD_ADDON_URDFREADER
    #error "Error: RBDL addon URDFReader not enabled."
#endif
#include <rbdl/addons/urdfreader/urdfreader.h>



class Loader
{
public:
    Loader();

    //Methods
    static void load(const char* fEnum, const char* fRobot, const char* fUrdf, const char *fIk, Mapping &map);
    static void loadEnumConfig(const char* filename,Mapping &map);
    static void loadRobotConfig(const char* filename,Mapping &map);
    static void loadURDF(const char* filename,Mapping &map);
    static void loadIKConfig(const char* filename,Mapping &map);
    static void fixIds(std::vector<Eigen::Vector2i> &idPairs);
};

#endif // LOADER_H
