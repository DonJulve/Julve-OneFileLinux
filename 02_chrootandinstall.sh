#!/bin/bash
set -e

ROOTFS="alpine-minirootfs"

# Verificar si se ejecuta como root (necesario para mount y chroot)
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root (sudo ./02_chrootandinstall.sh)"
  exit 1
fi

# Preparar resolución de nombres para apk
cat > $ROOTFS/etc/resolv.conf << EOF
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

# Función de limpieza para desmontar directorios en caso de error o salida
cleanup() {
    echo "Desmontando directorios del sistema..."
    umount -l $ROOTFS/proc 2>/dev/null || true
    umount -l $ROOTFS/sys 2>/dev/null || true
    umount -l $ROOTFS/dev/pts 2>/dev/null || true
    umount -l $ROOTFS/dev 2>/dev/null || true
}

trap cleanup EXIT

echo "Montando directorios del sistema en $ROOTFS..."
mount -t proc /proc $ROOTFS/proc
mount -t sysfs /sys $ROOTFS/sys
mount -B /dev $ROOTFS/dev
mount -t devpts devpts $ROOTFS/dev/pts

echo "Ejecutando instalación de paquetes dentro del chroot..."

chroot $ROOTFS /bin/ash << EOF
apk update
apk upgrade
apk add aircrack-ng openrc nano mc htop tcpdump parted wpa_supplicant dropbear dropbear-ssh efibootmgr busybox-initscripts dmidecode kbd

# Opcional para interfaz wifi:
# apk add linux-firmware wireless-tools

echo "Terminado dentro del chroot."
EOF

echo "Instalación completada y montajes liberados."
