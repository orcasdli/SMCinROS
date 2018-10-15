# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "acl_msgs: 6 messages, 0 services")

set(MSG_I_FLAGS "-Iacl_msgs:/home/peterli/catkin_ws_SMC/src/acl_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(acl_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg" NAME_WE)
add_custom_target(_acl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "acl_msgs" "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg" NAME_WE)
add_custom_target(_acl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "acl_msgs" "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg" "geometry_msgs/Twist:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Vector3:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg" NAME_WE)
add_custom_target(_acl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "acl_msgs" "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg" "geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg" NAME_WE)
add_custom_target(_acl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "acl_msgs" "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg" "geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg" NAME_WE)
add_custom_target(_acl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "acl_msgs" "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg" NAME_WE)
add_custom_target(_acl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "acl_msgs" "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg" "geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Vector3"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/acl_msgs
)
_generate_msg_cpp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/acl_msgs
)
_generate_msg_cpp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/acl_msgs
)
_generate_msg_cpp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/acl_msgs
)
_generate_msg_cpp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/acl_msgs
)
_generate_msg_cpp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/acl_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(acl_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/acl_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(acl_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(acl_msgs_generate_messages acl_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_cpp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_cpp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_cpp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_cpp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_cpp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_cpp _acl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(acl_msgs_gencpp)
add_dependencies(acl_msgs_gencpp acl_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS acl_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/acl_msgs
)
_generate_msg_eus(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/acl_msgs
)
_generate_msg_eus(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/acl_msgs
)
_generate_msg_eus(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/acl_msgs
)
_generate_msg_eus(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/acl_msgs
)
_generate_msg_eus(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/acl_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(acl_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/acl_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(acl_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(acl_msgs_generate_messages acl_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_eus _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_eus _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_eus _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_eus _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_eus _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_eus _acl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(acl_msgs_geneus)
add_dependencies(acl_msgs_geneus acl_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS acl_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/acl_msgs
)
_generate_msg_lisp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/acl_msgs
)
_generate_msg_lisp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/acl_msgs
)
_generate_msg_lisp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/acl_msgs
)
_generate_msg_lisp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/acl_msgs
)
_generate_msg_lisp(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/acl_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(acl_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/acl_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(acl_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(acl_msgs_generate_messages acl_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_lisp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_lisp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_lisp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_lisp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_lisp _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_lisp _acl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(acl_msgs_genlisp)
add_dependencies(acl_msgs_genlisp acl_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS acl_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/acl_msgs
)
_generate_msg_nodejs(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/acl_msgs
)
_generate_msg_nodejs(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/acl_msgs
)
_generate_msg_nodejs(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/acl_msgs
)
_generate_msg_nodejs(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/acl_msgs
)
_generate_msg_nodejs(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/acl_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(acl_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/acl_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(acl_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(acl_msgs_generate_messages acl_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_nodejs _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_nodejs _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_nodejs _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_nodejs _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_nodejs _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_nodejs _acl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(acl_msgs_gennodejs)
add_dependencies(acl_msgs_gennodejs acl_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS acl_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs
)
_generate_msg_py(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs
)
_generate_msg_py(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs
)
_generate_msg_py(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs
)
_generate_msg_py(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs
)
_generate_msg_py(acl_msgs
  "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(acl_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(acl_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(acl_msgs_generate_messages acl_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadMotors.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_py _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/ViconState.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_py _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/SMCData.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_py _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/State.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_py _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/IMU.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_py _acl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/peterli/catkin_ws_SMC/src/acl_msgs/msg/QuadAttCmd.msg" NAME_WE)
add_dependencies(acl_msgs_generate_messages_py _acl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(acl_msgs_genpy)
add_dependencies(acl_msgs_genpy acl_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS acl_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/acl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/acl_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(acl_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(acl_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/acl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/acl_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(acl_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(acl_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/acl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/acl_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(acl_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(acl_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/acl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/acl_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(acl_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(acl_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/acl_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(acl_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(acl_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
