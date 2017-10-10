#!/bin/bash

get_deps() {
  apt-get install libboost-all-dev
  apt-get install libtbb-dev
}

build_gtsam() {
  git clone https://bitbucket.org/gtborg/gtsam.git
  cd gtsam
  mkdir -p build
  cd build 
  cmake ..
  make -j3
  sudo make install
}

get_deps
build_gtsam

