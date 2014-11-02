#!/bin/bash

set -e

sudo pacman --needed -Sy devtools

CHROOT=$(pwd)/chroot64
if [[ ! -e $CHROOT ]]; then
    mkdir -p chroot64
    sudo mkarchroot -C ./pacman-x64.conf -M ./makepkg-x64.conf $CHROOT/root base base-devel openssl
fi

sudo mkdir -p $CHROOT/root/src
sudo cp arch-py3-x64-build.sh $CHROOT/root/src/

sudo arch-chroot $CHROOT/root /src/arch-py3-x64-build.sh

mkdir -p st3_linux_x64/libssl-1.0.0
cp $CHROOT/root/src/st3_linux_x64/libssl-1.0.0/_ssl.cpython-33m.so st3_linux_x64/libssl-1.0.0/
