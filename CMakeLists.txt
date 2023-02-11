cmake_minimum_required( VERSION 3.16 )

project("gpioshutdown")

set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake" )

find_package(gpiod REQUIRED)

set( BUILD_MANIFEST
    main.cpp
)

add_executable(gpioshutdown ${BUILD_MANIFEST})

target_link_libraries(gpioshutdown gpiodcxx gpiod)
