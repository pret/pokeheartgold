# Installation Instructions

This document details the steps necessary to build a copy of Pokémon Heart Gold
(EN-US) using this repository.

## Table of Contents

- [1. Setting Up Your Development Environment](#1-setting-up-your-development-environment)
  - [Windows Subsystem for Linux](#windows-subsystem-for-linux)
    - [Windows WSL2](#windows-wsl2)
        - [Developing in WSL2 from Windows](#developing-in-wsl2-from-windows)
    - [Windows WSL1](#windows-wsl1)
        - [Existing Installs](#existing-installs)
        - [Install Build Dependencies](#install-build-dependencies)
  - [Windows with MSYS2](#windows-with-msys2)
  - [macOS](#macos)
  - [Linux](#linux)
    - [Debian (and derivatives, e.g., Ubuntu, Mint)](#debian-and-derivatives-eg-ubuntu-mint)
    - [Arch Linux (and derivatives, e.g., Manjaro, Endeavour)](#arch-linux-and-derivatives-eg-manjaro-endeavour)
    - [Fedora (and derivatives, e.g., AlmaLinux, Red Hat Enterprise Linux)](#fedora-and-derivatives-eg-almalinux-red-hat-enterprise-linux)
- [2. Downloading the Repository](#2-downloading-the-repository)
- [3. Building the Repository](#3-building-the-repository)
- [Troubleshooting FAQ](#troubleshooting-faq)
  - [My Build is Failing After Merging from Main](#my-build-is-failing-after-merging-from-main)

## 1. Setting Up Your Development Environment

### Windows Subsystem for Linux

It's recommended to use [WSL2](#windows-wsl2) rather than WSL1 as your development environment. 
If you still want to use WSL1, go [here](#windows-wsl1).

#### Windows WSL2

These instructions will enable you to build pokeheartgold using the more up-to-date WSL2 and
develop on it with VSCode on Windows while it is stored in the Linux filesystem.

1. In your start menu, search for `Windows PowerShell`. Open the Windows PowerShell app as administrator by right-clicking on it and selecting `Run as administrator`. 
   Even if you're on an admin Windows profile, you always have to run it as admin.

2. Install a new distro:
    ```bash
    wsl --install -d Ubuntu
    ```
    If this is your first time installing a WSL distro, then your computer will prompt
    you to restart once finished. Do so, then open PowerShell as administrator again.

    You can add `--name ` with a name on the end to the command to pick what name you'd like. 
    By default it would be called `Ubuntu`.

3. Check that `Ubuntu` (or whatever name you gave it) is installed in the list:
    ```bash
    wsl -l -v
    ```
    If the new distro you just made is not version 2, convert to version 2:
    ```bash
    wsl --set-version Ubuntu 2
    ```

4. Once the new distro is set up, enter it:
    ```bash
    wsl -d Ubuntu
    ```

5. Right now, you'll probably see your file system begin with `/mnt/c/`. That's the Windows file system.
    Go to the Linux filesystem:
    ```bash
    cd ~
    ```

6. Install the pokeheartgold dependencies:
    ```bash
    sudo dpkg --add-architecture i386 && sudo apt update
    sudo apt install bison flex g++ gcc-arm-none-eabi git make ninja-build pkg-config wget python3 xz-utils nasm libc6:i386 libpng-dev
    ```

7. Once that is done successfully, go to [Downloading the Repository](#2-downloading-the-repository) and continue from there.

##### Developing in WSL2 from Windows

With VSCode, you can modify files stored in Linux just like modifying files stored in Windows.

1. Once you have cloned the pokeheartgold repo in your Linux filesystem and ensured that it is capable of building successfully, open VSCode in Windows (assuming you have downloaded it already). 

   Go to extensions and find the WSL extension. Install it and make sure it's enabled.

2. Back to your PowerShell terminal where you're running WSL2, run this command in the pokeheartgold directory to open it in VSCode on Windows:
    ```bash
    code .
    ```
    The first-time setup should automatically download the necessary extensions to develop against the Linux filesystem.

3. You should now have pokeheartgold in Linux loaded in VSCode on Windows, standing by and ready for work!

#### Windows WSL1

Follow these instructions if you do not have an existing install of WSL.

1. Open [Windows PowerShell as Administrator](https://i.imgur.com/QKmVbP9.png).
Paste (Right Click or Shift+Insert) the following command:

    ```powershell
    wsl --install -d Ubuntu
    ```

2. Once the process finishes, you will be prompted to restart your machine.
Accept.

3. After rebooting, reopen PowerShell and run the following command to downgrade
WSL to version 1:

    ```powershell
    wsl --set-version Ubuntu 1
    ```

    WSL version 1 is preferred for most WSL users due to its increased performance
when accessing files in the Windows file system.

4. Open `Ubuntu` from your Start menu.

5. `Ubuntu` will set up its own installation when it runs for the first time. Once
finished, it will ask for a username and password as input.

    > [!NOTE]
    > When typing the password, there will be no visible response; this is normal,
    > and the terminal is still reading your input.

6. Update `Ubuntu`'s package registry:

    ```bash
    sudo apt update && sudo apt upgrade
    ```

7. [`Install build dependencies`](#install-build-dependencies).

##### Existing Installs

Follow these instructions if you have an existing install of WSL, specifically
`Ubuntu`.

Older versions of `Ubuntu` (e.g., `20.04`) ship with an outdated version of
Python, which is not supported. To remedy this, you can upgrade your existing
install to a more recent version of `Ubuntu`:

1. Run the following inside `Ubuntu`:

    ```bash
    sudo apt upgrade && sudo apt full-upgrade
    ```

2. Open PowerShell and run the following commands to restart `Ubuntu`:

    ```powershell
    wsl -t Ubuntu
    wsl -d Ubuntu
    ```

3. Re-open `Ubuntu` and run the following to start a system upgrade:

    ```bash
    sudo do-release-upgrade
    ```

    This process may take a long time.

4. Once `Ubuntu` is done upgrading, update `Ubuntu`'s package registry:

    ```bash
    sudo apt update && sudo apt upgrade
    ```

5. [`Install build dependencies`](#install-build-dependencies).

##### Install Build Dependencies

1. Run the following to install build dependencies from the `Ubuntu` package
registry:

    ```bash
    sudo apt install bison flex g++ gcc-arm-none-eabi git lib32z1 make ninja-build pkg-config python3 p7zip libpng-dev
    ```

2. [Download the repository](#2-downloading-the-repository).

### Windows with MSYS2

If you are unable to run Windows Subsystem for Linux due to performance reasons
or lacking virtualization requirements, then MSYS2 may be an option for you.

1. Download the MSYS2 installer from [the official website](https://www.msys2.org/)
and install it on your system.

2. Once the installation is complete, a terminal should automatically pop up.
To update your package registry, enter the following command:

    ```bash
    pacman -Syu
    ```

    Press 'Y' when prompted to confirm the update. This process may take a few
minutes. Once completed, the terminal will automatically close.

3. Re-open an MSYS terminal (the pink icon) from your Start Menu, then enter
the following commands to install necessary build dependencies:

    ```bash
    echo 'export PATH=${PATH}:/mingw64/bin' >> ~/.bashrc
    source ~/.bashrc
    pacman -S bison flex gcc git make ninja python mingw-w64-ucrt-x86_64-arm-none-eabi-gcc p7zip mingw-w64-x86_64-libpng
    ```

    Press 'Y' when prompted to confirm the installation.

4. [Download the repository](#2-downloading-the-repository).

### macOS

1. Apple bundles a number of the requisite utilities into Xcode Command Line Tools;
to install these, run:

    ```zsh
    xcode-select --install
    ```

2. Install [Homebrew](https://brew.sh/).

3. Run the following commands to install additional dependencies:

    ```zsh
    brew update
    brew install gcc@14 ninja libpng pkg-config arm-none-eabi-gcc xz
    brew install --cask wine-stable
    ```

4. You may need to authorize the Wine installation to satisfy macOS security
requirements. To do this, open the Applications folder in Finder and locate the
Wine Stable application. Control-Click on this icon to open the context menu,
then Control-Click on Open and grant the requested permissions.

5. If your macOS installation is Monterey (12) or earlier, then you may also need
GNU `coreutils` installed to run the build scripts:

    ```zsh
    brew install coreutils
    ```

6. [Download the repository](#2-downloading-the-repository).

> [!TIP]
> You can run a persistent Wine server in the background to speed up builds.
>
> To do this, open the Wine Stable application from your Applications folder.
> In the terminal window that opens, run the following command:
>
> ```zsh
> wineserver -p
> ```
>
> When trying to build the repository, the first invocation of `make` may hang
> on compiling a file. If that happens, hit Control+C to interrupt the build,
> and run `make` again.
>
> If you need to stop the Wine server, run the following command:
>
> ```zsh
> wineserver -k
> ```

### Linux

> [!NOTE]
> Precise packages to be installed will vary by Linux distribution and
> package registry. A handful of common distributions are listed below for
> convenience.

Once you have installed all of the listed dependencies, proceed to [downloading
the repository](#2-downloading-the-repository).

#### Debian (and derivatives, e.g., Ubuntu, Mint)

1. Enable 32-bit installations using `dpkg`:

    ```bash
    sudo dpkg --add-architecture i386 && sudo apt update
    ```

2. Install the following packages via `apt`:

    ```bash
    sudo apt install bison flex g++ gcc-arm-none-eabi git make ninja-build pkg-config wget python3 xz-utils nasm libc6:i386 libpng-dev
    ```

#### Arch Linux (and derivatives, e.g., Manjaro, Endeavour)

1. Enable the [multilib repository](https://wiki.archlinux.org/title/Multilib).

2. Install dependencies via `pacman`:

    ```bash
    sudo pacman -S arm-none-eabi-gcc bison flex gcc git make ninja python wget xz lib32-glibc libpng
    ```

#### Fedora (and derivatives, e.g., AlmaLinux, Red Hat Enterprise Linux)

```bash
sudo dnf install arm-none-eabi-gcc-cs bison flex gcc-c++ git make ninja-build python3 wget2 xz glibc32 libpng
```

## 2. Downloading the Repository

From your terminal, navigate to the path in which you will store the repository.
Users of WSL 1 should ensure that their target is on the Windows file drive.

```bash
git clone https://github.com/pret/pokeheartgold
cd pokeheartgold
```

## 3. Building the Repository

To build the ROM, run:

```bash
make
```

If everything works, then the following ROM should be built:

- [build/pokeheartgold.us.nds](https://datomatic.no-intro.org/index.php?page=show_record&s=28&n=4787) `sha1: 4fcded0e2713dc03929845de631d0932ea2b5a37`

To build Soul Silver, instead of the above command, run the following:

```bash
make soulsilver
```
If everything works, then the following ROM should be built:
- [build/pokeheartgold.us.nds](https://datomatic.no-intro.org/index.php?page=show_record&s=28&n=4788) `sha1: f8dc38ea20c17541a43b58c5e6d18c1732c7e582`

If you need further assistance, feel free to ask a question in the `#pokeheartgold`
channel of the `pret` Discord (see `README.md` for contact information) or [open
an issue](https://github.com/pret/pokeheartgold/issues/new).

## Troubleshooting FAQ

### My Build is Failing After Merging from Main

It is likely that your subprojects are out of date; update them with the following
command:

```bash
make update
```

And then try rebuilding.
