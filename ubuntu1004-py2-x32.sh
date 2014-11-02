#!/bin/bash

set -e

sudo apt-get install git-core build-essential libssl-dev

rm -Rf Python-2.6.9

if [[ ! -e Python-2.6.9.tgz ]]; then
    curl -O https://www.python.org/ftp/python/2.6.9/Python-2.6.9.tgz
fi
tar xvfz Python-2.6.9.tgz

patch -p1 < py2-x32.patch

cd Python-2.6.9/
./configure --enable-unicode=ucs4
make

cd ..
mkdir -p st2_linux_x32/libssl-0.9.8
cp Python-2.6.9/build/lib.linux-i686-2.6/_ssl.so st2_linux_x32/libssl-0.9.8/
