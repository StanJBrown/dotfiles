#!/bin/bah
set -e

install_deps() {
    sudo apt-get install -y \
        libglew-dev
}

install_pangolin(){
    cd $HOME
    mkdir -p bin
    cd bin
    git clone git@github.com:stevenlovegrove/Pangolin.git
    cd Pangolin
    mkdir -p build
    cd build && cmake .. && make -j4
    sudo make install
}

install_yamlcpp() {
    cd $HOME
    mkdir -p bin
    cd bin
    git clone git@github.com:jbeder/yaml-cpp.git
    cd yaml-cpp
    mkdir build
    cd build && cmake .. && make -j8
    sudo make install
}

build_tgSLAM() {
    mkdir -p $HOME/projects
    cd $HOME/projects
    git clone git@github.com:tgRobotics/tgSLAM.git
    cd tgSLAM
    mkdir -p build
    cd build
    cmake ..
    make -j8
}

install_deps
install_pangolin
install_yamlcpp
build_tgSLAM
