#!/usr/bin/env bash
git clone https://github.com/jameskbride/cmake-hello-world.git
cd cmake-hello-world
mkdir build
cd build
cmake -D CMAKE_TOOLCHAIN_FILE=$HOME/{{pi_project}}/pi.cmake ../
make
scp CMakeHelloWorld {{pi_user}}@{{pi_ip}}:~/
ssh {{pi_user}}@{{pi_ip}} /home/{{pi_user}}/CMakeHelloWorld
