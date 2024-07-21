# Setup Host Dependencies

### VSCODE

- Install C/C++ Extension Pack

### LLVM, CLANG and NINJA

- choco install llvm -y
- choco install cmake -y
- choco install ninja -y

### Establecer los compiladores

$env:CC="C:\Program Files\LLVM\bin\clang.exe"
$env:CXX="C:\Program Files\LLVM\bin\clang++.exe"
cmake -S ./ -B ./build -G "Ninja-Multi-Config"
cmake --build ./build --config Release

Otra forma seria ejecutar:

- cmake-gui -> Tools/Configure -> Ninja Multi-Config -> elegir binarios clang.exe para c y clang++ para c++.

### En ambos casos ejecutar

- cmake --build ./build --config Release
