# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "behaviour_msgs: 6 messages, 4 services")

set(MSG_I_FLAGS "-Ibehaviour_msgs:/home/murilo/edrom/src/behaviour/behaviour_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(behaviour_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg" "behaviour_msgs/GameControllerPlayerMsg:behaviour_msgs/GameControllerTeamMsg"
)

get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg" ""
)

get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg" ""
)

get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg" ""
)

get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg" "behaviour_msgs/GameControllerPlayerMsg"
)

get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv" ""
)

get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv" "behaviour_msgs/ActionMsg"
)

get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv" ""
)

get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv" NAME_WE)
add_custom_target(_behaviour_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "behaviour_msgs" "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg;/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)

### Generating Services
_generate_srv_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_cpp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
)

### Generating Module File
_generate_module_cpp(behaviour_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(behaviour_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(behaviour_msgs_generate_messages behaviour_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_cpp _behaviour_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(behaviour_msgs_gencpp)
add_dependencies(behaviour_msgs_gencpp behaviour_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS behaviour_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg;/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)

### Generating Services
_generate_srv_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_eus(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
)

### Generating Module File
_generate_module_eus(behaviour_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(behaviour_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(behaviour_msgs_generate_messages behaviour_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_eus _behaviour_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(behaviour_msgs_geneus)
add_dependencies(behaviour_msgs_geneus behaviour_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS behaviour_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg;/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)

### Generating Services
_generate_srv_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_lisp(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
)

### Generating Module File
_generate_module_lisp(behaviour_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(behaviour_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(behaviour_msgs_generate_messages behaviour_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_lisp _behaviour_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(behaviour_msgs_genlisp)
add_dependencies(behaviour_msgs_genlisp behaviour_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS behaviour_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg;/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)

### Generating Services
_generate_srv_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_nodejs(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
)

### Generating Module File
_generate_module_nodejs(behaviour_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(behaviour_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(behaviour_msgs_generate_messages behaviour_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_nodejs _behaviour_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(behaviour_msgs_gennodejs)
add_dependencies(behaviour_msgs_gennodejs behaviour_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS behaviour_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg;/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)
_generate_msg_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)

### Generating Services
_generate_srv_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv"
  "${MSG_I_FLAGS}"
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)
_generate_srv_py(behaviour_msgs
  "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
)

### Generating Module File
_generate_module_py(behaviour_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(behaviour_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(behaviour_msgs_generate_messages behaviour_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/ActionMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/StateMachineActionsMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerPlayerMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameControllerTeamMsg.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/msg/GameState.msg" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/GameControllerSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/ActionPanelSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/service_page.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/murilo/edrom/src/behaviour/behaviour_msgs/srv/yamlTransitionSrv.srv" NAME_WE)
add_dependencies(behaviour_msgs_generate_messages_py _behaviour_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(behaviour_msgs_genpy)
add_dependencies(behaviour_msgs_genpy behaviour_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS behaviour_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/behaviour_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(behaviour_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(behaviour_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/behaviour_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(behaviour_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(behaviour_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/behaviour_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(behaviour_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(behaviour_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/behaviour_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(behaviour_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(behaviour_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/behaviour_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(behaviour_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(behaviour_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
