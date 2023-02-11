cmake_minimum_required( VERSION 3.16 )

project("gpiodtest")

set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake" )

find_package(gpiod REQUIRED)

set( BUILD_MANIFEST
    main.cpp
)

add_executable(gpiodtest ${BUILD_MANIFEST})

target_link_libraries(gpiodtest gpiodcxx gpiod)
