# Skyweaver

![skyweaver](./icon.png)
A control station for drone automation.

# Installation

```bash
conan profile detect --force
conan install . --output-folder=build --build=missing
cd build
cmake .. -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE="conan_toolchain.cmake"
cmake --build . --config Release
./skyweaver
```