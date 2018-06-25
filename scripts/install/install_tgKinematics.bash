#!/bin/bash
set -e

build_tgKinematics() {
    mkdir -p $HOME/projects
    cd $HOME/projects
    git clone git@github.com:tgRobotics/tgKinematics.git
    cd tgKinematics
    mkdir -p build
    cd build
    cmake ..
    make -j8
    sudo make install
}

build_tgKinematics


