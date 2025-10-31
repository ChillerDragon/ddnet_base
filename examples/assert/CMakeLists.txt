cmake_minimum_required(VERSION 3.12...3.27.4)

set(CMAKE_CXX_STANDARD 20)

project(assert_example)
add_executable(assert_example assert.cpp)
target_link_libraries(assert_example PRIVATE ddnet_base)

if(APPLE)
	find_library(CORE_FOUNDATION_LIBRARY CoreFoundation REQUIRED)
	target_link_libraries(assert_example PRIVATE ${CORE_FOUNDATION_LIBRARY})
endif()

