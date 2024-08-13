#/bin/bash

alpineminirootfsfile="alpine-minirootfs-3.16.0-x86_64.tar.gz"
linuxver="linux-6.10"

wget -4 http://dl-cdn.alpinelinux.org/alpine/v3.16/releases/x86_64/$alpineminirootfsfile
mkdir alpine-minirootfs
tar -C ./alpine-minirootfs -xf $alpineminirootfsfile
wget -4 https://cdn.kernel.org/pub/linux/kernel/v6.x/$linuxver.tar.xz
tar -xf $linuxver.tar.xz

ln -s $linuxver linux
