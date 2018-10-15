/* SMC control for a ROS WMR
* Written by Peter Li/ Zhi Li from HRUST
* Copyright (c) 2018 Peter Li/ Zhi Li
*
* Licensed same as jquery - MIT License
* http://www.opensource.org/licenses/mit-license.php
*
* email: lizhi_haligong@163.com
* Date: 2018-09-03
*/

#include "std_msgs/String.h"
#include <geometry_msgs/Twist.h>
#include <math.h>
#include <nav_msgs/Odometry.h>
#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <sstream>
#include <tf/transform_broadcaster.h>

#include <message_filters/subscriber.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/synchronizer.h>

int counter;
const double pi = 3.141592653;
double imu_test;
//这里要特别注意，要加ConstPtr！！！
//odom_input变成了指针，不再是变量，使用的时候要注意了！
void callback(const nav_msgs::OdometryConstPtr& odom_input,
              const sensor_msgs::ImuConstPtr& imu_input) {
  //控制量同步进入
  //可以开始控制闭环了，讲输出结果给到全局变量，直接输出就好。
  

  ROS_INFO("odom test is: %lf ", (double)odom_input->twist.twist.linear.x);
  ROS_INFO("imu test is: %lf ", (double)imu_input->header.stamp.Time::nsec/1000000); //还是看看精确程度如何
  counter++;
}

int main(int argc, char **argv) {

  ros::init(argc, argv, "sync_control_node"); //对外起个好听的名字
  ros::NodeHandle nh;                         //内部代号土一点有福气
  ros::Publisher pub_;

  message_filters::Subscriber<nav_msgs::Odometry>odom_sub(nh, "/odom",5); //订阅odom
  message_filters::Subscriber<sensor_msgs::Imu>imu_sub(nh, "/imu/data",5); //订阅imu

  pub_ = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 10); //发布cmd_vel
  geometry_msgs::Twist output;

  typedef message_filters::sync_policies::ApproximateTime<nav_msgs::Odometry,sensor_msgs::Imu> MySyncPolicy; //定义这个是为了后面少写一点容易看懂

 
  // ApproximateTime takes a queue size as its constructor argument, hence
  // MySyncPolicy(10)
  //这句是说后面那个参数的设置，我认为应该是说这个数值应该大于你的各个订阅的缓冲区之和，猜测而已。

  message_filters::Synchronizer<MySyncPolicy> sync(MySyncPolicy(10), odom_sub, imu_sub);
  sync.registerCallback(boost::bind(&callback, _1, _2)); //全同步采集，进入callback计算控制量counter
  
ros::Rate loop_rate(30);
  while (nh.ok()) {

    output.angular.z = 0;
    output.linear.x = 0.1 * sin(counter * pi / 50);
    output.linear.y = 0;
    pub_.publish(output);
    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}
