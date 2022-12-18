cmake_minimum_required(VERSION 3.10)

project(draw_circle LANGUAGES CXX)

find_package(SFML COMPONENTS system window graphics CONFIG REQUIRED)

add_executable(draw_circle main.cpp)
target_link_libraries(draw_circle PRIVATE sfml-system sfml-network sfml-graphics sfml-window)
