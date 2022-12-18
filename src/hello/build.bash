#!/bin/bash
clear
set -ex

if [ -d build ]; then rm -rf build; fi
mkdir build
cd build/
cmake -GNinja ..
ninja -j4
clear
./hello 
