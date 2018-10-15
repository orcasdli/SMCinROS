

#include "std_msgs/String.h"
#include <boost/thread.hpp>
#include <geometry_msgs/Twist.h>
#include <math.h>
#include <nav_msgs/Odometry.h>
#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <sstream>
#include <tf/transform_broadcaster.h>


#include <learning_com/Data_def.h>
//文档相关
#include <fstream>
#include <iostream>
#include <string>

/**变量声明区开始**/
int counter;
const double pi = 3.141592653;
double imu_test;
double temp_data;
//SMC参数

/**变量声明区结束**/

/**准备读文档开始**/
std::fstream
    readfile("//home//peterli//catkin_ws_com//src//learning_com//src//1.txt");// custom as you wish
std::string line;
/**准备读文档结束**/

//初始化函数
void initdata() {
  counter = 0;
  imu_test = 0;
  temp_data = 0;
}

//ROS订阅和发布类
class SubscribeAndPublish {
public:
  SubscribeAndPublish() {
    // Topic you want to publish 这里发布cmd_vel控制小车

    pub_ = n_.advertise<geometry_msgs::Twist>("/cmd_vel", 10);

    // Topic you want to subscribe 这里订阅/odom和/imu/data

    sub_odom = n_.subscribe("/odom", 10, &SubscribeAndPublish::callback, this);
    sub_imu =
        n_.subscribe("/imu/data", 10, &SubscribeAndPublish::callback2, this);
  }

  void callback(const nav_msgs::Odometry &odom_input);

  void callback2(const sensor_msgs::Imu &imu_input);

  int node_ok() { return n_.ok(); }

private:
  ros::NodeHandle n_;
  ros::Publisher pub_;
  ros::Subscriber sub_odom;
  ros::Subscriber sub_imu;

}; // End of class SubscribeAndPublish

//main函数
int main(int argc, char **argv) {
  // Initiate ROS
  ros::init(argc, argv, "subscribe_and_publish");

  // Create an object of class SubscribeAndPublish that will take care of
  // everything
  initdata();

  ROS_INFO("rosros1");
  SubscribeAndPublish SAPObject;
  counter = 0;

  /**测试读文档**/
  /*
   while(getline(readfile,line))
    {
      ROS_INFO("rosros2");
      double c = std::stof(line);
      temp_data = c;

   //   ROS_INFO("odom test is: %lf ", (double)odom_input.twist.twist.linear.x);
      ROS_INFO("odom test is: %lf ", (double)c);
    }
  */
  ros::MultiThreadedSpinner s(2); //多线程
  ros::spin(s);

  return 0;
}

void SubscribeAndPublish::callback(const nav_msgs::Odometry &odom_input) {
  ros::Rate loop_rate(30);
  geometry_msgs::Twist output;
  //.... do something with the odom_input and generate the output...
  // 这里应该是控制闭环
  //目前小车坐标系不明。
  //读回当前的v和w
  ROS_INFO("odom v recv is: %lf ", (double)odom_input.twist.twist.linear.x);
  ROS_INFO("odom w recv is: %lf ", (double)odom_input.twist.twist.angular.z);

  /*读文档方法*/
  if (0) {
    ROS_INFO("rosros2"); //测试用
    if (getline(readfile, line)) {

      double c = std::stof(line);
      temp_data = c;

      output.angular.z = 0;
      output.linear.x = c; // 0.1 * sin(counter*pi/50);;
      output.linear.y = 0; //应该是没有值，不是全向轮

      //   ROS_INFO("odom test is: %lf ",
      //   (double)odom_input.twist.twist.linear.x);
      ROS_INFO("odom test is: %lf ", (double)c);

    } else //读到文档尽头就只执行最后一个指令
    {
      output.angular.z = 0;
      output.linear.x = temp_data; // 0.1 * sin(counter*pi/50);
      output.linear.y = 0;

      // ROS_INFO("odom test is: %lf ",
      // (double)odom_input.twist.twist.linear.x);
      ROS_INFO("odom test is: %lf ", (double)temp_data);
    }
  }

  /*不读文档方法*/
  if (1) {
    output.angular.z = 0; // 0.2 * sin(counter * pi / 50);
    output.linear.x = 0.1 * sin(counter * pi / 50);
  }

  pub_.publish(output);
  counter++;
  loop_rate.sleep();
}

void SubscribeAndPublish::callback2(const sensor_msgs::Imu &imu_input) {
  // ROS_INFO("imu test is: %lf /n", (double)imu_input.angular_velocity.x);
  ros::Rate loop_rate(30);
  ROS_INFO("imu test is: %lf ", imu_test);
  imu_test = (double)imu_input.header.stamp.Time::nsec / 1000000;
  loop_rate.sleep();
}

