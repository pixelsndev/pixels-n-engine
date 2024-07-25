cmake_minimum_required(VERSION 3.10)

project(Engine VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(ENABLE_WARNINGS "Enable warnings" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enable warnings as errors" OFF)

option(ENABLE_SANITIZE_ADDR "Enable Address Sanitizer" ON)
option(ENABLE_SANITIZE_UNDEF "Enable Undefined Sanitizer" ON)

option(ENABLE_LTO "Enable LTO" ON)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")

if(ENABLE_WARNINGS)
    include(Warnings)
endif()

if(ENABLE_SANITIZE_ADDR OR ENABLE_SANITIZE_UNDEF)
    include(Sanitizers)
    add_sanitizer_flags()
endif()

if(ENABLE_LTO)
    include(LTO)
endif()

# Configuración del toolchain de Vcpkg
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/tools/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")

# Buscar las dependencias
find_package(SDL2 REQUIRED CONFIG)

# Crear el ejecutable
add_executable(Engine main.cpp)

# Vincular las bibliotecas
target_link_libraries(Engine PRIVATE SDL2::SDL2 SDL2::SDL2main)