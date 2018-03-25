
Debian
====================
This directory contains files used to package iond/ion-qt
for Debian-based Linux systems. If you compile iond/ion-qt yourself, there are some useful files here.

## ion: URI support ##


ion-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install ion-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your ionqt binary to `/usr/bin`
and the `../../share/pixmaps/ion128.png` to `/usr/share/pixmaps`

ion-qt.protocol (KDE)

