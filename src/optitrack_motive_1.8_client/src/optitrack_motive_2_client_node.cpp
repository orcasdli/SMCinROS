// original source:https://github.com/AgileDrones/OptiTrack-Motive-2-Client 
// by Winter Guerra
// winterg@mit.edu
//https://winter.industries/ 


// Include motion capture framework
#include "optitrack_motive_2_client/motionCaptureClientFramework.h"
// Include ACL message types (https://bitbucket.org/brettlopez/acl_msgs.git)
#include "acl_msgs/ViconState.h"

// Includes for ROS
#include "ros/ros.h"

// Includes for node
#include <boost/program_options.hpp>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <Eigen/Geometry>
#include <iostream>
#include <fstream>

namespace po = boost::program_options;
using namespace Eigen;
const double pi  = 3.1415926535897932384626433832795028841971;


// Used to convert mocap frame (NUE) to LCM NED.
// static Eigen::Matrix3d R_NUE2NED = [] {
//     Eigen::Matrix3d tmp;
//     tmp <<  1, 0, 0, 
//             0, 0, 1, 
//             0, -1, 0;
//     return tmp;
// }();


// Used to convert mocap frame (NUE) to ROS ENU.
static Eigen::Matrix3d R_NUE2ENU = [] {
    Eigen::Matrix3d tmp;
    tmp <<  0, 0, 1, 
            1, 0, 0, 
            0, 1, 0;
    return tmp;
}();

Vector3d positionConvertNUE2ENU(double* positionNUE){
  Vector3d positionNUEVector, positionENUVector;
  positionNUEVector << positionNUE[0], positionNUE[1], positionNUE[2];
  
  positionENUVector = R_NUE2ENU * positionNUEVector;
  return positionENUVector;
}

Quaterniond quaternionConvertNUE2ENU(double* quaternionNUE){
    Quaterniond quaternionInNUE;
    quaternionInNUE.x() = quaternionNUE[0];
    quaternionInNUE.y() = quaternionNUE[1];
    quaternionInNUE.z() = quaternionNUE[2];
    quaternionInNUE.w() = quaternionNUE[3];

    Quaterniond quaternionInENU = Quaterniond(R_NUE2ENU * quaternionInNUE.normalized().toRotationMatrix()
                              * R_NUE2ENU.transpose());
    return quaternionInENU;
}

int main(int argc, char *argv[])
{
  // Keep track of ntime offset.
  int64_t offset_between_windows_and_linux = std::numeric_limits<int64_t>::max();
  ROS_INFO("1");  
  // Init ROS
  ros::init(argc, argv, "optitrack_motive_2_client_node");
  ros::NodeHandle n;

  std::string szMyIPAddress; 
  std::string szServerIPAddress; 

  // Get CMDline arguments for server and local IP addresses.


 //自己加的，方便调整IP read ip from launch, added by Peter Li
  n.getParam(
      "/optitrack_motive_2_client_node/MyIPAddress",
      szMyIPAddress); //因为这个参数不是server那边发送的，是这个节点私有的，因此要加范围
  ROS_INFO("MyIPAddress is %s", szMyIPAddress.c_str());   

  n.getParam(
      "/optitrack_motive_2_client_node/ServerIPAddress",
      szServerIPAddress); //因为这个参数不是server那边发送的，是这个节点私有的，因此要加范围
  ROS_INFO("ServerIPAddress is %s", szServerIPAddress.c_str());     

/*
// test for direct input here dded, by Peter Li
szMyIPAddress = "192.168.50.170";
szServerIPAddress = "192.168.50.171";
*/

  try {
    po::options_description desc ("Options");
    desc.add_options()
        ("help,h", "print usage message")
        ("local",po::value<std::string>(&szMyIPAddress),"local IP Address")
        ("server",po::value<std::string>(&szServerIPAddress), "server address");

    po::variables_map vm;
    try {
      po::store(po::parse_command_line(argc, argv, desc), vm);
      po::notify (vm);
    }
    catch (po::error& e) {
      std::cerr << e.what() << std::endl;
      return 0;
    }
    if (vm.count("help")) {
      std::cout << desc << "\n";
      return 0;
    }
  }
  catch (...) {}

  // Init mocap framework
  agile::motionCaptureClientFramework mocap_ = agile::motionCaptureClientFramework(szMyIPAddress, szServerIPAddress);

  
  // Some vars to calculate twist/acceleration and dts
  // Also keeps track of the various publishers
  std::map<int, ros::Publisher> rosPublishers;
  std::map<int, acl_msgs::ViconState> pastStateMessages;

  while (true){
    // Wait for mocap packet
    mocap_.spin();
    
    std::vector<agile::Packet> mocap_packets = mocap_.getPackets();
  
    for (agile::Packet mocap_packet : mocap_packets){

      // @TODO: Make getPackets return a list.

      // Skip this rigid body if tracking is invalid
      if (!mocap_packet.tracking_valid)
        continue;

      // estimate the windows to linux constant offset by taking the minimum seen offset.
      // @TODO: Make offset a rolling average instead of a latching offset.
      int64_t offset = mocap_packet.transmit_timestamp - mocap_packet.receive_timestamp;
      if (offset < offset_between_windows_and_linux ){
        offset_between_windows_and_linux = offset;
      }
      uint64_t packet_ntime = mocap_packet.mid_exposure_timestamp - offset_between_windows_and_linux;

      // Get past state and publisher (if they exist)
      bool hasPreviousMessage = (rosPublishers.find(mocap_packet.rigid_body_id) != rosPublishers.end());
      ros::Publisher publisher;
      acl_msgs::ViconState lastState;
      acl_msgs::ViconState currentState;
      
      // Initialize publisher for rigid body if not exist.
      if (!hasPreviousMessage){
        std::string topic = "/" + mocap_packet.model_name + "/vicon";

        publisher = n.advertise<acl_msgs::ViconState>(topic, 1);
        rosPublishers[mocap_packet.rigid_body_id] = publisher;
      } else {
        // Get saved publisher and last state
        publisher = rosPublishers[mocap_packet.rigid_body_id];
        lastState = pastStateMessages[mocap_packet.rigid_body_id];
      }

      // Add timestamp
      currentState.header.stamp = ros::Time(packet_ntime/1e9, packet_ntime%(int64_t)1e9);

      // Convert rigid body position from NUE to ROS ENU
      Vector3d positionENUVector = positionConvertNUE2ENU(mocap_packet.pos);
      currentState.pose.position.x = positionENUVector(0);
      currentState.pose.position.y = positionENUVector(1);
      currentState.pose.position.z = positionENUVector(2);
      // Convert rigid body rotation from NUE to ROS ENU
      Quaterniond quaternionENUVector = quaternionConvertNUE2ENU(mocap_packet.orientation);
      currentState.pose.orientation.x = quaternionENUVector.x();
      currentState.pose.orientation.y = quaternionENUVector.y();
      currentState.pose.orientation.z = quaternionENUVector.z();
      currentState.pose.orientation.w = quaternionENUVector.w();
     /***************************************************/
      //加上欧拉角 convert Quaterniond to Eulers, added by Peter Li
      //四元数->旋转矩阵->欧拉角 Quaterniond->RotationMatrix->Eulers
      ////!!!!!Be aware you can convert rad to degree here， which is convenient for comparing with Mtoive panels.
      ///Custom for your need.注意此处是 rad。
      Matrix3d RotationMatrix_cur = quaternionENUVector.toRotationMatrix();
      Vector3d Eulers_cur = RotationMatrix_cur.eulerAngles(2,1,0);
      currentState.Eulers.z = Eulers_cur(0);//yaw(why only within [0,pi] why?)
      currentState.Eulers.y = Eulers_cur(1);//pitch (-pi,pi]
      currentState.Eulers.x = Eulers_cur(2);//roll (-pi,pi]
      /***************************************************/
      currentState.has_pose = true;
      
      // Loop through markers and convert positions from NUE to ENU
      // @TODO since the state message does not understand marker locations.

      if (hasPreviousMessage){
        int64_t dt_nsec = packet_ntime - (lastState.header.stamp.sec*1e9 + lastState.header.stamp.nsec);

       // printf("time interval = %ld",dt_nsec);

        // Calculate twist. Requires last state message.
        currentState.twist.linear.x = (currentState.pose.position.x - lastState.pose.position.x)/(dt_nsec / 1e9);
        currentState.twist.linear.y = (currentState.pose.position.y - lastState.pose.position.y)/(dt_nsec / 1e9);
        currentState.twist.linear.z = (currentState.pose.position.z - lastState.pose.position.z)/(dt_nsec / 1e9);

        // @TODO: not sure how to calculate the angular twist. Is it in local frame or global frame?
        //计算角速度 calculate the derivation of Eulers in global frame, i.e. angular velocity, added by Peter Li

        currentState.twist.angular.x = (currentState.Eulers.x - lastState.Eulers.x)/(dt_nsec / 1e9);//roll
        currentState.twist.angular.y = (currentState.Eulers.y - lastState.Eulers.y)/(dt_nsec / 1e9);//pitch
        currentState.twist.angular.z = (currentState.Eulers.z - lastState.Eulers.z)/(dt_nsec / 1e9);//yaw
        currentState.has_twist = true;
        
        // Calculate accelerations of both positon and Eulers. Requires last state message.
        currentState.pos_accel.x = (currentState.twist.linear.x - lastState.twist.linear.x)/(dt_nsec / 1e9);
        currentState.pos_accel.y = (currentState.twist.linear.y - lastState.twist.linear.y)/(dt_nsec / 1e9);
        currentState.pos_accel.z = (currentState.twist.linear.z - lastState.twist.linear.z)/(dt_nsec / 1e9);
        currentState.Eulers_accel.x = (currentState.twist.angular.x - lastState.twist.angular.x)/(dt_nsec / 1e9);
        currentState.Eulers_accel.y = (currentState.twist.angular.y - lastState.twist.angular.y)/(dt_nsec / 1e9);
        currentState.Eulers_accel.z = (currentState.twist.angular.z - lastState.twist.angular.z)/(dt_nsec / 1e9);

        currentState.has_accel = true;
      }
      
      // Save state for future acceleration and twist computations
      pastStateMessages[mocap_packet.rigid_body_id] = currentState;

      // Publish ROS state.
      publisher.publish(currentState);

    }
  }
}
