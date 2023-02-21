#!/usr/bin/env bash

# http://wiki.ros.org/noetic/Installation/Ubuntu

# 1.2 Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# 1.3 Setup your keys
sudo apt-get -q -y install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# 1.4 Installation
sudo apt-get -q -y update
sudo apt-get -q -y install ros-noetic-desktop-full

# 1.5 Environment setup
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# 1.6 Dependencies for building packages
sudo apt-get install -q -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt-get install -q -y python3-rosdep
sudo rosdep init
rosdep update

# add catkin from apt
sudo apt-get install -q -y python3-catkin-tools
#pip3 install -U catkin_tools
