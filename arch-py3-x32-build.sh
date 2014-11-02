#!/bin/bash

set -e

cd /src

rm -Rf Python-3.3.3

if [[ ! -e Python-3.3.3.tgz ]]; then
    curl -O https://www.python.org/ftp/python/3.3.3/Python-3.3.3.tgz
fi
tar xvfz Python-3.3.3.tgz

cd Python-3.3.3/
./configure --host=i686-pc-linux-gnu --build=i686-pc-linux-gnu
make

cd ..
mkdir -p st3_linux_x32/libssl-1.0.0
cp Python-3.3.3/build/lib.linux-x86_64-3.3/_ssl.cpython-33m.so st3_linux_x32/libssl-1.0.0/
