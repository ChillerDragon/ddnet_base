cmake_minimum_required(VERSION 3.12...3.27.4)

set(CMAKE_CXX_STANDARD 20)

project(logger_example)
add_executable(logger_example logger.cpp)
target_link_libraries(logger_example PRIVATE ddnet_base)
