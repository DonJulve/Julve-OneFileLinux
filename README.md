# Julve-OneFileLinux
> Este es un sistema operativo linux optimizado creado por mi y con la herramienta aircrack integrada, pesa tan solo 42 megas y está construido a partir de la versión 3.16.0 de alpine linux con el kernel vanilla 6.10

## Installacion
Se instala de la misma forma que instalarías un .efi

## Fotos del resultado final
![overview1](/assets/overview1.jpg "overview1")

![overview2](/assets/overview2.jpg "overview2")

## Compilación personal / actualización
> Usa https://pkgs.alpinelinux.org/contents para saber si los paquetes a instalar en la compilación son compatibles.

> Instala primero las dependencias necesarias de gcc y make (sabrás cuales son cuando la compilación empiece a fallar)

1. Ejecuta 01_get.sh (modifica las rutas para usar otras versiones de alpine o el kernel)

2. Ejecuta 02_chrootandinstall.sh (Se abrirá el chroot y ahí debes ejecutar esta parte)

```shell
apk update

apk upgrade

apk add aircrack-ng openrc nano mc htop tcpdump parted wpa_supplicant dropbear dropbear-ssh efibootmgr busybox-initscripts dmidecode kbd

exit
```

3. Ejecuta 03_conf.sh (elige los drivers que desees, en esta versión se incluyen todos los de red de Intel)

4. Ejecuta 04_build.sh

## Recomendación
> En caso de querer modificar cosas de la configuración mira los archivos de zfiles y el script 02 para que se incorporen a la configuración base.
