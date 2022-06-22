#!/bin/bash

info()  { echo -e "\\033[1;36m[INFO]\\033[0m  $*"; }
fatal() { echo -e "\\033[1;31m[FATAL]\\033[0m  $*"; exit 1 ; }

arch=$(uname -m)

command_exists () {

  command -v "${1}" >/dev/null 2>&1
}


check_os () {

  info "Detectando SO..."
  sleep 2

  OS=$(uname)
  readonly OS
  info "Sistema Operativo: $OS"
  sleep 2
  if [ "${OS}" = "Linux" ] ; then
    info "Iniciando instalación en Linux..."
    sleep 2
    install_linux
  else
    fatal "No soporto el sistema: $OS"
  fi
}


install_linux () {

  info "Detectando distro linux..."

  Distro=''
  if [ -d $PREFIX/include/ ] ; then
    Distro='Termux'
  elif [ -f /etc/os-release ] ; then
    DISTRO_ID=$(grep ^ID= /etc/os-release | cut -d= -f2-)
    if [ "${DISTRO_ID}" = 'kali' ] ; then
      Distro='Kali'
    elif [ "${DISTRO_ID}" = 'debian' ] ; then
      Distro='Debian'
    elif [ "${DISTRO_ID}" = 'arch' ] || [ "${DISTRO_ID}" = 'archarm' ] ; then
      Distro='Arch'
    elif [ "${DISTRO_ID}" = 'parrot' ] ; then
      Distro="Parrot"
    elif [ "${DISTRO_ID}" = "ubuntu" ] ; then
      Distro="Ubuntu"
    fi
  fi

  if [ -z "${Distro}" ] ; then
    fatal "No soporto tu distro del sistema ${OS}"
  fi

  readonly Distro
  sleep 2
  info "Distro Linux: ${Distro}"
  sleep 2
  neofetch --ascii_distro $Distro
  echo
  info "Instalando en ${Distro} paquetes necesarios..."
  sleep 3
  if [ "${Distro}" = "Debian" ] || [ "${Distro}" = "Kali" ] || [ "${Distro}" = "Ubuntu" ] || [ "${Distro}" = "Parrot" ] ; then
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install curl git wget php openssh-server net-tools python3 python3-pip unzip -y
    clear
    command -v ngrok > /dev/null 2>&1 || { echo >&2 "Ngrok no está instalado. Instalando..."; ngrok_install; }
    sleep 2
    clear
  elif [ "${Distro}" = "Arch" ]; then
    sudo pacman -Syu # Updates repo, dependencies, etc.
    sudo pacman -S curl git wget php python3 python-pip openssh unzip
    clear
    command -v ngrok > /dev/null 2>&1 || { echo >&2 "Ngrok no está instalado. Instalando..."; ngrok_install; }
    sleep 2
    clear
  elif [ "${Distro}" = "Termux" ]; then
    pkg update && pkg upgrade -y
    termux-setup-storage
    pkg install -y curl wget php openssh python
    clear
    command -v ngrok > /dev/null 2>&1 || { echo >&2 "Ngrok no está instalado. Instalando..."; ngrok_install; }
    sleep 2
    clear
  fi
}

finish () {
  echo
  info "Instalación completada!"
  echo
  info "Ejecuta: \\033[1;32m bash predator-phish.sh\\033[0m  para iniciar ;)"
  echo
}


ngrok_install() {

if [ "${Distro}" = "Debian" ] || [ "${Distro}" = "Kali" ] || [ "${Distro}" = "Ubuntu" ] || [ "${Distro}" = "Parrot" ] ; then
    ngrok-kali
elif [ "${Distro}" = "Termux" ]; then
    ngrok-t
else
    fatal "Instalación de ngrok en ${Distro} aún no soportada"
fi
}

ngrok-kali() {
if [ $arch == 'aarch64' ] ; then
clear
info "Instalando ngrok en ${Distro}...\\033[0m"
sleep 5
wget "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.tgz"
tar -xvzf  "ngrok-stable-linux-arm64.tgz"
rm ngrok-stable-linux-arm64.tgz
chmod 777 ngrok
mv ngrok /usr/bin/
cp /usr/bin/ngrok .
sleep 5
echo -e "\033[92m[•] \033[93mEscribe tu authtoken de ngrok y pulsa ENTER... "
read -r token
$token
sleep 3
info "Ngrok Listo!... "
sleep 2
else
clear
info "Instalando ngrok en ${Distro}...\\033[0m"
sleep 5
unzip depen/ngrok-stable-linux-arm.zip
chmod 777 ngrok
mv ngrok /usr/bin/
cp /usr/bin/ngrok .
sleep 5
echo -e "\033[92m[•] \033[93mEscribe tu authtoken de ngrok y pulsa ENTER... "
read -r token
$token
sleep 1
info "Ngrok Listo!... "
sleep 2
fi
}

ngrok-t() {
if [ $arch == 'aarch64' ] ; then
clear
info "Instalando ngrok en ${Distro}...\\033[0m"
sleep 5
wget "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.tgz"
tar -xvzf  "ngrok-stable-linux-arm64.tgz"
rm ngrok-stable-linux-arm64.tgz
chmod 777 ngrok
mv ngrok $PREFIX/bin/
cp $PREFIX/bin/ngrok .
sleep 5
echo -e "\033[92m[•] \033[93mEscribe tu authtoken de ngrok y pulsa ENTER... "
read -r token
$token
sleep 3
info "Ngrok Listo!... "
sleep 2
else
clear
info "Instalando ngrok en ${Distro}...\\033[0m"
sleep 5
unzip depen/ngrok-stable-linux-arm.zip
chmod 777 ngrok
mv ngrok $PREFIX/bin/
cp $PREFIX/bin/ngrok .
sleep 5
echo -e "\033[92m[•] \033[93mEscribe tu authtoken de ngrok y pulsa ENTER... "
read -r token
$token
sleep 1
info "Ngrok Listo!... "
sleep 2
fi
}


main () {
  clear
  check_os
  finish
}

main "$@"
