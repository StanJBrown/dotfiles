#!/bin/bash
set -e # exit on first error

set CATKIN_FOLDER="$HOME/catkin_ws/src"

install_deps() {
    sudo apt-get update
    sudo apt-get install
        python-setuptools /
        python-rosinstall /
        python /
        libeigen3-dev /
        libboost-all-dev /
        doxygen /
        libopencv-dev /
        ros-indigo-vision-opencv /
        ros-indigo-image-transport-plugins /
        ros-indigo-cmake-modules /
        python-software-properties /
        software-properties-common /
        libpoco-dev /
        python-matplotlib /
        python-scipy /
        python-git /
        python-pip /
        ipython /
        libtbb-dev /
        libblas-dev /
        liblapack-dev /
        python-catkin-tools /
        libv4l-dev
}

install_kalibr () {
    cd $CATKIN_FOLDER
    git clone https://github.com/ethz-asl/kalibr.git
    cd ..
    catkin build -j4
}

install_deps
install_kalibr
