#!/bin/bash
# Author Alexander Khudyakov(Miner113)
# Copyright (c) 2021-2023 The ZdeeXcoin developers

declare -r BLUE="\033[0;34m"
declare -r RED='\033[0;31m'
declare -r GREEN='\033[0;32m'
declare -r NC='\033[0m'

function start_setup() {
  echo -e ""
  echo -e " ${GREEN}Author Alexander Khudyakov(Miner113) ${NC}"
  echo -e ""
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e "  ⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣀⡍⣰⣆⣸⣿⣿   "
  echo -e "  ⣿⣿⣿⡿⠁⠀⢀⡆⠀⠀⠀⠀⠀⠀⠀⠛⠻⣄⡄⠘⠛⠻⣧⠻⣷⣿⣲⣿⣿⣿  "
  echo -e "  ⣿⣿⣿⠃⠀⠀⣼⡇⠀⠀⠀⠀⠀⠀⠀⣀⣠⣉⡟⢁⣾⣠⣟⣲⣿⣷⡹⣿⣿⣿  "
  echo -e "  ⣿⣿⠇⠀⠀⠘⠛⠃⠀⠀⠀⠀⢰⣯⣤⣿⣭⣿⣧⣼⣯⡽⣳⣿⠛⣿⣷⡽⣿⣿  "
  echo -e "  ⣿⣿⣦⣤⣤⣤⣤⣦⣤⣤⣵⣶⣿⣿⣿⣭⣽⣿⣽⣯⣭⣽⣯⣿⣿⣾⣿⣷⣿⣿ "
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e "  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ "
  echo -e ""
  echo -e ""
  echo -e "${BLUE}Welcome to the ZdeeXcoin installation${NC}"
  echo -e ""
  echo -e "${RED}Do you want to install ZdeeXcoin ?${NC}"
  echo -e ""
}

function install_packages() {
  echo -e "* Package installation"
  apt-get -y -o=Dpkg::Use-Pty=0 -o=Acquire::ForceIPv4=true install dirmngr wget software-properties-common ufw build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git zlib1g-dev wget bsdmainutils automake curl unzip nano libsodium-dev cmake
  cd
  wget https://zdeex.org/zdeexcoin.tgz
  tar -xvf zdeexcoin.tgz
  cp /root/zdeexcoin/install/zdeexcoind.service /etc/systemd/system
  cd /root/zdeexcoin
  ./fetch-params.sh
  echo -e "${GREEN}Installation fetch-params!${NC}"
  sudo ufw allow 65104
  sudo ufw allow 65105
  systemctl daemon-reload
  systemctl start zdeexcoind
  echo -e "${GREEN}Installation ZdeeXcoin!${NC}"
  systemctl enable zdeexcoind

}

function display_information() {
 echo
 echo -e "================================================================================================================================"
 echo -e "${GREEN}Installation completed!${NC}"
 echo -e "${GREEN}ZdeeXcoin Website${NC}: https://zdeex.org"
 echo -e "${GREEN}ZdeeXcoin Docs${NC}: https://docs.zdeex.org"
 echo -e "${GREEN}ZdeeXcoin Explorer: https${NC}://explorer.zdeex.org"
 echo -e "${GREEN}ZdeeXcoin node start${NC}: ${RED}systemctl start zdeexcoind${NC}"
 echo -e "${GREEN}ZdeeXcoin node restart${NC}: ${RED}systemctl restart zdeexcoind${NC}"
 echo -e "${GREEN}ZdeeXcoin node stop${NC}: ${RED}systemctl stop zdeexcoind${NC}"
 echo -e "${GREEN}Please check ${GREEN}ZdeeXcoin${NC} is running with the following command: ${GREEN}systemctl status zdeexcoind${NC}"
 echo -e "================================================================================================================================"
}

start_setup
install_packages
display_information
