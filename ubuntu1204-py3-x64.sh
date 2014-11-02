#!/bin/bash

set -e

sudo apt-get install git-core build-essential libssl-dev

wget https://www.python.org/ftp/python/3.3.3/Python-3.3.3.tgz
tar xvfz Python-3.3.3.tgz
rm Python-3.3.3.tgz

cd Python-3.3.3/
./configure
make

cd ..
mkdir -p st3_linux_x64/libssl-1.0.0-versioned
cp Python-3.3.3/build/lib.linux-x86_64-3.3/_ssl.cpython-33m.so st3_linux_x64/libssl-1.0.0-versioned/
