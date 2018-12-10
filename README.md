Ion Core integration/staging repository
=====================================

[![Twitter](https://img.shields.io/twitter/url/https/github.com/cevap/ion.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fcevap%2Fion) [![Chat on Discord](https://img.shields.io/discord/308323056592486420.svg?logo=discord)](https://discord.gg/vuZn7gC) [![Latest Release](https://img.shields.io/github/downloads/cevap/ion/latest/total.svg)](https://github.com/cevap/ion/releases/latest)
[![Build Status](https://travis-ci.org/cevap/ion.svg?branch=master)](https://travis-ci.org/cevap/ion) [![GitHub version](https://badge.fury.io/gh/cevap%2Fion.svg)](https://badge.fury.io/gh/cevap%2Fion) [![Snap Status](https://build.snapcraft.io/badge/cevap/ion.svg)](https://build.snapcraft.io/user/cevap/ion) [![GitHub issues](https://img.shields.io/github/issues/cevap/ion.svg)](https://github.com/cevap/ion/issues) [![GitHub forks](https://img.shields.io/github/forks/cevap/ion.svg)](https://github.com/cevap/ion/network) [![GitHub stars](https://img.shields.io/github/stars/cevap/ion.svg)](https://github.com/cevap/ion/stargazers) [![GitHub license](https://img.shields.io/github/license/cevap/ion.svg)](https://github.com/cevap/ion)

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/ioncoin)

Table of Contents
-----------------

- [Ion Core integration/staging repository](#ion-core-integrationstaging-repository)
  - [Table of Contents](#table-of-contents)
  - [Important information](#important-information)
    - [Client: Helium](#client-helium)
      - [Ion Core FAQ/Help](#ion-core-faqhelp)
      - [Documentation](#documentation)
  - [Introduction](#introduction)
      - [Installation methods](#installation-methods)
        - [Method 1. Install Ion Core over Ubuntu Software Center (easiest and fastest install and update)](#method-1-install-ion-core-over-ubuntu-software-center-easiest-and-fastest-install-and-update)
        - [Method 2. Install/Get over Snap Store (_preffered method_)](#method-2-installget-over-snap-store-preffered-method)
          - [Install latest stable release from terminal](#install-latest-stable-release-from-terminal)
          - [Install latest release candidate from terminal](#install-latest-release-candidate-from-terminal)
          - [Install latest beta release from terminal](#install-latest-beta-release-from-terminal)
          - [Install latest edge release from terminal](#install-latest-edge-release-from-terminal)
          - [Upgrade to latest version from terminal](#upgrade-to-latest-version-from-terminal)
        - [Method 4. Download and install latest release](#method-4-download-and-install-latest-release)
        - [Method 3. Build, compile and install from source](#method-3-build-compile-and-install-from-source)
    - [Our sources:](#our-sources)
    - [Coin Specs](#coin-specs)
    - [Reward Distribution](#reward-distribution)
      - [Genesis block](#genesis-block)
    - [PoW Rewards Breakdown](#pow-rewards-breakdown)
    - [PoS/PoW Rewards Breakdown](#pospow-rewards-breakdown)
    - [PoS Rewards Breakdown](#pos-rewards-breakdown)

## Important information

**This repository is no longer official release repository** for several reasons. There was internal contributor voting on this matter and this is the decision we all have taken for ability to improve future of ion.

[CEVAP](https://github.com/cevap/) remains as ŕepository from which SNAP builds (Ubuntu Software Center) are delivered and this is the reason why CEVAP will keep contributing and updating the code. All official releases will be available on ioncoincore as binary releases and on CEVAP over SNAP builds. In future we will rename ioncoin.* to ioncoinCE and reserve ioncoin as official name for official branch https://github.com/ioncoincore/ion.git

 - **Official releases**: https://github.com/ioncoincore/
 - **Development**/__non public__: https://bitbucket.org/ioncoin/ion.git 

### Client: Helium

![](https://raw.githubusercontent.com/wiki/cevap/ion/assets/images/Helium.jpg)

#### Ion Core FAQ/Help
- [Documentation](../../tree/master/doc)
  - [Setup Ion](../../tree/master/doc#setup)
  - [Running Ion Core](../../tree/master/doc#running)
    - [Windows](https://github.com/cevap/ion/tree/master/doc#windows)
    - [Unix](https://github.com/cevap/ion/tree/master/doc#unix)
    - [OSX](https://github.com/cevap/ion/tree/master/doc#osx)
- [Ion Core CE Wiki](../../wiki)
  - [Accounts-Explained](../../wiki/Accounts-Explained)
  - [API Call list](../../wiki/API-Calls-List)
  - [API-Reference-JSON-RPC](../../wiki/API-Reference-JSON-RPC)
  - [Data-Directory](../../wiki/Data-Directory)
- External ressources
  - [Ionomy.com](https://ionomy.com)
    - [Telegram](https://t.me/ionomy)
    - [Twitter](https://twitter.com/ionomics)
    - [ionomy github](https://github.com/ionomy)
    - [reddit](https://www.reddit.com/r/ionomy/)
    - [facebook](https://facebook.com/ionomy)

#### Documentation

- [Client Documentation](../../tree/master/doc)
- [Technical documentation (doxygen)](techdocu.ioncore.xyz)

## Introduction

We released version based on [Ion core wallet v3.1.0](../../tag/v3.1.0) which is refactored old wallet based on new source with several fixes from bitcoin as well as all commits from our main source PIVX (up to commit [4b1be145](https://github.com/PIVX-Project/PIVX/commit/4b1be14505ded427378f267d9c31a3a0f72bda75)). Please check release notes for more info.

#### Installation methods

##### Method 1. Install Ion Core over Ubuntu Software Center (easiest and fastest install and update)

- _Requirements: [snapd](https://docs.snapcraft.io/core/install)_

##### Method 2. Install/Get over Snap Store (_preffered method_)

[![Snap Status](https://build.snapcraft.io/badge/cevap/ion.svg)](https://build.snapcraft.io/user/cevap/ion)

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-white.svg)](https://snapcraft.io/ioncoin)

__Requirements: [snapd](https://docs.snapcraft.io/core/install)__

One ion core build for all Linux and IoT

***Snaps work across many distributions and versions of Linux***. Bundle your dependencies and config, simplifying installs to a single standard command.

###### Install latest stable release from terminal

Please use **only stable release** for production/commercial purpose.

    sudo snap install ioncoin

###### Install latest release candidate from terminal

    sudo snap install --candidate ioncoin

###### Install latest beta release from terminal

    sudo snap install --beta ioncoin

###### Install latest edge release from terminal

    sudo snap install --edge ioncoin

###### Upgrade to latest version from terminal

    sudo snapcraft refresh

- [Ion snap builds supports variety of Operating systems](https://snapcraft.io/)

    | [Ubuntu](https://docs.snapcraft.io/core/install-ubuntu) | [Debian](https://docs.snapcraft.io/core/install-debian) | [Linux Mint](https://docs.snapcraft.io/core/install-linux-mint) | [Raspbian](https://docs.snapcraft.io/core/install-raspbian) | [Arch Linux](https://docs.snapcraft.io/core/install-arch-linux) | [Fedora](https://docs.snapcraft.io/core/install-fedora) |
    :-----: |  :-----: |  :-----: |  :-----: |  :-----: |  :-----: |
    [![Install SNAP on Ubuntu](https://raw.githubusercontent.com/wiki/cevap/ion/assets/images/ubuntu_128x128.png)](https://docs.snapcraft.io/core/install-debian) | ![Install SNAP on Debian](https://raw.githubusercontent.com/wiki/cevap/ion/assets/images/debian_128x128.png) | [![Install SNAP on Linux Mint](https://raw.githubusercontent.com/wiki/cevap/ion/assets/images/mint_128x128.png)](https://docs.snapcraft.io/core/install-linux-mint) | [![Install SNAP on Raspbian](https://raw.githubusercontent.com/wiki/cevap/ion/assets/images/raspbian_128x128.png)](https://docs.snapcraft.io/core/install-raspbian) | [![Install SNAP on ArchLinux](https://raw.githubusercontent.com/wiki/cevap/ion/assets/images/archlinux_128x128.png)](https://docs.snapcraft.io/core/install-arch-linux) | [![Install SNAP on Fedora](https://raw.githubusercontent.com/wiki/cevap/ion/assets/images/fedora_128x128.png)](https://docs.snapcraft.io/core/install-fedora) |

  - additional Linux distributions installation guides ([see all supported distributions](https://docs.snapcraft.io/core/install))
    - [Deepin](https://docs.snapcraft.io/t/installing-snap-on-deepin/6791)
    - [Elementary OS](https://docs.snapcraft.io/t/installing-snap-on-elementary-os/6768)
    - [GalliumOS](https://docs.snapcraft.io/t/installing-snap-on-galliumos/6801)
    - [KDE Neon](https://docs.snapcraft.io/t/installing-snap-on-kde-neon/6792)
    - [Manjaro Linux](https://docs.snapcraft.io/t/installing-snap-on-manjaro-linux/6807)
    - [openSUSE](https://docs.snapcraft.io/t/installing-snap-on-opensuse/8375)
    - [Parrot Security OS](https://docs.snapcraft.io/t/installing-snap-on-parrot-security-os/6810)
    - [Solus](https://docs.snapcraft.io/t/installing-snap-on-solus/6803)
    - [Zorin OS](https://docs.snapcraft.io/t/installing-snap-on-zorin-os/6804)
- Snap builds in Windows 10
  - [How to install Ubuntu/OpenSuse from Microsoft Store](https://fossbytes.com/install-ubuntu-opensuse-windows-store-windows-10/)

##### Method 4. Download and install latest release

[![Latest Release](https://img.shields.io/github/downloads/cevap/ion/latest/total.svg)](https://github.com/cevap/ion/releases/latest)

- [Build and install ion (all OS)](../../tree/master/doc)

- Downloads

| OS | 32-Bit | 64-Bit |
:---: | ---: | ---: |
MacOS/OSX | [![Download ion Setup for OSX 32-bit](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.00-osx-unsigned.dmg.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-osx-unsigned.dmg) | [![Download ion Setup for OSX 64-bit](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.00-osx64.tar.gz.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-osx64.tar.gz) |
Windows XP/Vista/7/10 Installer |  [![Download ion Setup for Windows 32-bit](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.00-win32-setup-unsigned.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-win32-setup-unsigned.exe) | [![Download ion Setup for Windows 64-bit](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.0-win64-setup-unsigned.exe.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-win64-setup-unsigned.exe) |
Windows XP/Vista/7/10 only binaries | [![Download ion binaries for Windows 32-bit](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.00-win32.zip.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-win32.zip) | [![Download ion binaries for Windows 64-bit](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.00-win64.zip.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-win64.zip) |
Linux | [![Download ion for Linux 32-bit (i686)](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.0-i686-pc-linux-gnu.tar.gz.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-i686-pc-linux-gnu.tar.gz) | [![Download ion for Linux 64-bit (x86_x64)](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.00-x86_64-linux-gnu.tar.gz.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-x86_64-linux-gnu.tar.gz)
Linux ARM/aarch64 | [![Download ion for ARM Linux](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.00-arm-linux-gnueabihf.tar.gz.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-arm-linux-gnueabihf.tar.gz) | [![Download ion for aarch64 Linux](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/ion-3.1.00-aarch64-linux-gnu.tar.gz.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/ion-3.1.00-aarch64-linux-gnu.tar.gz)


Download checksums: [![Download SHA256SUMS.asc](https://img.shields.io/github/downloads/cevap/ion/v3.1.0-rc6/SHA256SUMS.asc.svg)](https://github.com/cevap/ion/releases/download/v3.1.0-rc6/SHA256SUMS.asc)

##### Method 3. Build, compile and install from source

- [Build, compile and install documenattion](../../tree/master/doc#building)


### Our sources:

We forked from [PIVX](https://github.com/PIVX-Project/PIVX) and integrated ION's specific features into the PivX codebase.

By doing so, we connect to an enthusiastic and active community - leaving behind old Ion code that inherits from less actively developed and maintaned code. Our main sources are now derived from:

  1. [PIVX](https://github.com/PIVX-Project/PIVX)
  2. [DASH](https://github.com/dashpay/dash)
  3. [Bitcoin](https://github.com/bitcoin/bitcoin)


More information at [ionomy.com](https://www.ionomy.com) Visit our ANN thread at [BitcoinTalk](https://bitcointalk.org/index.php?topic=1443633.7200)

### Coin Specs

| Coin specifications ||
 :------------ | :---: |
Algorithm | Quark |
Retargeting Algorithm | DGW |
Difficulty Retargeting | Every Block |
Max Coin Supply | 48,035,935.4 ION |
Premine | 16,400,000 ION* |

*16,629,951 Ion Premine was burned in block [1](https://chainz.cryptoid.info/ion/block.dws?000000ed2f68cd6c7935831cc1d473da7c6decdb87e8b5dba0afff0b00002690.htm)

### Reward Distribution

#### Genesis block

| Block Height | Reward Amount | Notes |
 ------------: | ------------: | :---: |
1 | 16,400,000 ION | Initial Pre-mine |

### PoW Rewards Breakdown

Block Height | Masternodes | Miner | Total |
 ----------: | ----------: | ----: | ----: |
2-454 | 50% (11.5 ION) | 50% (11.5 ION) | 10,419 ION |

### PoS/PoW Rewards Breakdown

Block Height | Masternodes | Miner | Budget |
 ----------: | ----------: | ----: | -----: |
455-1000 | 50% (11.5 ION) | 50% (11.5 ION)| 12,558 ION |

### PoS Rewards Breakdown

Block Height | Masternodes | Miner | Budget |
 ----------: | ----------: | ----: | -----: |
1001-125147 | 50% (11.5 ION) | 50% (11.5 ION) | 2,855,381 ION |
125148-550001 | 50% (8.5 ION) | 50% (8.5 ION) | 7,222,518 ION |
550002-551441 | 50% (0.01 ION) | 50% (0.01 ION) | 28.8 ION |
551442-570063 | 50% (8.5 ION) | 50% (8.5 ION) | 316,574 ION |
570064-1013539 | 50% (5.75 ION) | 50% (5.75 ION) | 5,099,974 ION |
1013540-1457015 | 50% (2.875 ION) | 50% (2.875 ION) | 2,549,987 ION |
1457016-3677391 | 50% (0.925 ION) | 50% (0.925 ION) | 4,107,695.6 ION |
3677392-50981391 | 50% (0.1 ION) | 50% (0.1 ION) | 9,460,800 ION |
