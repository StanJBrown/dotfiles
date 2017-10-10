#!/bin/bash
set -e

get_deps (){
    # CMake
    sudo apt-get install cmake
    # google-glog + gflags
    sudo apt-get install libgoogle-glog-dev
    # BLAS & LAPACK
    sudo apt-get install libatlas-base-dev
    # Eigen3
    sudo apt-get install libeigen3-dev
    # SuiteSparse and CXSparse (optional)
    # - If you want to build Ceres as a *static* library (the default)
    #   you can use the SuiteSparse package in the main Ubuntu package
    #   repository:
    sudo apt-get install libsuitesparse-dev
    # - However, if you want to build Ceres as a *shared* library, you must
    #   add the following PPA:
    # sudo add-apt-repository --remove ppa:bzindovic/suitesparse-bugfix-1319687
    sudo apt-get update
    sudo apt-get install libsuitesparse-dev
}

build_ceres () {
  git clone https://ceres-solver.googlesource.com/ceres-solver
  cd ceres-solver
  mkdir -p build
  cd build
  cmake ..
  make -j3
  make test

  sudo make install
}

get_deps
build_ceres

