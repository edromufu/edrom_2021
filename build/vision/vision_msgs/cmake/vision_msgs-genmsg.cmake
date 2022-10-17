# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "vision_msgs: 7 messages, 0 services")

set(MSG_I_FLAGS "-Ivision_msgs:/home/edrom/edrom/src/vision/vision_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(vision_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg" NAME_WE)
add_custom_target(_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_msgs" "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg" "std_msgs/Header:vision_msgs/Robot:vision_msgs/Ball:sensor_msgs/Image:vision_msgs/Goal"
)

get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg" NAME_WE)
add_custom_target(_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_msgs" "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg" NAME_WE)
add_custom_target(_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_msgs" "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg" NAME_WE)
add_custom_target(_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_msgs" "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg" NAME_WE)
add_custom_target(_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_msgs" "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg" NAME_WE)
add_custom_target(_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_msgs" "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg" NAME_WE)
add_custom_target(_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "vision_msgs" "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg" "vision_msgs/Leftgoalpost:vision_msgs/Ball:vision_msgs/Rightgoalpost"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs
)
_generate_msg_cpp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs
)
_generate_msg_cpp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs
)
_generate_msg_cpp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs
)
_generate_msg_cpp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs
)
_generate_msg_cpp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs
)
_generate_msg_cpp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg"
  "${MSG_I_FLAGS}"
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(vision_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(vision_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(vision_msgs_generate_messages vision_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_cpp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_cpp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_cpp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_cpp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_cpp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_cpp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_cpp _vision_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_msgs_gencpp)
add_dependencies(vision_msgs_gencpp vision_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs
)
_generate_msg_eus(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs
)
_generate_msg_eus(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs
)
_generate_msg_eus(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs
)
_generate_msg_eus(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs
)
_generate_msg_eus(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs
)
_generate_msg_eus(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg"
  "${MSG_I_FLAGS}"
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(vision_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(vision_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(vision_msgs_generate_messages vision_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_eus _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_eus _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_eus _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_eus _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_eus _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_eus _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_eus _vision_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_msgs_geneus)
add_dependencies(vision_msgs_geneus vision_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs
)
_generate_msg_lisp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs
)
_generate_msg_lisp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs
)
_generate_msg_lisp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs
)
_generate_msg_lisp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs
)
_generate_msg_lisp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs
)
_generate_msg_lisp(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg"
  "${MSG_I_FLAGS}"
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(vision_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(vision_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(vision_msgs_generate_messages vision_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_lisp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_lisp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_lisp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_lisp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_lisp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_lisp _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_lisp _vision_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_msgs_genlisp)
add_dependencies(vision_msgs_genlisp vision_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs
)
_generate_msg_nodejs(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs
)
_generate_msg_nodejs(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs
)
_generate_msg_nodejs(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs
)
_generate_msg_nodejs(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs
)
_generate_msg_nodejs(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs
)
_generate_msg_nodejs(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg"
  "${MSG_I_FLAGS}"
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(vision_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(vision_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(vision_msgs_generate_messages vision_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_nodejs _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_nodejs _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_nodejs _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_nodejs _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_nodejs _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_nodejs _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_nodejs _vision_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_msgs_gennodejs)
add_dependencies(vision_msgs_gennodejs vision_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs
)
_generate_msg_py(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs
)
_generate_msg_py(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs
)
_generate_msg_py(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs
)
_generate_msg_py(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs
)
_generate_msg_py(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs
)
_generate_msg_py(vision_msgs
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg"
  "${MSG_I_FLAGS}"
  "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg;/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(vision_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(vision_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(vision_msgs_generate_messages vision_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Objects.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_py _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Ball.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_py _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Goal.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_py _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Robot.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_py _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Leftgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_py _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Rightgoalpost.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_py _vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/vision/vision_msgs/msg/Webotsmsg.msg" NAME_WE)
add_dependencies(vision_msgs_generate_messages_py _vision_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(vision_msgs_genpy)
add_dependencies(vision_msgs_genpy vision_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(vision_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(vision_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/vision_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(vision_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(vision_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(vision_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(vision_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/vision_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(vision_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(vision_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(vision_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(vision_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
