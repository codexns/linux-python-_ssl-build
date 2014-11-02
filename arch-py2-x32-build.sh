#!/bin/bash

set -e

cd /src

rm -Rf Python-2.6.9

if [[ ! -e Python-2.6.9.tgz ]]; then
    curl -O https://www.python.org/ftp/python/2.6.9/Python-2.6.9.tgz
fi
tar xvfz Python-2.6.9.tgz

patch -p1 < py2-x32.patch

cd Python-2.6.9/
./configure --host=i686-pc-linux-gnu --build=i686-pc-linux-gnu
make

cd ..
mkdir -p st2_linux_x32/libssl-1.0.0
cp Python-2.6.9/build/lib.linux-x86_64-2.6/_ssl.so st2_linux_x32/libssl-1.0.0/
