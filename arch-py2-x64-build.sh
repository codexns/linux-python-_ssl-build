#!/bin/bash

set -e

cd /src

rm -Rf Python-2.6.9

if [[ ! -e Python-2.6.9.tgx ]]; then
    curl -O https://www.python.org/ftp/python/2.6.9/Python-2.6.9.tgz
fi
tar xvfz Python-2.6.9.tgz

patch -p1 < py2-x64.patch

cd Python-2.6.9/
./configure --enable-unicode=ucs4
make

cd ..
mkdir -p st2_linux_x64/libssl-1.0.0
cp Python-2.6.9/build/lib.linux-x86_64-2.6/_ssl.so st2_linux_x64/libssl-1.0.0/
