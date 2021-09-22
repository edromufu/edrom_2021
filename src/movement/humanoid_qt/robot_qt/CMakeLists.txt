##############################################################################
# CMake
##############################################################################

cmake_minimum_required(VERSION 2.8.0)
project(humanoid_qt)

add_definitions(`xml2-config --cflags` -std=c++11 -Wall)

##############################################################################
# Catkin
##############################################################################

# qt_build provides the qt cmake glue, roscpp the comms for a default talker
find_package(catkin REQUIRED COMPONENTS roscpp sensor_msgs message_filters movement_msgs movement_util)
find_package(Qt5 COMPONENTS Core Gui Widgets PrintSupport)


include_directories(${catkin_INCLUDE_DIRS})
# Use this to define what the package will export (e.g. libs, headers).
# Since the default here is to produce only a binary, we don't worry about
# exporting anything. 
catkin_package()

##############################################################################
# Qt Environment
##############################################################################

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)


# this comes from qt_build's qt-ros.cmake which is automatically 
# included via the dependency call in package.xml
# Add the appropriate components to the component list here

##############################################################################
# Sections
##############################################################################

file(GLOB QT_FORMS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ui/*.ui)
file(GLOB QT_RESOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} resources/*.qrc)
file(GLOB_RECURSE QT_MOC RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS include/robot_qt/*.hpp)

QT5_ADD_RESOURCES(QT_RESOURCES_CPP ${QT_RESOURCES})
QT5_WRAP_UI(QT_FORMS_HPP ${QT_FORMS})
QT5_WRAP_CPP(QT_MOC_HPP ${QT_MOC})

##############################################################################
# Sources
##############################################################################

include_directories(
    ${Qt5Core_INCLUDE_DIRS}
    ${Qt5Gui_INCLUDE_DIRS}
    ${Qt5Widgets_INCLUDE_DIRS}
    ${Qt5PrintSupport_INCLUDE_DIRS}
)

##############################################################################
# Binaries
##############################################################################

set(QT_SOURCES
    src/main.cpp
    src/main_window.cpp
    src/qcustomplot.cpp
    src/qnode.cpp

    include/robot_qt/main_window.hpp
    include/robot_qt/qcustomplot.hpp
    include/robot_qt/qnode.hpp
)




##############################################################################
add_library(qcustomplot SHARED src/qcustomplot.cpp)

add_executable(humanoid_qt ${QT_SOURCES} ${QT_RESOURCES_CPP} ${QT_FORMS_HPP} ${QT_MOC_HPP})

target_link_libraries(qcustomplot ${QT_LIBRARIES} ${Boost_LIBRARIES})
target_link_libraries(humanoid_qt ${catkin_LIBRARIES} 
    Qt5::Core
    Qt5::Widgets
    Qt5::PrintSupport
    qcustomplot
)
install(TARGETS humanoid_qt RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})


install(TARGETS qcustomplot
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.h  *.hpp"
  PATTERN ".svn" EXCLUDE
)


