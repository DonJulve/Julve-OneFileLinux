# Julve-OneFileLinux
> Este es un sistema operativo linux optimizado creado por mi y con la herramienta aircrack integrada, pesa tan solo 42 megas y está construido a partir de la versión 3.16.0 de alpine linux con el kernel vanilla 6.10

## Installacion
En un USB pon el archivo BOOTx64.efi en /EFI/BOOT/ (Deberás crear dichas carpetas en caso de no tenerlas)

## Fotos del resultado final
![overview1](/assets/overview1.jpg "overview1")

![overview2](/assets/overview2.jpg "overview2")

## Compilación personal / actualización
> Usa https://pkgs.alpinelinux.org/contents para saber si los paquetes a instalar en la compilación son compatibles.

### Dependencias necesarias

#### 1. En tu máquina (Host/Construcción)
Para compilar el kernel y ejecutar los scripts de empaquetado:
*   **Herramientas base**: `bash`, `wget`, `tar`, `gzip`, `xz-utils`, `bc`.
*   **Compilación**: `gcc`, `make`, `flex`, `bison`, `libssl-dev`, `libelf-dev`.
*   **Sistema**: `kmod` (para `depmod`), `coreutils` (para `chroot`).

> [!TIP]
> En Debian/Ubuntu puedes instalar casi todo con:
> `sudo apt install build-essential libncurses-dev bison flex libssl-dev libelf-dev wget tar xz-utils bc`

#### 2. En el sistema final
Estos paquetes se instalan durante el paso 2 y forman parte del sistema Julve-OneFileLinux:
*   `aircrack-ng`, `tcpdump`, `wpa_supplicant`, `efibootmgr`.
*   `openrc`, `busybox-initscripts`, `dmidecode`, `kbd`, `parted`.
*   `nano`, `mc`, `htop`, `dropbear`.

---
### Build

#### Automática
Ejecuta `auto.sh` con privilegios de root
```shell
sudo ./auto.sh
```

#### Manual
1. Ejecuta `01_get.sh` (Modifica las rutas para usar otras versiones de alpine o el kernel)

```shell
./01_get.sh
```

2. Ejecuta `02_chrootandinstall.sh` con privilegios de root

```shell
sudo ./02_chrootandinstall.sh
```

3. Ejecuta `03_conf.sh` con privilegios de root (elige los drivers que desees, en esta versión se incluyen todos los de red de Intel):

```shell
sudo ./03_conf.sh
```

4. Ejecuta `04_build.sh` con privilegios de root

```shell
sudo ./04_build.sh
```

## Recomendación
> En caso de querer modificar cosas de la configuración mira los archivos de zfiles y el script 02 para que se incorporen a la configuración base.
