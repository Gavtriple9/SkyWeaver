cmake_minimum_required(VERSION 3.10)

# set the project name and version
project(ControlStation VERSION 1.0.0)

#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build)

# set(SFML_STATIC_LIBRARIES TRUE)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++14")
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS}")

include_directories(include)

file( GLOB SOURCE_FILES
    ${PROJECT_SOURCE_DIR}/src/*.cpp
)

find_package(SFML 2.5 COMPONENTS graphics audio REQUIRED) 

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_include_directories(${PROJECT_NAME} PRIVATE include)
target_link_libraries(${PROJECT_NAME} sfml-graphics sfml-audio sfml-system)
