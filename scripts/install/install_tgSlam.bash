#!/bin/bah
set -e

build_tgSLAM() {
    mkdir -p $HOME/projects
    cd $HOME/projects
    git clone git@github.com:tgRobotics/tgSLAM.git
    cd tgSLAM
    mkdir -p build
    make -j8
}

build_tgSLAM
