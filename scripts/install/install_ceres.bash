#!/bin/bash
set -e

get_deps (){
    sudo apt-get update 
    sudo apt-get install -y \
      libgoogle-glog-dev \
      libatlas-base-dev \
      libeigen3-dev \
      libsuitesparse-dev 
}

build_ceres() {
  mkdir -p $HOME/bin 
  cd $HOME/bin
  git clone https://ceres-solver.googlesource.com/ceres-solver
  cd ceres-solver
  mkdir -p build
  cd build
  cmake ..
  make -j4
  make test

  sudo make install
}

get_deps
build_ceres

