#!/usr/bin/env bash
git clone https://github.com/jameskbride/cmake-hello-world.git
cd cmake-hello-world
mkdir build
cd build
cmake -D CMAKE_TOOLCHAIN_FILE=$HOME/raspberrypi/pi.cmake ../
make
scp CMakeHelloWorld pi@192.168.1.PI:/home/pi/
ssh pi@192.168.1.PI ./CMakeHelloWorld
