This doc details the steps necessary to build a copy of Pokemon HeartGold (EN-US) from the sources contained in this repository.

### 0. Clone the repository

Using a terminal or git client, clone this repository to your local device. All the steps that followed should be performed in the directory to which you cloned this repository.

### 1. Install MWCC compiler

The build system requires the use of the Metrowerks C Compiler versions 2.0/sp2p2 to compile matching files. We cannot distribute the correct compiler here so join the PRET discord and download the pinned mwccarm.zip zip in #pokediamond and extract it to tools/. At the end of this operation, you should have i.e. the file `tools/mwccarm/2.0/sp2p2/mwccarm.exe`. Run each of the executables so they ask for a license.dat and provide the one in the rar (it may also ask for it when compiling). This only needs to be done once.

In the future, a GCC option will be available so MWCC is not required to build, however it is required for a matching ROM.

(Note: if running the exe's doesn't work, you can run the .bat file. A GUI window should pop up for you to select the license.dat)

### 2. Install Nitro SDK

As with the compiler, the Nitro SDK is proprietary and cannot be distributed here. Download the "NitroSDK-4_2-071210-jp.7z" file pinned in the PRET discord. Extract and copy the folder `tools/bin` from the Nitro SDK into the folder `tools` in your pokeheartgold clone. At the end of this operation, you should have i.e. the file `tools/bin/makelcf.exe` inside your pokeheartgold clone. Finally, copy include/nitro/specfiles/ARM7-TS.lcf.template into the subdirectory `sub`, and include/nitro/specfiles/ARM9-TS.lcf.template and include/nitro/specfiles/mwldarm.response.template into the project root.

### 3. Dependencies

#### Linux

Building the ROM requires the following packages. If you cannot find one or more of these using your package distribution, it may be under a different name.

* make
* git
* build-essentials (build-essential on Ubuntu)
* binutils-arm-none-eabi
* wine (to run the mwcc executables)
* python3 (for asm preprocessor)
* libpng-devel (libpng-dev on Ubuntu)
* pkg-config
* pugixml (libpugixml-dev on Ubuntu)

NOTE: If you are using Arch/Manjaro or Void you will only need base-devel instead of build-essentials or make or git. You will still need wine.

Currently WSL2 has an issue with mwldarm not being able to locate it's executable. Please use WSL1 or another build environment to mitigate this issue until a solution is found.

#### Windows


##### devkitARM
The windows dev environment requires devkitARM. devkitARM is a specialized toolchain used to build the rom. It contains `arm-none-eabi-gcc`, which is a compiler that can compile code for the DS. 

**Ensure you select the "Nintendo DS" or "NDS" workload during the devkitPro installation.** 

##### A linux like environment
The windows dev environment also uses linux-like automation. Because of this, you will need a linux style terminal. Some popular options are `Cygwin` and `Mysys2`. The environment will provide the manager tools like `make` that co-ordinate the build process.


The following packages are required:
* make
* git
* build-essentials
* libpng-devel
* pugixml
* pkg-config

Install them using either the Cygwin package manager or using pacman on Msys2.

To install the packages on cygwin, select the following packages in the cygwin package manager
| Requirement | Cygwin Package Name | Notes |
| :--- | :--- | :--- |
| **make** | `make` | The standard GNU version. |
| **git** | `git` | You might also want `git-completion` for convenience. |
| **build-essential** | `gcc-g++`, `binutils` | This provides your C/C++ compilers and linker. |
| **libpng-devel** | `libpng-devel` | Includes headers for PNG manipulation. |
| **pugixml** | `libpugixml-devel` | The development files for the XML parser. |
| **pkg-config** | `pkg-config` | Helps your compiler find library paths automatically. |

**NOTE FOR MSYS2:** You will need to compile and install [libpng](https://www.libpng.org/pub/png/libpng.html) from source.

After the packages are installed, add the following variables to your .bashrc to tell your terminal where devkitARM lives:

If using Msys2:
```console
export DEVKITPRO=C:/devkitPro
export DEVKITARM=${DEVKITPRO}/devkitARM
```

If using Cygwin:
```console
export DEVKITPRO=/cygdrive/c/devkitPro
export DEVKITARM=${DEVKITPRO}/devkitARM
```

You can verify these are set correctly by running:
```bash
echo $DEVKITPRO
# This should print out the path where devkitPro lives on your windows machine
```

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
* pugixml
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

There are targets for building and testing changes to individual components without repackaging the ROM. For the ARM9 modules, run `make main`. For the ARM7 module, run `make sub`. For the filesystem, run `make filesystem`. To build these for SoulSilver, append `GAME_VERSION=SOULSILVER` to the appropriate command.

At the end of building each of these, there is a checksum verification step. This makes sure that the final product is byte-for-byte equivalent to the retail ROM. To disable this, append `COMPARE=0` to your command.

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

#### After updating from upstream

This repository is still in a volatile state, and several files may be moved around or renamed. If you pull from upstream and experience errors rebuilding, try the following troubleshooting steps, **one line at a time** until you get the non_npc_msg `build/heartgold.us/pokeheartgold.us.nds: OK`:

```shell
make tidy && make compare
make clean && make compare
git clean -fdx && make compare
```

If, after the third step, you're still getting errors, please ask for help in the Discord.
