#!/bin/bash

set -e

sudo apt-get install git-core build-essential libssl-dev

rm -Rf Python-3.3.3

if [[ ! -e Python-3.3.3.tgz ]]; then
    wget https://www.python.org/ftp/python/3.3.3/Python-3.3.3.tgz
fi
tar xvfz Python-3.3.3.tgz

cd Python-3.3.3/
./configure
make

cd ..
mkdir -p st3_linux_x32/libssl-1.0.0-versioned
cp Python-3.3.3/build/lib.linux-i686-3.3/_ssl.cpython-33m.so st3_linux_x32/libssl-1.0.0-versioned/
