#!/bin/bash
set -e

install_ros() {
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

    sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

    sudo apt-get update
    sudo apt-get install ros-kinetic-desktop -y

    sudo rosdep init
    rosdep update

    sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential -y
}

setup_catkin_ws() {
    cd $HOME
    mkdir -p catkin_ws
    cd catkin_ws
    mkdir -p src
    cd src
    catkin_init_workspace
    cd $HOME/catkin_ws/
    catkin build
}

install_ros
setup_catkin_ws
