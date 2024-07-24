cmake_minimum_required(VERSION 3.10)
project(Engine)

# Configuración del toolchain de Vcpkg
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/tools/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")

# Buscar las dependencias
find_package(SDL2 REQUIRED CONFIG)

# Crear el ejecutable
add_executable(Engine main.cpp)

# Vincular las bibliotecas
target_link_libraries(Engine PRIVATE SDL2::SDL2 SDL2::SDL2main)