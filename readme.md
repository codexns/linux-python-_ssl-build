# Linux Python _ssl Compile

Scripts to compile the `_ssl.so` library for Python against various versions of OpenSSL.

Currently in the wild there are three versions of OpenSSL that `_ssl.so` may need to be
compiled against:

 - libssl-0.9.8
 - libssl-1.0.0
 - libssl-10

The best linux distros to compile these on are:

 - libssl-0.9.8: Ubuntu 10.04
 - libssl-1.0.0: Ubuntu 12.04
 - libssl-10: Fedora 20

We pick Ubuntu since they strip out support for SSLv2, and if you compile it on another distro
and try to run it on Ubuntu, there will be import errors.

Currently this repo has scripts for Python 3.3, mostly in the service of providing `_ssl.so`
for Sublime Text 3. I had previously compiled for Sublime Text 2 and haven't gone back and
created scripts for Python 2.6.
