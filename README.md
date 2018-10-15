# SMCinROS

Realize closed-loop control for mobile robots with sliding mode control in ROS. We assume that the mobile robot can already run standalone with '/cmd_vel' message. This project is used for sending desired motive commands to the mobile robot with measurement message of the robots.
We assume only move forward for now in control loop.

Works in Ubuntu 16.04 X64 with ROS Kinetic

Features:
1. Modify the Optitrack Client for Motive 2 (with NatNet 3.0) in ROS to function with an older version (Motive 1.8 with NatNet 2.8 for our case, but can be modified for other version in your case by referring to the package client in your version SDK of NatNet).
	The orginal project is 'https://github.com/AgileDrones/OptiTrack-Motive-2-Client'
	I tried to mark what I have modified in the source files.
!BE ATTENTION!: the Eigen only output Yaw angle in range [0,pi],but Roll and Pitch are [-pi,pi].I don't understand why but this can be a problem. You will have to convert Quaterniond from Motive manually if neccessary.

	If there are some copyright problems, please let me know and tell what I should do :)

2. Write neccessary data into TXT which you can custom easily.
3. Provide calculas functions. I only explain them in detail with Chinese for now. But can understand from reading the code. With these functions, you can design other control methods as your wish.
4. 'SAPcontrol_noSMC' is only an example for closed-loop. 'SAPcontrol_sync' is only an example for using data sync in closed-loop.
5. Some functions are necessary for me only. Custom or delete them as you wish.
6. The accuracy of loop are not guaranteed since it's a ROS project.

## Installation

necessary libs
```bash
sudo apt install libeigen3-dev
````

Download
```bash
# You can build your own work space,copy the files in SRC to yours only and catkin_make.
# or:
git clone https://github.com/orcasdli/SMCinROS.git
````

Run it:
```bash
# Switch to the launch file
# source your own setup.bash! 
# or:
source ~/catkin_ws_SMC/devel/setup.bash
roslaunch runSMC.launch
# open the launch file for customization.
````



Refer to https://github.com/AgileDrones/OptiTrack-Motive-2-Client for install of Optitrack client please if you have problem.

This is my blog (in Chinese) with some infomation about this project:
https://blog.csdn.net/asdli




