#/bin/bash

ln -s /etc/init.d/mdev ./alpine-minirootfs/etc/runlevels/sysinit/mdev
ln -s /etc/init.d/devfs ./alpine-minirootfs/etc/runlevels/sysinit/devfs
ln -s /etc/init.d/dmesg ./alpine-minirootfs/etc/runlevels/sysinit/dmesg
ln -s /etc/init.d/syslog ./alpine-minirootfs/etc/runlevels/sysinit/syslog
ln -s /etc/init.d/hwdrivers ./alpine-minirootfs/etc/runlevels/sysinit/hwdrivers
ln -s /etc/init.d/networking ./alpine-minirootfs/etc/runlevels/sysinit/networking
ln -s /etc/init.d/wpa_supplicant ./alpine-minirootfs/etc/runlevels/sysinit/wpa_supplicant
ln -s /etc/init.d/fontsize ./alpine-minirootfs/etc/runlevels/sysinit/fontsize
ln -s /etc/init.d/keymaps ./alpine-minirootfs/etc/runlevels/sysinit/keymaps

cat ./zfiles/wpa_supplicant.conf > ./alpine-minirootfs/etc/wpa_supplicant/wpa_supplicant.conf
cat ./zfiles/interfaces > ./alpine-minirootfs/etc/network/interfaces
cat ./zfiles/resolv.conf > ./alpine-minirootfs/etc/resolv.conf
cat ./zfiles/profile > ./alpine-minirootfs/etc/profile
cat ./zfiles/shadow > ./alpine-minirootfs/etc/shadow
cat ./zfiles/init > ./alpine-minirootfs/init
cat ./zfiles/motd.sh > ./alpine-minirootfs/etc/profile.d/motd.sh
echo -n "" > ./alpine-minirootfs/etc/motd
cat ./zfiles/color_prompt.sh > ./alpine-minirootfs/etc/profile.d/color_prompt.sh
mkdir -p alpine-minirootfs/usr/share/doc/
cat ./zfiles/wifi-howto.txt > ./alpine-minirootfs/usr/share/doc/wifi-howto.txt
cat ./zfiles/fontsize > ./alpine-minirootfs/usr/bin/fontsize
cat ./zfiles/keymaps > ./alpine-minirootfs/etc/conf.d/keymaps
cat ./zfiles/hostname > ./alpine-minirootfs/etc/hostname
cat ./zfiles/issue > ./alpine-minirootfs/etc/issue

mkdir -p alpine-minirootfs/usr/share/consolefonts/
cat ./zfiles/ter-u12n.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u12n.psf.gz
cat ./zfiles/ter-u14b.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u14b.psf.gz
cat ./zfiles/ter-u14n.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u14n.psf.gz
cat ./zfiles/ter-u16b.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u16b.psf.gz
cat ./zfiles/ter-u16n.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u16n.psf.gz
cat ./zfiles/ter-u18b.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u18b.psf.gz
cat ./zfiles/ter-u18n.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u18n.psf.gz
cat ./zfiles/ter-u20b.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u20b.psf.gz
cat ./zfiles/ter-u20n.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u20n.psf.gz
cat ./zfiles/ter-u22b.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u22b.psf.gz
cat ./zfiles/ter-u22n.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u22n.psf.gz
cat ./zfiles/ter-u24b.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u24b.psf.gz
cat ./zfiles/ter-u24n.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u24n.psf.gz
cat ./zfiles/ter-u28b.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u28b.psf.gz
cat ./zfiles/ter-u28n.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u28n.psf.gz
cat ./zfiles/ter-u32b.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u32b.psf.gz
cat ./zfiles/ter-u32n.psf.gz > ./alpine-minirootfs/usr/share/consolefonts/ter-u32n.psf.gz

chmod +x ./alpine-minirootfs/init
chmod +x ./alpine-minirootfs/usr/bin/fontsize


mkdir -p alpine-minirootfs/lib/
tar -C alpine-minirootfs/lib/ -xf zfiles/firmware.tar.xz
cp zfiles/.config linux/

cd linux
make menuconfig
