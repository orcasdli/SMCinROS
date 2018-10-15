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

//视觉返回的数据单位应该是m，角度是rad，时间是秒s。已经计算出加速度但是目前并没有使用。
// Robo_State_cur中的为视觉实际测量数据，和实际误差，以及算法得到的实际输出
// Robo_State_cur provides actual visual measurement,actual error, and output from SMC algorithm. 
// Robo_State_des仅为给定的期望值
// Robo_State_des only provides desired value for control.

#include "std_msgs/String.h"
#include <boost/thread.hpp>
#include <geometry_msgs/Twist.h>
#include <math.h>
#include <nav_msgs/Odometry.h>
#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <sstream>
#include <tf/transform_broadcaster.h>

#include <algorithm>

// Include ACL message types (https://bitbucket.org/brettlopez/acl_msgs.git)
#include <acl_msgs/ViconState.h>
#include <learning_com/Data_def.h>
//文档相关
#include <fstream>
#include <iostream>
#include <string>

#include <sys/time.h>
#include <time.h>

/**readfile文档**/
std::fstream readfile(
    "//home//peterli//catkin_ws_com//src//learning_com//src//1.txt"); //读取对象
std::string line;
std::ofstream in; //写入对象
/**文档结束**/

int flag;
int SMC_on;
int Slip_com;
//初始化函数
void initdata() {
  counter = 0;
  imu_test = 0;
  temp_data = 0;

  traj_counter = 0;
  file_counter = 0;

  slip_l = 0;
  slip_r = 0;
  slip_c = 0;
  slip_cv = 0;

  SMC_S1 = 0;
  SMC_S2 = 0;

  ASMC_dD1_cur = 0;
  ASMC_dD2_cur = 0;
  ASMC_D1_cur = 0;
  ASMC_D2_cur = 0;

  ASMC_D1_accu = 0;
  ASMC_D2_accu = 0;

  time_interval = 0;
  time_file = 0;

  is_vision_ini = false;

  memset(X_cStor, 0, sizeof(X_cStor));
  memset(Y_cStor, 0, sizeof(Y_cStor));
  memset(Theta_cStor, 0, sizeof(Theta_cStor));
  memset(V_cStor, 0, sizeof(V_cStor));
  memset(W_cStor, 0, sizeof(W_cStor));
  memset(sys_time_his, 0, sizeof(sys_time_his));
  memset(ASMC_dD1, 0, sizeof(ASMC_dD1));
  memset(ASMC_dD2, 0, sizeof(ASMC_dD2));

  memset(Slip_cStor, 0, sizeof(Slip_cStor));
  memset(Slip_cvStor, 0, sizeof(Slip_cvStor));
  memset(Fil_Slip_CStor, 0, sizeof(Fil_Slip_CStor));
  memset(Fil_Slip_CVStor, 0, sizeof(Fil_Slip_CVStor));
  memset(Fil_Slip_C_Sort, 0, sizeof(Fil_Slip_C_Sort));
  memset(Fil_Slip_C_Sort, 0, sizeof(Fil_Slip_C_Sort));
}

// ROS订阅和发布类
class SubscribeAndPublish {
public:
  SubscribeAndPublish() {
    // Topic you want to publish 这里发布cmd_vel控制小车

    pub_ = n_.advertise<geometry_msgs::Twist>("/cmd_vel", 100);


    // Topic you want to subscribe 这里订阅/odom和/imu/data
    sub_vis = n_.subscribe("/vicon", 100, &SubscribeAndPublish::callback, this);
    sub_imu =
        n_.subscribe("/imu/data", 100, &SubscribeAndPublish::callback2, this);
    sub_odom =
        n_.subscribe("/odom", 100, &SubscribeAndPublish::callback3, this);
  }

  void callback(const acl_msgs::ViconState &Vi_input);

  void callback2(const sensor_msgs::Imu &imu_input);

  void callback3(const nav_msgs::Odometry &odom_input);

  int node_ok() { return n_.ok(); }

private:
  ros::NodeHandle n_;
  ros::Publisher pub_;
  ros::Subscriber sub_vis;
  ros::Subscriber sub_odom;
  ros::Subscriber sub_imu;

}; // End of class SubscribeAndPublish

// main函数
int main(int argc, char **argv) {
  // Initiate ROS
  ros::init(argc, argv, "subscribe_and_publish");

  // Create an object of class SubscribeAndPublish that will take care of
  // everything
  initdata(); //初始化

  ROS_INFO("rosros1");
  SubscribeAndPublish SAPObject;
  counter = 0;

  /**测试读文档read file test**/
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
  ros::MultiThreadedSpinner s(3); //多线程
  ros::spin(s);

  return 0;
}

void SubscribeAndPublish::callback(const acl_msgs::ViconState &Vi_input) {
  ros::Rate loop_rate(ctrl_rate);
  geometry_msgs::Twist output;

  n_.getParam(
      "/SAPcontrol/flag",
      flag); //因为这个参数不是server那边发送的，是这个节点私有的，因此要加范围

  n_.getParam(
      "/SAPcontrol/SMC_on",
      SMC_on); //因为这个参数不是server那边发送的，是这个节点私有的，因此要加范围

  n_.getParam(
      "/SAPcontrol/Slip_com",
      Slip_com); //因为这个参数不是server那边发送的，是这个节点私有的，因此要加范围
  if (counter == 0) {
    ROS_INFO("flag is %d", flag);
    ROS_INFO("SMC_on is %d", SMC_on);
    ROS_INFO("Slip_com is %d", Slip_com);
  }

  TransStorage(2); //存储真实时间历史数据，ms
  

  //.... do something with the odom_input and generate the output...
  // 这里应该是控制闭环
  //目前小车坐标系不明。
  //判断是否所有状态都可以获取：如果可以就取出并赋值否则全都置为0。
  double yaw = 0;
  double roll = 0;
  double pitch = 0;
  double qx = 0;
  double qy = 0;
  double qz = 0;
  double qw = 0;

  //!BE ATTENTION!: the Eigen only output Yaw angle in range [0,pi],but Roll and Pitch are [-pi,pi].
  //I don't understand why but this can be a problem. Here I convert Quaterniond from Motive manually.

  if ((Vi_input.has_pose) && (Vi_input.has_twist) && (Vi_input.has_accel)) {

    if (is_vision_ini == false) {
      Robo_State_init.X_a = (double)Vi_input.pose.position.x; //单位是m
      Robo_State_init.Y_a = (double)Vi_input.pose.position.y;
      // Robo_State_init.Theta_a = (double)Vi_input.Eulers.z; // Yaw 单位是°

      qx = (double)Vi_input.pose.orientation.x;
      qy = (double)Vi_input.pose.orientation.y;
      qz = (double)Vi_input.pose.orientation.z;
      qw = (double)Vi_input.pose.orientation.w;
      GetEulerAngles(qx, qy, qz, qw, pitch, roll, yaw);
      Robo_State_init.Theta_a = pitch;

      if (flag == 2) {
        if (Robo_State_init.Theta_a > pi) {
          Robo_State_init.Theta_a = Robo_State_init.Theta_a - 2 * pi;
        } else if (Robo_State_init.Theta_a < -pi) {
          Robo_State_init.Theta_a = Robo_State_init.Theta_a + 2 * pi;
        }
      }

      Robo_State_init.dX_a = (double)Vi_input.twist.linear.x; //单位是m/s
      Robo_State_init.dY_a = (double)Vi_input.twist.linear.y;
      /*
            Robo_State_init.Theta_a =
         atan2(Robo_State_init.dY_a,Robo_State_init.dX_a);
            if (Robo_State_init.Theta_a<0)
            {
               Robo_State_init.Theta_a = Robo_State_init.Theta_a + 2*pi;
            }

      */
      Robo_State_init.V_a =
          sqrt(Robo_State_cur.dX_a * Robo_State_cur.dX_a +
               Robo_State_cur.dY_a * Robo_State_cur.dY_a); //只考虑正值
      Robo_State_init.W_a = (double)Vi_input.twist.angular.z; // yaw，单位是°/s

      if (Robo_State_init.V_a >= 0.2) {
        Robo_State_init.V_a = 0.2;
      } else if (Robo_State_init.V_a <= -0.2) {
        Robo_State_init.V_a = -0.2;
      }
      if (Robo_State_init.W_a >= 0.2) {
        Robo_State_init.W_a = 0.2;
      } else if (Robo_State_init.W_a <= -0.2) {
        Robo_State_init.W_a = -0.2;
      }

      // Robo_State_init = Robo_State_cur;                      //初始值
      is_vision_ini = true;
    } else {
      Robo_State_cur.X_a = (double)Vi_input.pose.position.x; //单位是m
      Robo_State_cur.X_a =
          Robo_State_cur.X_a - Robo_State_init.X_a; //减去初始值

      Robo_State_cur.Y_a = (double)Vi_input.pose.position.y;
      Robo_State_cur.Y_a =
          Robo_State_cur.Y_a - Robo_State_init.Y_a; //减去初始值

      // Robo_State_cur.Theta_a = (double)Vi_input.Eulers.z; // Yaw 单位是°

      Robo_State_cur.dX_a = (double)Vi_input.twist.linear.x; //单位是m/s
      Robo_State_cur.dY_a = (double)Vi_input.twist.linear.y;

      qx = (double)Vi_input.pose.orientation.x;
      qy = (double)Vi_input.pose.orientation.y;
      qz = (double)Vi_input.pose.orientation.z;
      qw = (double)Vi_input.pose.orientation.w;
      GetEulerAngles(qx, qy, qz, qw, pitch, roll, yaw);
      Robo_State_cur.Theta_a =
          pitch - Robo_State_init.Theta_a; //实际是yaw，但是这样转化出来是pitch

      if (flag == 1) {
        if (traj_counter > 300) {

          if (Robo_State_cur.Theta_a < 0) {
            Robo_State_cur.Theta_a = Robo_State_cur.Theta_a + 2 * pi;
          }
        }
      } else if (flag == 2) {
        if (Robo_State_init.Theta_a > pi) {
          Robo_State_init.Theta_a = Robo_State_init.Theta_a - 2 * pi;
        } else if (Robo_State_init.Theta_a < -pi) {
          Robo_State_init.Theta_a = Robo_State_init.Theta_a + 2 * pi;
        }
      }

      Robo_State_cur.V_a =
          sqrt(Robo_State_cur.dX_a * Robo_State_cur.dX_a +
               Robo_State_cur.dY_a * Robo_State_cur.dY_a); //只考虑正值
      Robo_State_cur.W_a = (double)Vi_input.twist.angular.z; // yaw，单位是°/s

      if (Robo_State_cur.V_a >= 0.2) {
        Robo_State_cur.V_a = 0.2;
      } else if (Robo_State_cur.V_a <= -0.2) {
        Robo_State_cur.V_a = -0.2;
      }
      if (Robo_State_cur.W_a >= 0.2) {
        Robo_State_cur.W_a = 0.2;
      } else if (Robo_State_cur.W_a <= -0.2) {
        Robo_State_cur.W_a = -0.2;
      }

      //如果进行SMC就进入控制模式，如果不进行就开环运动。直线，圆，正弦
      //获取期望位置和速度有两种方式，一种是直接根据时间进行计算，一种是根据读文档。
      //先用前一种，后一种涉及到数据判断比较麻烦。
      get_desired_pose(); //获取期望的位置和速度
      get_err_pose();     //获取期望与实际的差值
      get_slip(); // 获取滤波滑转率和其变化速度，fil_slip_c，fil_slip_c

      if (SMC_on == 2) { //自适应SMC
        set_paras();     //参数设定
        get_SMC_S();
        get_ASMC_D(); //求参数D,自适应SMC
        run_A_SMC();  // adaptive SMC 二选一
        if (Slip_com != 0) {
          slip_compen();
        }
        output.angular.z = Robo_State_cur.W_c;
        output.linear.x = Robo_State_cur.V_c;
      } else if (SMC_on == 1) // 普通SMC
      {
        set_paras(); //参数设定
        get_SMC_S();
        run_SMC(); // 普通SMC
        if (Slip_com != 0) {
          slip_compen();
        }

        output.angular.z = Robo_State_cur.W_c;
        output.linear.x = Robo_State_cur.V_c;
      } else if (SMC_on == 0) //开环运动
      {
        Robo_State_cur.W_c = Robo_State_des.W_c;
        Robo_State_cur.V_c = Robo_State_des.V_c;
        if (Slip_com != 0) {
          slip_compen();
        }
        output.angular.z = Robo_State_cur.W_c;
        output.linear.x = Robo_State_cur.V_c;
      }

      //读回当前的v和w，目前没用上

      // ROS_INFO("odom w recv is: %lf ",
      // (double)odom_input.twist.twist.angular.z);

      /*读文档方法read file*/
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

      //***************write file写文档开始********************************************//

      if (counter == 0) {
        time_t t = std::time(0);
        struct tm *now = std::localtime(&t);
        std::string file_name;
        std::string file_path;
        file_path = "//home//peterli//catkin_ws_com//data_history//";
        // the name of bag file is better to be determined by the system time
        file_name = int2string(now->tm_year + 1900) + '-' +
                    int2string(now->tm_mon + 1) + '-' +
                    int2string(now->tm_mday) + '-' + int2string(now->tm_hour) +
                    '-' + int2string(now->tm_min) + '-' +
                    int2string(now->tm_sec) + ".txt";
        file_name = file_path + file_name;

        in.open(
            file_name,
            std::ios::
                trunc); // ios::trunc表示在打开文件前将文件清空,由于是写入,文件不存在则创建

        time_file = 0;
      } else {
        if (n_.ok()) {
          ROS_INFO("FILE is writing line: %d ", counter);
          time_file = time_file + time_interval;

          in << std::fixed << std::setprecision(6) << time_file / 1000 << "\t"
             << Robo_State_des.X_c << "\t" << Robo_State_des.Y_c << "\t"
             << Robo_State_des.Theta_c << "\t" << Robo_State_des.V_c << "\t"
             << Robo_State_des.W_c << "\t" << Robo_State_cur.X_a << "\t"
             << Robo_State_cur.Y_a << "\t" << Robo_State_cur.Theta_a << "\t"
             << Robo_State_cur.V_a << "\t" << Robo_State_cur.W_a << "\t"
             << Robo_State_cur.X_e << "\t" << Robo_State_cur.Y_e << "\t"
             << Robo_State_cur.Theta_e << "\t" << Robo_State_cur.V_e << "\t"
             << Robo_State_cur.W_e << "\t" << fil_slip_c << "\t" << fil_slip_cv
             << "\t" << Robo_State_cur.V_c << "\t" << Robo_State_cur.W_c << "\t"
             << ASMC_D1_accu << "\t" << ASMC_D2_accu << "\t" << std::endl;
        } else {
          ROS_INFO("FILE is closed ");
          in.close(); //关闭文件
        }
      }
      //***************写文档结束********************************************//

      pub_.publish(output);
      counter++;
    }

  } else {
    Robo_State_cur = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    ROS_INFO(
        "Vision is not ready! Please wait for 30 secs before checking error!");
  }

  loop_rate.sleep();
}

void SubscribeAndPublish::callback2(const sensor_msgs::Imu &imu_input) {
  // for IMU data
  ros::Rate loop_rate(ctrl_rate);
  /*
  ROS_INFO("imu test is: %lf ", imu_test);
  imu_test = (double)imu_input.header.stamp.Time::nsec / 1000000;
  */
  loop_rate.sleep();
}

void SubscribeAndPublish::callback3(const nav_msgs::Odometry &odom_input) {
  //留作测试用的轮式里程仪，目前应该用不上
  // for wheel odometry data
  ros::Rate loop_rate(ctrl_rate);
  geometry_msgs::Twist output;
  //读回当前轮式里程仪的v和w
  /*
  ROS_INFO("odom v recv is: %lf ", (double)odom_input.twist.twist.linear.x);
  ROS_INFO("odom w recv is: %lf ", (double)odom_input.twist.twist.angular.z);
*/
  loop_rate.sleep();
}

//*******SMC控制函数*********//
//*******SMC Functions*********//

//获取期望位姿
void get_desired_pose() {
  //给入每个时刻的期望位置，通过期望位置得到得到期望的速度
  if (flag == 1) {
    //根据位置推算：正弦很难实现，圆有较大误差
    //目前以圆为例,整圆的话转向角因为有从pi到0或者-pi到+pi的跳变，

    // traj_counter/ctrl_rate*pi*2 代表1秒跑完一圆,r=1,t=60,60秒一圈
    double r = 0.5; //单位是m
    double t = 60;
    Robo_State_des.X_c = r * sin(traj_counter / ctrl_rate * 2 * pi / t);
    Robo_State_des.Y_c = -r * cos(traj_counter / ctrl_rate * 2 * pi / t) + r;
    TransStorage(4);

    //计算期望线速度，根据系统时间之差计算Vc，Wc
    //计算当前时间与上一时间的差,ms
    time_interval = sys_time_his[0] - sys_time_his[1];

    double X_d = 0;
    double Y_d = 0;
    X_d =
        CentralDerivative(time_interval, 0, 0); //实际上是相当于前一时刻的微分值
    Y_d = CentralDerivative(time_interval, 0, 1);
    Robo_State_des.V_c =
        sqrt(X_d * X_d + Y_d * Y_d) * 1000; //因为除以了ms，要变成m/s
    if (Robo_State_des.V_c >= 0.2) {
      Robo_State_des.V_c = 0.2;
    } else if (Robo_State_des.V_c <= -0.2) {
      Robo_State_des.V_c = -0.2;
    }
    ROS_INFO("circle vc is: %lf ", (double)Robo_State_des.V_c);


    // Theta_c是速度与ｘ轴正方方向的夹角，这样得到的转向角范围就就是０～2pi
    Robo_State_des.Theta_c = atan2(Y_cStor[0] - 0.5, X_cStor[0]);
    // atan2(Y_d , X_d);
    Robo_State_des.Theta_c = Robo_State_des.Theta_c + pi / 2;

    if ((Robo_State_des.Theta_c < (0)) &&
        (Robo_State_des.Theta_c >= (-pi / 2)) &&
        (traj_counter > 300)) // 10秒之前可能有负值
    {
      Robo_State_des.Theta_c = Robo_State_des.Theta_c + 2 * pi;
    }

    ROS_INFO("circle Theta_c is: %lf ", (double)Robo_State_des.Theta_c);
    TransStorage(5);
    Robo_State_des.W_c =
        CentralDerivative(time_interval, 0, 2) * 1000; //因为除以了ms，要变成°/s
    if (traj_counter <= 4) {
      Robo_State_des.W_c = 0;
    } else {
      if (Robo_State_des.W_c >= 0.2) {
        Robo_State_des.W_c = 0.2;
      } else if (Robo_State_des.W_c <= -0.2) {
        Robo_State_des.W_c = -0.2;
      }
    }


    TransStorage(1);

  } else if (flag == 2) {
    //余弦
    //车面向X方向,由于车身不是全向的，初始速度必须沿着X方向，而正弦要求车身初始速度沿着Y方向，因此采用余弦。
    double r = 0.4;
    Robo_State_des.X_c = 2 * pi * traj_counter / ctrl_rate / 120;
    Robo_State_des.Y_c = r * cos(Robo_State_des.X_c * 3.5) - r;


    TransStorage(4);

    //计算期望线速度，根据系统时间之差计算Vc，Wc
    //计算当前时间与上一时间的差,ms
    time_interval = sys_time_his[0] - sys_time_his[1];

    double X_d = 0;
    double Y_d = 0;
    X_d =
        CentralDerivative(time_interval, 0, 0); //实际上是相当于前一时刻的微分值
    Y_d = CentralDerivative(time_interval, 0, 1);
    Robo_State_des.V_c =
        sqrt(X_d * X_d + Y_d * Y_d) * 1000; //因为除以了ms，要变成m/s
    if (Robo_State_des.V_c >= 0.2) {
      Robo_State_des.V_c = 0.2;
    } else if (Robo_State_des.V_c <= -0.2) {
      Robo_State_des.V_c = -0.2;
    }
    Robo_State_des.Theta_c =
        //    atan2(Y_cStor[0] , X_cStor[0]);
        atan2(Y_d, X_d);

    if (Robo_State_des.Theta_c > pi) {
      Robo_State_des.Theta_c = Robo_State_des.Theta_c - 2 * pi;
    } else if (Robo_State_des.Theta_c < -pi) {
      Robo_State_des.Theta_c = Robo_State_des.Theta_c + 2 * pi;
    }

    ROS_INFO("cos Theta_c is: %lf ", (double)Robo_State_des.Theta_c);
    TransStorage(5);
    Robo_State_des.W_c =
        CentralDerivative(time_interval, 0, 2) * 1000; //因为除以了ms，要变成°/s
    if (traj_counter <= 2) {
      Robo_State_des.W_c = 0;
    } else {
      if (Robo_State_des.W_c >= 0.2) {
        Robo_State_des.W_c = 0.2;
      } else if (Robo_State_des.W_c <= -0.2) {
        Robo_State_des.W_c = -0.2;
      }
    }

    TransStorage(1);

  } 
  traj_counter++;
}
//获取期望跟实际的偏差
void get_err_pose() {

  Robo_State_cur.X_e =
      cos(Robo_State_des.Theta_c) * (Robo_State_des.X_c - Robo_State_cur.X_a) +
      sin(Robo_State_des.Theta_c) * (Robo_State_des.Y_c - Robo_State_cur.Y_a);
  Robo_State_cur.Y_e =
      -sin(Robo_State_des.Theta_c) * (Robo_State_des.X_c - Robo_State_cur.X_a) +
      cos(Robo_State_des.Theta_c) * (Robo_State_des.Y_c - Robo_State_cur.Y_a);
  Robo_State_cur.Theta_e = Robo_State_des.Theta_c - Robo_State_cur.Theta_a;

  if (flag == 1) {
    if (Robo_State_cur.Theta_e > pi) {
      Robo_State_cur.Theta_e = Robo_State_cur.Theta_e - 2 * pi;
    } else if (Robo_State_cur.Theta_e < -pi) {
      Robo_State_cur.Theta_e = Robo_State_cur.Theta_e + 2 * pi;
    } else {
      Robo_State_cur.Theta_e = Robo_State_cur.Theta_e;
    }
  }

  Robo_State_cur.V_e = Robo_State_des.V_c - Robo_State_cur.V_a;
  Robo_State_cur.W_e = Robo_State_des.W_c - Robo_State_cur.W_a;
}

//数组移位函数，测量得到的移位位置和速度,系统时间缓存，自适应滑模系数
void TransStorage(int tran_signature) {
  if (tran_signature == 0) {
    for (int i = STOR_LEN - 2; i >= 0;
         i--) ///数组数据依次向后移一位，其中第0位不变
    {
      X_cStor[i + 1] = X_cStor[i];
      Y_cStor[i + 1] = Y_cStor[i];
      Theta_cStor[i + 1] = Theta_cStor[i];
    }
    X_cStor[0] = Robo_State_des.X_c;
    Y_cStor[0] = Robo_State_des.Y_c;
    Theta_cStor[0] = Robo_State_des.Theta_c;
  } else if (tran_signature == 1) {
    for (int i = STOR_LEN - 2; i >= 0;
         i--) ///数组数据依次向后移一位，其中第0位不变
    {
      V_cStor[i + 1] = V_cStor[i];
      W_cStor[i + 1] = W_cStor[i];
    }
    V_cStor[0] = Robo_State_des.V_c;
    W_cStor[0] = Robo_State_des.W_c;
  } else if (tran_signature == 2) {

    for (int i = STOR_LEN - 2; i >= 0;
         i--) ///数组数据依次向后移一位，其中第0位不变
    {
      sys_time_his[i + 1] = sys_time_his[i];
    }
    sys_time_his[0] = sysLocalTime();
  } else if (tran_signature == 3) {
    for (int i = STOR_LEN - 2; i >= 0;
         i--) ///数组数据依次向后移一位，其中第0位不变
    {
      ASMC_dD1[i + 1] = ASMC_dD1[i];
      ASMC_dD2[i + 1] = ASMC_dD2[i];
    }
    ASMC_dD1[0] = ASMC_dD1_cur;
    ASMC_dD2[0] = ASMC_dD2_cur;
  } else if (tran_signature == 4) {
    for (int i = STOR_LEN - 2; i >= 0;
         i--) ///数组数据依次向后移一位，其中第0位不变
    {
      X_cStor[i + 1] = X_cStor[i];
      Y_cStor[i + 1] = Y_cStor[i];
    }
    X_cStor[0] = Robo_State_des.X_c;
    Y_cStor[0] = Robo_State_des.Y_c;
  } else if (tran_signature == 5) {
    for (int i = STOR_LEN - 2; i >= 0;
         i--) ///数组数据依次向后移一位，其中第0位不变
    {
      Theta_cStor[i + 1] = Theta_cStor[i];
    }
    Theta_cStor[0] = Robo_State_des.Theta_c;
  } else if (tran_signature == 6) {
    for (int i = STOR_LEN - 2; i >= 0;
         i--) ///数组数据依次向后移一位，其中第0位不变
    {
      Slip_cStor[i + 1] = Slip_cStor[i];
    }
    Slip_cStor[0] = slip_c;
  } else if (tran_signature == 7) {
    for (int i = STOR_LEN - 2; i >= 0;
         i--) ///数组数据依次向后移一位，其中第0位不变
    {
      Slip_cvStor[i + 1] = Slip_cvStor[i];
    }
    Slip_cvStor[0] = slip_cv;
  }
}

/*********************************************************/
/* Central Derivative                                    */
/* 此处为中心微分法，给定i为0即为x0，                         */
/* 则Storage[0]为f(x0),此方法为求f(x)在x1处的微分值;         */
/* 数组中0位为最新数据                                      */
/* 形参分别代表：微分时间，默认，求X线速度为0，Y为1             */
/* 角速度在另一个节点求了，只要角度就行                        */
/********************************************************/
double CentralDerivative(double time, int i, int signature) {
  double def = 0;
  if (time == 0) // 时间可能不对，就先取均值
  {
    time = 1 / ctrl_rate;
  }

  if (signature == 0) {
    def = (X_cStor[i] - X_cStor[i + 2]) / (2 * time);
    return def;
  } else if (signature == 1) {
    def = (Y_cStor[i] - Y_cStor[i + 2]) / (2 * time);
    return def;
  } else if (signature == 2) {
    def = (Theta_cStor[i] - Theta_cStor[i + 2]) / (2 * time);
    return def;
  } else if (signature == 3) {
    def = (Slip_cStor[i] - Slip_cStor[i + 2]) / (2 * time);
    return def;
  } else
    return 0;
}

/***************************************************************/
/* Trapezoid Integral                                          */
/* 此处为梯形积分法，给定i为0即为x0，                               */
/* 则Storage[0]为f(x0),此方法为求f(x)在x0~x1处的积分值;            */
/* 数组中0位为最新数据，注意积分是累加的                             */
/* 形参分别代表：积分时间，默认，一重、二重积分，x、y、l对应1、2、3     */
/**************************************************************/
double TrapezoidIntegral(double time, int i, int signature) {
  double intergral = 0;
  if (signature == 0) {
    intergral = (ASMC_dD1[i] + ASMC_dD1[i + 1]) *
                (time * 0.5); /// f(x0)~f(x1)的积分,1/2=0.5
  } else if (signature == 1) {
    intergral = (ASMC_dD2[i] + ASMC_dD2[i + 1]) *
                (time * 0.5); /// f(x0)~f(x1)的积分,1/2=0.5
  }
  return intergral;
}

/***************************************************************/
/*Median filter                                                */
/*中值滤波,去掉临时数组中的一定最大数和最小数并取均值                  */
/***************************************************************/

double CtrlDataFilter(int sign) {
  double Filter_Result = 0;

  double temp = 0;
  int extreme = 2; //去掉两个最大和最小值，exclude extremes
  int i = 0;
  if (sign == 0) {
    if (Filter_Len <= 1) {
      Filter_Result = slip_c;
    } else if (Filter_Len > 1) {
      for (i = Filter_Len - 2; i >= 0; i--)
      ///数组数据依次向后移一位，其中第0位不变
      {
        Fil_Slip_CStor[i + 1] = Fil_Slip_CStor[i];
      }
      Fil_Slip_CStor[0] = slip_c;

      memcpy(Fil_Slip_C_Sort, Fil_Slip_CStor, sizeof(Fil_Slip_CStor));
      std::sort(Fil_Slip_C_Sort, Fil_Slip_C_Sort + 10);
      for (int j = extreme; j < (Filter_Len - 2); j++) {
        temp += Fil_Slip_C_Sort[j];
      }
      Filter_Result = temp / (Filter_Len - 2 * extreme);
    }
  } else if (sign == 1) {
    if (Filter_Len <= 1) {
      Filter_Result = slip_cv;
    } else if (Filter_Len > 1) {
      for (i = Filter_Len - 2; i >= 0; i--)
      ///数组数据依次向后移一位，其中第0位不变
      {
        Fil_Slip_CVStor[i + 1] = Fil_Slip_CVStor[i];

      }
      Fil_Slip_CVStor[0] = slip_cv;

      memcpy(Fil_Slip_CV_Sort, Fil_Slip_CVStor, sizeof(Fil_Slip_CVStor));
      std::sort(Fil_Slip_CV_Sort, Fil_Slip_CV_Sort + 10);

      for (int j = extreme; j < (Filter_Len - 2); j++) {
        temp += Fil_Slip_CV_Sort[j];
      }
      Filter_Result = temp / (Filter_Len - 2 * extreme);
    }
  }

  return Filter_Result;
}

double sysLocalTime() {
  struct timeval tv;
  gettimeofday(&tv, NULL);
  double time_now = 0;
  //   printf("second:%ld\n",tv.tv_sec);  //秒
  //   printf("millisecond:%ld\n",tv.tv_sec*1000 + tv.tv_usec/1000);  //毫秒 ms
  //   printf("microsecond:%ld\n",tv.tv_sec*1000000 + tv.tv_usec);  //微秒 μs
  return time_now = tv.tv_sec * 1000 + tv.tv_usec / 1000; // ms
}

//主控函数
//滑转补偿
void get_slip() {
  //整车滑转率,线速度V才算滑转率，角速度方向的认为是滑移等有界干扰

  double V_c = Robo_State_des.V_c;
  double V_a = Robo_State_cur.V_a;
  //按照传统的滑模方法进行补偿
  // 除零保护
  if (V_c >= 0.00001) {
    slip_c =
        (V_c - V_a) /
        V_c; 
    if (slip_c <= 0) {
      slip_c = 0;
    }

  } else {
    slip_c = 0; //期望速度太小，认为没有滑转
  }

  TransStorage(6);

  time_interval = sys_time_his[0] - sys_time_his[1];
  if ((V_c >= 0.0001) || (V_a >= 0.0001)) {
    slip_cv = CentralDerivative(time_interval, 0, 3);
  } else {
    slip_cv = 0; //太小了不计算滑转，也可能是卡住了,这时候补偿应该也没用了
  }
  TransStorage(7);

  fil_slip_c = CtrlDataFilter(0);  // slip_c
  fil_slip_cv = CtrlDataFilter(1); // slip_cv
}
void slip_compen() {

}

//普通滑模
//regular SMC with fast double reaching law for WMR
void run_SMC() {
  double K11 = 0;
  double K12 = 0;
  double K13 = 0;
  double K21 = 0;
  double K22 = 0;
  double K23 = 0;

  double A11 = 0;
  double A12 = 0;
  double A21 = 0;
  double A22 = 0;
  if (flag == 1) {
    K11 = SMC_paras1.K_pa11;
    K12 = SMC_paras1.K_pa12;
    K13 = SMC_paras1.K_pa13;
    K21 = SMC_paras1.K_pa21;
    K22 = SMC_paras1.K_pa22;
    K23 = SMC_paras1.K_pa23;

    A11 = SMC_paras1.A_pa11;
    A12 = SMC_paras1.A_pa12;
    A21 = SMC_paras1.A_pa21;
    A22 = SMC_paras1.A_pa22;
  } else if (flag == 2) {
    K11 = SMC_paras2.K_pa11;
    K12 = SMC_paras2.K_pa12;
    K13 = SMC_paras2.K_pa13;
    K21 = SMC_paras2.K_pa21;
    K22 = SMC_paras2.K_pa22;
    K23 = SMC_paras2.K_pa23;

    A11 = SMC_paras2.A_pa11;
    A12 = SMC_paras2.A_pa12;
    A21 = SMC_paras2.A_pa21;
    A22 = SMC_paras2.A_pa22;
  }

  double epsilon = 0.00006; //

  double temp3 = Robo_State_des.V_c * Robo_State_des.V_c * Robo_State_cur.Y_e *
                 Robo_State_cur.Y_e;
  double temp1 = Robo_State_cur.Y_e / (1 + temp3);
  double temp2 = Robo_State_des.V_c / (1 + temp3);

  Robo_State_cur.W_c =
      Robo_State_des.W_c + temp1 * Robo_State_des.V_c +
      temp2 * Robo_State_des.V_c * sin(Robo_State_cur.Theta_e) +
      K21 * pow(fabs(SMC_S2), A21) * Sgn(SMC_S2, epsilon) +
      K22 * pow(fabs(SMC_S2), A22) * Sgn(SMC_S2, epsilon) + K23 * SMC_S2;

  Robo_State_cur.V_c = Robo_State_cur.Y_e * Robo_State_des.W_c +
                       Robo_State_des.V_c * cos(Robo_State_cur.Theta_e) +
                       K11 * pow(fabs(SMC_S1), A11) * Sgn(SMC_S1, epsilon) +
                       K12 * pow(fabs(SMC_S1), A12) * Sgn(SMC_S1, epsilon) +
                       K13 * SMC_S1;
  Robo_State_cur.V_c = fabs(Robo_State_cur.V_c); //只考虑向前运动，不然太复杂了
}

//设置滑模控制参数
void set_paras() { 
  //参数组1,圆
  // for circle tracking
  SMC_paras1.K_pa11 = 0.005;
  SMC_paras1.K_pa12 = 0.005;
  SMC_paras1.K_pa13 = 0.01;

  SMC_paras1.K_pa21 = 0.1;
  SMC_paras1.K_pa22 = 0.1;
  SMC_paras1.K_pa23 = 1;

  SMC_paras1.A_pa11 = 0.1;
  SMC_paras1.A_pa12 = 0.1;

  SMC_paras1.A_pa21 = 2.0;
  SMC_paras1.A_pa22 = 2.0;

  SMC_paras1.Mu_pa11 = 0.0005;
  SMC_paras1.Mu_pa12 = 0.0005;
  SMC_paras1.Mu_pa21 = 0.002;
  SMC_paras1.Mu_pa22 = 0.002;

  //参数组2，余弦
// for cosine tracking
  SMC_paras2.K_pa11 = 0.005;
  SMC_paras2.K_pa12 = 0.005;
  SMC_paras2.K_pa13 = 0.01;
  SMC_paras2.K_pa21 = 0.1;
  SMC_paras2.K_pa22 = 0.1;
  SMC_paras2.K_pa23 = 1;

  SMC_paras2.A_pa11 = 0.1;
  SMC_paras2.A_pa12 = 0.1;
  SMC_paras2.A_pa21 = 2;
  SMC_paras2.A_pa22 = 2;
  SMC_paras2.Mu_pa11 = 0.001;
  SMC_paras2.Mu_pa12 = 0.001;
  SMC_paras2.Mu_pa21 = 0.004;
  SMC_paras2.Mu_pa22 = 0.004;
}
void get_SMC_S() {
  SMC_S1 = Robo_State_cur.X_e;
  SMC_S2 =
      Robo_State_cur.Theta_e +
      atan(Robo_State_cur.V_a * Robo_State_cur.Y_e); 
}

//符号函数
double Sgn(double s, double epsilon) {
  double r = 0;
  //除零保护
  if ((fabs(s) < epsilon) && (epsilon < 1e-30))
    return 0;

  if (s < -epsilon)
    r = -1;
  else if (s > epsilon)
    r = 1;
  else
    r = s / epsilon;
  return r;
}

//写文档
std::string int2string(int value) {
  std::stringstream ss;
  ss << value;
  return ss.str();
}

//四元数转欧拉角
// Quaterniond to Eulers
void GetEulerAngles(double qx, double qy, double qz, double qw, double &pitch,
                    double &roll, double &yaw) //四元数转欧拉角
{
  const double w2 = qw * qw;
  const double x2 = qx * qx;
  const double y2 = qy * qy;
  const double z2 = qz * qz;
  const double unitLength =
      w2 + x2 + y2 + z2; // Normalised == 1, otherwise correction divisor.
  const double abcd = qw * qx + qy * qz;
  const double eps =
      1e-7; // TODO: pick from your math lib instead of hardcoding.
  const double pi = 3.14159265358979323846; // TODO: pick from your math lib
                                            // instead of hardcoding.

  if (abcd > (0.5 - eps) * unitLength) {
    pitch = 2 * atan2(qy, qw);
    roll = pi;
    yaw = 0;
  } else if (abcd < (-0.5 + eps) * unitLength) {
    pitch = -2 * ::atan2(qy, qw);
    roll = -pi;
    yaw = 0;
  } else {
    const double adbc = qw * qz - qx * qy;
    const double acbd = qw * qy - qx * qz;
    pitch = ::atan2(2 * adbc, 1 - 2 * (z2 + x2));
    roll = ::asin(2 * abcd / unitLength);
    yaw = ::atan2(2 * acbd, 1 - 2 * (y2 + x2));
  }
}