cmake_minimum_required(VERSION 3.12...3.27.4)

set(CMAKE_CXX_STANDARD 20)

project(ddnet_base)

set(BASE_SRC
	src/ddnet_base/base/hash_libtomcrypt.cpp
	src/ddnet_base/base/str.cpp
	src/ddnet_base/base/color.cpp
	src/ddnet_base/base/system.cpp
	src/ddnet_base/base/hash_openssl.cpp
	src/ddnet_base/base/color.rs
	src/ddnet_base/base/fs.cpp
	src/ddnet_base/base/hash_bundled.cpp
	src/ddnet_base/base/crashdump.cpp
	src/ddnet_base/base/hash.cpp
	src/ddnet_base/base/bezier.cpp
	src/ddnet_base/base/unicode
	src/ddnet_base/base/unicode/confusables.cpp
	src/ddnet_base/base/unicode/tolower_data.cpp
	src/ddnet_base/base/unicode/tolower.cpp
	src/ddnet_base/base/log.cpp
	src/ddnet_base/engine/external/md5/md5.c
)

add_library(ddnet_base ${BASE_SRC})
target_include_directories(ddnet_base PRIVATE src/ddnet_base)
target_include_directories(ddnet_base
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
        $<INSTALL_INTERFACE:ddnet_base>
)

set(LIB_PUBLIC_HEADERS_BASE
	src/ddnet_base/base/str.h
	src/ddnet_base/base/hash_ctxt.h
	src/ddnet_base/base/vmath.h
	src/ddnet_base/base/logger.h
	src/ddnet_base/base/system.h
	src/ddnet_base/base/detect.h
	src/ddnet_base/base/dynamic.h
	src/ddnet_base/base/hash.h
	src/ddnet_base/base/rust.h
	src/ddnet_base/base/tl/threading.h
	src/ddnet_base/base/types.h
	src/ddnet_base/base/lock.h
	src/ddnet_base/base/fs.h
	src/ddnet_base/base/bezier.h
	src/ddnet_base/base/log.h
	src/ddnet_base/base/unicode/confusables_data.h
	src/ddnet_base/base/unicode/confusables.h
	src/ddnet_base/base/unicode/tolower_data.h
	src/ddnet_base/base/color.h
	src/ddnet_base/base/math.h
)

set(LIB_PUBLIC_HEADERS_ENGINE_EXTERNAL
	src/ddnet_base/engine/external/md5/md5.h
)

if(TARGET_OS STREQUAL "mac")
	target_link_libraries(ddnet_base -stdlib=libc++)
	target_link_libraries(ddnet_base "-framework SystemConfiguration") # Required by curl 7.79.0
endif()

# install
include(GNUInstallDirs)
install(TARGETS ddnet_base
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(FILES ${LIB_PUBLIC_HEADERS_BASE} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/ddnet_base/base)
install(FILES ${LIB_PUBLIC_HEADERS_ENGINE_EXTERNAL} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/ddnet_base/engine/external)

### uninstall
configure_file(cmake/cmake_uninstall.cmake.in cmake_uninstall.cmake IMMEDIATE @ONLY)

add_custom_target(uninstall
    COMMAND ${CMAKE_COMMAND} -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")
