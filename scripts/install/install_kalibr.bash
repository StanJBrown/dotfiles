#!/bin/bash
set -e # exit on first error
CATKIN_FOLDER="${HOME}/catkin_ws/src"
ROS_VERSION="$(rosversion -d)"  # get the version of ros that is installed

install_deps() {
    # sudo apt-get update
    sudo apt-get install \
        python-setuptools \
        python-rosinstall \
        python \
        libeigen3-dev \
        libboost-all-dev \
        doxygen \
        libopencv-dev \
        ros-${ROS_VERSION}-vision-opencv \
        ros-${ROS_VERSION}-image-transport-plugins \
        ros-${ROS_VERSION}-cmake-modules \
        python-software-properties \
        software-properties-common \
        libpoco-dev \
        python-matplotlib \
        python-scipy \
        python-git \
        python-pip \
        ipython \
        libtbb-dev \
        libblas-dev \
        liblapack-dev \
        python-catkin-tools \
        libv4l-dev -y
}

install_kalibr () {
    cd $CATKIN_FOLDER
    # git clone https://github.com/ethz-asl/kalibr.git
    cd ..
    rm -rf build
    rm -rf devel 
    catkin_make -j4
}


install_deps
install_kalibr
