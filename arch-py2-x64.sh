#!/bin/bash

set -e

sudo pacman --needed -Sy devtools

CHROOT=$(pwd)/chroot64
if [[ ! -e $CHROOT ]]; then
    mkdir -p chroot64
    sudo mkarchroot -C ./pacman-x64.conf -M ./makepkg-x64.conf $CHROOT/root base base-devel openssl
fi

sudo mkdir -p $CHROOT/root/src
sudo cp arch-py2-x64-build.sh $CHROOT/root/src/
sudo cp py2-x64.patch $CHROOT/root/src/

sudo arch-chroot $CHROOT/root /src/arch-py2-x64-build.sh

mkdir -p st2_linux_x64/libssl-1.0.0
cp $CHROOT/root/src/st2_linux_x64/libssl-1.0.0/_ssl.so st2_linux_x64/libssl-1.0.0/
