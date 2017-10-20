#!/bin/bash
set -e

get_deps() {
  sudo apt-get update
  sudo apt-get install -y  \
    build-essential \
    cmake \
    libgtk2.0-dev \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    python-dev \
    python-scipy \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev \
    libdc1394-22-dev
}

build_opencv3() {
  mkdir -p $HOME/bin
  cd $HOME/bin
  # git clone https://github.com/Itseez/opencv.git
  mkdir -p $HOME/bin/opencv/build
  cd $HOME/bin/opencv/build
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
  make -j4
  sudo make install
}

get_deps
build_opencv3
