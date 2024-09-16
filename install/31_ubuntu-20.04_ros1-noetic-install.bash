#!/usr/bin/env bash

# show commands
set -x

# Ubuntu 20.04 -> ROS1 Noetic Ninjemys (2020) [EOL May 2025]
# - Targets: http://wiki.ros.org/noetic
# - ROS1 Releases: http://wiki.ros.org/Distributions

# Installation Instructions:
# - http://wiki.ros.org/noetic/Installation/Ubuntu

# 1.1 Configure your Ubuntu respositories
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo apt update

# Modification
sudo apt install -y curl

# 1.2 Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# 1.3 Setup your keys
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# 1.4 Installation
sudo apt update
sudo apt install -y ros-noetic-desktop-full

# 1.5 Environment setup
echo -e "\n# ROS install\nsource /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# 1.6 Dependencies for building packages
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

# 1.6.1 Initialize rosdep
sudo apt install python3-rosdep
sudo rosdep init
rosdep update

# python3-catkin-tools is in ros repos
sudo apt-get install -y python3-catkin-tools

# run source ~/.bashrc
