
Debian
====================
This directory contains files used to package skytered/skytere-qt
for Debian-based Linux systems. If you compile skytered/skytere-qt yourself, there are some useful files here.

## skytere: URI support ##


skytere-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install skytere-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your skytere-qt binary to `/usr/bin`
and the `../../share/pixmaps/skytere128.png` to `/usr/share/pixmaps`

skytere-qt.protocol (KDE)

