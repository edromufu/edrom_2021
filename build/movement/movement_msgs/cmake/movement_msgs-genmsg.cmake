# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "movement_msgs: 6 messages, 4 services")

set(MSG_I_FLAGS "-Imovement_msgs:/home/edrom/edrom/src/movement/movement_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(movement_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv" ""
)

get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv" NAME_WE)
add_custom_target(_movement_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "movement_msgs" "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)
_generate_msg_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)
_generate_msg_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)
_generate_msg_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)
_generate_msg_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)
_generate_msg_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)

### Generating Services
_generate_srv_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)
_generate_srv_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)
_generate_srv_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)
_generate_srv_cpp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
)

### Generating Module File
_generate_module_cpp(movement_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(movement_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(movement_msgs_generate_messages movement_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_cpp _movement_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_msgs_gencpp)
add_dependencies(movement_msgs_gencpp movement_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)
_generate_msg_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)
_generate_msg_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)
_generate_msg_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)
_generate_msg_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)
_generate_msg_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)

### Generating Services
_generate_srv_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)
_generate_srv_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)
_generate_srv_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)
_generate_srv_eus(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
)

### Generating Module File
_generate_module_eus(movement_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(movement_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(movement_msgs_generate_messages movement_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_eus _movement_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_msgs_geneus)
add_dependencies(movement_msgs_geneus movement_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)
_generate_msg_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)
_generate_msg_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)
_generate_msg_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)
_generate_msg_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)
_generate_msg_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)

### Generating Services
_generate_srv_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)
_generate_srv_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)
_generate_srv_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)
_generate_srv_lisp(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
)

### Generating Module File
_generate_module_lisp(movement_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(movement_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(movement_msgs_generate_messages movement_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_lisp _movement_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_msgs_genlisp)
add_dependencies(movement_msgs_genlisp movement_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)
_generate_msg_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)
_generate_msg_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)
_generate_msg_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)
_generate_msg_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)
_generate_msg_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)

### Generating Services
_generate_srv_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)
_generate_srv_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)
_generate_srv_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)
_generate_srv_nodejs(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
)

### Generating Module File
_generate_module_nodejs(movement_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(movement_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(movement_msgs_generate_messages movement_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_nodejs _movement_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_msgs_gennodejs)
add_dependencies(movement_msgs_gennodejs movement_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)
_generate_msg_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)
_generate_msg_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)
_generate_msg_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)
_generate_msg_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)
_generate_msg_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)

### Generating Services
_generate_srv_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)
_generate_srv_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)
_generate_srv_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)
_generate_srv_py(movement_msgs
  "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
)

### Generating Module File
_generate_module_py(movement_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(movement_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(movement_msgs_generate_messages movement_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/HeadParamsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WalkingPositionsMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/OpencmResponseMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/WebotsRequestMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/msg/ApprovedMovementMsg.msg" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/BehRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkCreatorRequestSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/CommandToOpenCMSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/edrom/edrom/src/movement/movement_msgs/srv/WalkTestParametersSrv.srv" NAME_WE)
add_dependencies(movement_msgs_generate_messages_py _movement_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(movement_msgs_genpy)
add_dependencies(movement_msgs_genpy movement_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS movement_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/movement_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(movement_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/movement_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(movement_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/movement_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(movement_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/movement_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(movement_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/movement_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(movement_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
