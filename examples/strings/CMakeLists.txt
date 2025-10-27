cmake_minimum_required(VERSION 3.12...3.27.4)

set(CMAKE_CXX_STANDARD 20)

project(strings_example)
add_executable(strings_example strings.cpp)
target_link_libraries(strings_example PUBLIC ddnet_base)
