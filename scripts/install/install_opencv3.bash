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


build_opencv() {
  mkdir -p $HOME/bin
  cd $HOME/bin

  OPENCV_EXTRA_MODULES_PATH="$HOME/bin/opencv_contrib-3.4.0/modules"

  # # Get OpenCV and OpenCV contrib
  if [ ! -d opencv-3.4.0 ]; then
      wget -O opencv-3.4.0.zip https://github.com/opencv/opencv/archive/3.4.0.zip
  fi
  if [ ! -d opencv_contrib-3.4.0 ]; then
      wget -O opencv_contrib-3.4.0.zip https://github.com/opencv/opencv_contrib/archive/3.4.0.zip
  fi

  unzip -o opencv-3.4.0.zip
  unzip -o opencv_contrib-3.4.0.zip


  # Build and install OpenCV 3.4.0 to /usr/local/lib
  cd opencv-3.4.0
  mkdir -p build && cd build
  cmake -G "Unix Makefiles" \
      -DBUILD_DOCS=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_PERF_TESTS=OFF \
      -DBUILD_TESTS=OFF \
      -DBUILD_JAVA=OFF \
      -DWITH_CUDA=OFF \
      -DWITH_CUBLAS:BOOL=OFF \
      -DWITH_CUFFT:BOOL=OFF \
      -DWITH_NVCUVID:BOOL=OFF \
      -DWITH_MATLAB=OFF \
      -DBUILD_opencv_cudaarithm:BOOL=OFF \
      -DBUILD_opencv_cudabgsegm:BOOL=OFF \
      -DBUILD_opencv_cudacodec:BOOL=OFF \
      -DBUILD_opencv_cudafeatures2d:BOOL=OFF \
      -DBUILD_opencv_cudafilters:BOOL=OFF \
      -DBUILD_opencv_cudaimgproc:BOOL=OFF \
      -DBUILD_opencv_cudalegacy:BOOL=OFF \
      -DBUILD_opencv_cudaobjdetect:BOOL=OFF \
      -DBUILD_opencv_cudaoptflow:BOOL=OFF \
      -DBUILD_opencv_cudastereo:BOOL=OFF \
      -DBUILD_opencv_cudawarping:BOOL=OFF \
      -DBUILD_opencv_cudev:BOOL=OFF \
      -DBUILD_opencv_java=OFF \
      -DBUILD_opencv_js=OFF \
      -DBUILD_opencv_python2=OFF \
      -DBUILD_opencv_python3=ON \
      -DBUILD_opencv_ts=OFF \
      -DBUILD_opencv_world=OFF \
      -DBUILD_opencv_matlab=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DOPENCV_ENABLE_NONFREE=ON \
      -DOPENCV_EXTRA_MODULES_PATH="$OPENCV_EXTRA_MODULES_PATH" \
      ..
      make -j5
      sudo make install
}

get_deps
build_opencv
