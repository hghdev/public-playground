#!/bin/bash
clear
set -ex

if [ -d build ]; then rm -rf build; fi
mkdir build
cd build/
# cmake -GNinja -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake" ..
cmake -GNinja ..
ninja -j4
