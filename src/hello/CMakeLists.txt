cmake_minimum_required(VERSION 3.10)

project(hello LANGUAGES CXX)

find_package(SFML COMPONENTS system window graphics CONFIG REQUIRED)

add_executable(hello main.cpp)
target_link_libraries(hello PRIVATE sfml-system sfml-network sfml-graphics sfml-window)
