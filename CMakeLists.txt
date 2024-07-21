cmake_minimum_required(VERSION 3.12)

project(Engine CXX)

set(CMAKE_CXX_COMPILER clang++)

# Especifica el estándar de C++
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Añade tu archivo fuente
add_executable(Engine main.cpp)