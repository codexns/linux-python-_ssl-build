#!/bin/bash

set -e

sudo yum install git nano openssl-devel
sudo yum groupinstall "Development Tools"

curl -O https://www.python.org/ftp/python/3.3.3/Python-3.3.3.tgz
tar xvfz Python-3.3.3.tgz
rm Python-3.3.3.tgz

cd Python-3.3.3
./configure
make

cd ..
mkdir -p st3_linux_x32/libssl-10
cp Python-3.3.3/build/lib.linux-i686-3.3/_ssl.cpython-33m.so st3_linux_x32/libssl-10/

