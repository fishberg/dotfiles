#!/usr/bin/env bash

# show commands
set -x

# Reference:
# https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debs.html

# ----------------------------------------------------------
# Set locale
# ----------------------------------------------------------
locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

# ----------------------------------------------------------
# Enable required repositories
# ----------------------------------------------------------
sudo apt install software-properties-common
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# ----------------------------------------------------------
# Install development tools (optional)
# ----------------------------------------------------------
sudo apt update && sudo apt install ros-dev-tools

# ----------------------------------------------------------
# Install ROS 2
# ----------------------------------------------------------
sudo apt update
sudo apt upgrade
sudo apt install ros-jazzy-desktop

# ----------------------------------------------------------
# Setup environment
# ----------------------------------------------------------
echo "# ROS install" >> ~/.bashrc
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc

# ----------------------------------------------------------
# Try some examples
# ----------------------------------------------------------
# terminal 1
#ros2 run demo_nodes_cpp talker

# terminal 2
#ros2 run demo_nodes_py listener
