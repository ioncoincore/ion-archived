# Ion Core Documentation

Table of Contents
-----------------
- [Ion Core Documentation](#ion-core-documentation)
    - [Setup](#setup)
    - [Running](#running)
        - [Unix](#unix)
        - [Windows](#windows)
        - [OSX](#osx)
        - [Need Help?](#need-help)
    - [Building](#building)
    - [Development](#development)
    - [Resources](#resources)
    - [Miscellaneous](#miscellaneous)
    - [License](#license)

## Setup
[Ion Core](http://core.ioncoin.org/) is the original ION client and it builds the backbone of the network. However, it downloads and stores the entire history of ION transactions; depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more. Thankfully you only have to do this once.

## Running

The following are some helpful notes on how to run ION on your native platform.

### Unix

Unpack the files into a directory and run:

- bin/ion-qt (GUI, 32-bit) or bin/iond (headless, 32-bit)
- bin/ion-qt (GUI, 64-bit) or bin/iond (headless, 64-bit)

### Windows

Unpack the files into a directory, and then run ion-qt.exe.

### OSX

Drag Ion-Qt to your applications folder, and then run Ion-Qt.

### Need Help?

- See the documentation at the [Ion Wiki](https://github.com/ioncoincore/ion/wiki) and [Bitcoin Wiki](https://en.bitcoin.it/wiki/Main_Page)
for help and more information.
- Ask for help on [Discord chat]()
  - [BitcoinTalk](https://bitcointalk.org/index.php?topic=1443633.0)
- Join our Discord [Discord](https://discord.gg/vuZn7gC)

## Building
The following are developer notes on how to build ION on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [OSX Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Gitian Building Guide](gitian-building.md)

## Development
The Ion repo's [root README](https://github.com/ioncoincore/ion/blob/master/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Multiwallet Qt Development](multiwallet-qt.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://dev.visucore.com/bitcoin/doxygen/) ***TODO***
- [Translation Process](translation_process.md)
- [Unit Tests](unit-tests.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Dnsseed Policy](dnsseed-policy.md)

## Resources

- Discuss on the [BitcoinTalk](https://bitcointalk.org/index.php?topic=1443633.0) or the [ION](http://forum.ioncoin.org/) forum.
- Join [Ion Discord](https://discord.gg/vuZn7gC).

## Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)

## License
Distributed under the [MIT/X11 software license](http://www.opensource.org/licenses/mit-license.php).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.