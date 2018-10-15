cmake_minimum_required(VERSION 2.8.3)
project(acl_msgs)
find_package(catkin REQUIRED COMPONENTS 
  roscpp
  rospy
  message_generation 
  std_msgs 
  geometry_msgs
  )

add_message_files(
  DIRECTORY msg
  FILES
  IMU.msg
  QuadAttCmd.msg
  QuadMotors.msg
  State.msg
  SMCData.msg
  ViconState.msg
  )

generate_messages(DEPENDENCIES std_msgs geometry_msgs)

catkin_package(CATKIN_DEPENDS message_runtime std_msgs geometry_msgs)

