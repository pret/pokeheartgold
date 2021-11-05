### 1. Install MWCC compiler

The build system requires the use of the Metrowerks C Compiler versions 2.0/sp2p2 to compile matching files. We cannot distribute the correct compiler here so join the PRET discord and download the pinned mwccarm.zip zip in #pokeheartgold and extract it to tools/. Run each of the executables so they ask for a license.dat and provide the one in the rar (it may also ask for it when compiling). This only needs to be done once.

In the future, a GCC option will be available so MWCC is not required to build, however it is required for a matching ROM.

### 2. Install Nitro SDK

As with the compiler, the Nitro SDK is proprietary and cannot be distributed here. Download the "NitroSDK-4_2-071210-jp.7z" file pinned in the PRET discord. Extract and copy the contents of tools/bin from the Nitro SDK to tools/bin in your pokeheartgold clone. Finally, copy include/nitro/specfiles/ARM7-TS.lcf.template into the subdirectory `sub`, and include/nitro/specfiles/ARM9-TS.lcf.template into the project root.

### 3. Dependencies

#### Linux

Building the ROM requires the following packages:

* make
* git
* build-essentials (build-essential on Ubuntu)
* binutils-arm-none-eabi
* wine (to run the mwcc executables)
* python3 (for asm preprocessor)
* libpng-devel (libpng-dev on Ubuntu)
* pkg-config

NOTE: If you are using Arch/Manjaro or Void you will only need base-devel instead of build-essentials or make or git. You will still need wine.

Currently WSL2 has an issue with mwldarm not being able to locate it's executable. Please use WSL1 or another build environment to mitigate this issue until a solution is found.

#### Windows

Before following the respective guides, please install devkitARM and ensure the DEVKITPRO and DEVKITARM variables are added to bashrc such that:

Msys2:
```console
export DEVKITPRO=C:/devkitPro 
export DEVKITARM=${DEVKITPRO}/devkitARM
```

Cygwin:
```console
export DEVKITPRO=/cygdrive/c/devkitPro
export DEVKITARM=${DEVKITPRO}/devkitARM
```

You will still require the following packages:

* make
* git
* build-essentials
* libpng-devel
* pkg-config

Install them using either the Cygwin package manager or using pacman on Msys2.

**NOTE FOR MSYS2:** You will need to compile and install [libpng](https://www.libpng.org/pub/png/libpng.html) from source.

#### macOS

macOS 10.15 Catalina and later is supported on Intel and ARM64 hardware configurations. On ARM64, Rosetta 2 must be installed, as well as the following dependencies:

* GNU coreutils
* GNU make
* GNU sed
* LLVM clang compiler
* arm-gcc-bin
* git
* libpng
* pkg-config
* wine-crossover (includes wine32on64, required on Catalina and later to run 32-bit x86 EXEs)

They can be installed with the following commands:

```console
$ brew tap osx-cross/homebrew-arm
$ brew tap gcenx/wine
$ brew install coreutils make gnu-sed llvm arm-gcc-bin libpng git pkg-config
$ brew install wine-crossover
```

### 4. Build ROM

Run `make` to build the ROM. The ROM will be output as `build/heartgold.us/pokeheartgold.us.nds`

To build Pokemon SoulSilver, run `make soulsilver`. You do not need to clean your working tree in between compiling. Pokemon SoulSilver will be built as `build/soulsilver.us/pokesoulsilver.us.nds`.

#### Windows

If you get an error in saving configuration settings when specifying the license file, you need to add a system environment variable called LM_LICENSE_FILE and point it to the license.dat file. Alternatively, run mwccarm.exe from an Administrator command prompt, PowerShell, or WSL session.

#### Docker

If you find issues building the ROMs with the above methods, you can try the Docker-specific build script. It will build an Alpine-based Docker image with the system requirements above, and run the `make` scripts (any specified parameter will be passed to the `make` command):

```console
$ make clean
$ ./contrib/docker/build_docker.sh # build pokeheartgold
$ ./contrib/docker/build_docker.sh soulsilver # build pokesoulsilver
```

Note: Docker may not run at a full performance if its underlying Linux kernel is being virtualized (mainly Windows and macOS hosts).

#### macOS

To avoid issues, you will need to run the build as shown below. This avoids issues with missing features (i.e. "introduced in macOS 10.15" errors) and Apple's `make` being an older version.

```console
$ export PATH=${HOMEBREW_PREFIX}/opt/llvm/bin:$PATH CC=clang CXX=clang++
$ gmake
```
