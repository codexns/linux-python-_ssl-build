#!/bin/bash

set -e

sudo pacman --needed -Sy devtools

CHROOT=$(pwd)/chroot32
if [[ ! -e $CHROOT ]]; then
    mkdir -p chroot32
    sudo mkarchroot -C ./pacman-x32.conf -M ./makepkg-x32.conf $CHROOT/root base base-devel openssl
fi

sudo mkdir -p $CHROOT/root/src
sudo cp arch-py2-x32-build.sh $CHROOT/root/src/
sudo cp py2-x32.patch $CHROOT/root/src/

sudo arch-chroot $CHROOT/root /src/arch-py2-x32-build.sh

mkdir -p st2_linux_x32/libssl-1.0.0
cp $CHROOT/root/src/st2_linux_x32/libssl-1.0.0/_ssl.so st2_linux_x32/libssl-1.0.0/
