#!/bin/bash
set -e
redColour="\e[0;31m\033[1m"
endColour="\033[0m\e[0m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo -e "\n${redColour} Por favor, ejecuta este script como root (sudo ./auto.sh)"
  exit 1
fi


echo -e "\n${turquoiseColour}     _       _                 _ _____ _ _      _     _                  "
sleep 0.05
echo -e "    | |_   _| |_   _____      / |  ___(_) | ___| |   (_)_ __  _   ___  __"
sleep 0.05
echo -e " _  | | | | | \ \ / / _ \_____| | |_  | | |/ _ \ |   | | '_ \| | | \ \/ /"
sleep 0.05
echo -e "| |_| | |_| | |\ V /  __/_____| |  _| | | |  __/ |___| | | | | |_| |>  < "
sleep 0.05
echo -e " \___/ \__,_|_| \_/ \___|     |_|_|   |_|_|\___|_____|_|_| |_|\__,_/_/\_\ ${endColour}${yellowColour}(${endColour}${grayColour}Hecho por ${endColour}${purpleColour}@DonJulve${endColour}${yellowColour})${endColour}"

echo "--- Iniciando 01_get.sh ---"
./01_get.sh

echo "--- Iniciando 02_chrootandinstall.sh ---"
./02_chrootandinstall.sh

echo "--- Iniciando 03_conf.sh ---"
echo "NOTA: Al finalizar, se abrirá el menú de configuración del kernel."
./03_conf.sh

echo "--- Iniciando 04_build.sh ---"
./04_build.sh

echo "--- Proceso completado con éxito! ---"
