cmake_minimum_required(VERSION 2.6)
project(capteur)

add_executable(capteur bme280.c main.c) 

install(TARGETS capteur RUNTIME DESTINATION bin)
