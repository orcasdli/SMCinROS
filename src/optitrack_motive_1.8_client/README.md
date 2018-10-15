# ROS OptiTrack Client for Motive 2

## Installation

```bash
# Prerequisites
sudo apt install libeigen3-dev

# Install in ROS workspace. Assumes that 'wstool init' has been run in workspace
cd ~/catkin_ws/src

curl https://raw.githubusercontent.com/AgileDrones/OptiTrack-Motive-2-Client/master/.rosinstall >> .rosinstall
wstool update

cd ../
catkin_make

```

## Running Client Node

```bash
rosrun optitrack_motive_2_client optitrack_motive_2_client_node --server 192.168.1.12 --local 192.168.1.123
```

## Debugging Client Node

```bash
# From root of workspace
catkin_make -DCMAKE_BUILD_TYPE=Debug

gdb --args `catkin_find optitrack_motive_2_client optitrack_motive_2_client_node` --server 192.168.1.12 --local 192.168.1.123
# Common gdb commands
> run
> bt
> quit
```
