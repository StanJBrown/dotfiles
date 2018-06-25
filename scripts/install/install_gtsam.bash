#!/bin/bash
set -e

get_deps() {
  sudo apt-get install -y  \
      libboost-all-dev \
      libtbb-dev 
}

build_gtsam() {
  mkdir -p $HOME/bin
  cd $HOME/bin
  git clone https://bitbucket.org/gtborg/gtsam.git
  cd gtsam
  mkdir -p build
  cd build 
  cmake ..
  make -j4
  sudo make install
}

get_deps
build_gtsam
