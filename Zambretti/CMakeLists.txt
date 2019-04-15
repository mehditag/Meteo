cmake_minimum_required(VERSION 2.6)
project(zambretti)

add_executable(zambretti main.cpp)

install(TARGETS zambretti RUNTIME DESTINATION bin)
