#!/bin/bash

# Enhanced Color Palette
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
MAGENTA='\033[0;95m'
ORANGE='\033[0;91m'
LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\033[1;32m'
LIGHT_YELLOW='\033[1;33m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'

# Text Formatting
BOLD='\033[1m'
NC='\033[0m'

# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${LIGHT_PURPLE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}║                                                                               ║${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}║                    ${LIGHT_YELLOW}${BOLD}⭐ AUTO INSTALLER THEMA PTERODACTYL ⭐${NC}${LIGHT_PURPLE}${BOLD}                    ║${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}║                          ${WHITE}${BOLD}© VERLANGID COMMUNITY${NC}${LIGHT_PURPLE}${BOLD}                           ║${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}║                                                                               ║${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  echo -e "script ini di buat untuk mempermudah penginstalasian thema pterodactyle,"
  echo -e "Dilarang Keras Share Bebas."
  echo -e ""
  echo -e "${GREEN}${BOLD}📱 MEDIA SOSIAL:${NC}"
  echo -e "${PURPLE}${BOLD}🟥 YOUTUBE : ${YELLOW}@verlangid${NC}"
  echo -e "${PURPLE}${BOLD}🟪 INSTAGRAM : ${YELLOW}@verlang11${NC}"
  echo -e "${PURPLE}${BOLD}⬛ TIKTOK : ${YELLOW}@verlangid${NC}"
  echo -e "${PURPLE}${BOLD}🟦 TELEGRAM : ${YELLOW}@verlagid11${NC}"
  echo -e ""
  echo -e "${MAGENTA}${BOLD}💎 CREDITS: @verlangid${NC}"
  sleep 4
  clear
}

#Update and install jq
install_jq() {
  echo -e "                                                       "
  echo -e "${CYAN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}${BOLD}║                       ${WHITE}🔧 UPDATE & INSTALL JQ 🔧${NC}${CYAN}${BOLD}                       ║${NC}"
  echo -e "${CYAN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║                         ${WHITE}✅ INSTALL JQ BERHASIL ✅${NC}${GREEN}${BOLD}                           ║${NC}"
    echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}║                          ${WHITE}❌ INSTALL JQ GAGAL ❌${NC}${RED}${BOLD}                            ║${NC}"
    echo -e "${RED}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}
#Check user token
check_token() {
  echo -e "                                                       "
  echo -e "${PURPLE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${PURPLE}${BOLD}║                        ${LIGHT_CYAN}🔐 LICENSY VERLANGID CODE 🔐${NC}${PURPLE}${BOLD}                        ║${NC}"
  echo -e "${PURPLE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  echo -e "${YELLOW}${BOLD}🔑 MASUKAN AKSES TOKEN :${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "verlangid" ]; then
    echo -e "${GREEN}${BOLD}🎉 AKSES BERHASIL! 🎉${NC}"
  else
    echo -e "${RED}${BOLD}❌ Token Salah! Beli Kode Token Di Verlangid${NC}"
    echo -e "${PURPLE}${BOLD}🟦 TELEGRAM : ${YELLOW}@verlagid11${NC}"
    echo -e "${YELLOW}WHATSAPP : +6287821239407${NC}"
    echo -e "${YELLOW}DUKUNG VERLANG DENGAN FOLLOW!${NC}"
    echo -e "${MAGENTA}${BOLD}© Verlangid${NC}"
    exit 1
  fi
  clear
}

# Install theme
install_theme() {
  clear
  echo -e "${LIGHT_BLUE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${LIGHT_BLUE}${BOLD}║                     ${WHITE}🎨 INSTALL PTERODACTYL THEME 🎨${NC}${LIGHT_BLUE}${BOLD}                     ║${NC}"
  echo -e "${LIGHT_BLUE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo ""

  echo -e "${YELLOW}${BOLD}🎭 PILIH THEME YANG INGIN DIINSTALL:${NC}"
  echo "1. Stellar"
  echo "2. Billing"
  echo "3. Enigma"
  echo "x. Kembali"
  echo -ne "${GREEN}${BOLD}➤ Masukkan pilihan (1/2/3/x): ${NC}"
  read -r SELECT_THEME

  case "$SELECT_THEME" in
    1)
      THEME_NAME="stellar"
      ;;
    2)
      THEME_NAME="billing"
      ;;
    3)
      THEME_NAME="enigma"
      ;;
    x)
      return
      ;;
    *)
      echo -e "${RED}${BOLD}❌ Pilihan tidak valid.${NC}"
      sleep 1
      install_theme
      return
      ;;
  esac

  THEME_URL="https://github.com/VerlangId/Installermenuverlang/raw/main/${THEME_NAME}.zip"

  echo -e "${YELLOW}${BOLD}📥 Mengunduh theme $THEME_NAME...${NC}"
  wget -q -O "/root/${THEME_NAME}.zip" "$THEME_URL"

  if [ ! -f "/root/${THEME_NAME}.zip" ]; then
    echo -e "${RED}${BOLD}❌ Gagal mengunduh theme.${NC}"
    return
  fi

  unzip -oq "/root/${THEME_NAME}.zip" -d /root/pterodactyl

  if [ "$THEME_NAME" == "enigma" ]; then
    echo -e "${YELLOW}${BOLD}📱 Masukkan link WhatsApp (https://wa.me/...):${NC}"
    read LINK_WA
    echo -e "${YELLOW}${BOLD}👥 Masukkan link group:${NC}"
    read LINK_GROUP
    echo -e "${YELLOW}${BOLD}📺 Masukkan link channel:${NC}"
    read LINK_CHNL

    sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
  fi

  echo -e "${YELLOW}${BOLD}⚡ Menginstall dependensi dan apply theme...${NC}"
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl

  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm install -g yarn

  cd /var/www/pterodactyl || { echo -e "${RED}${BOLD}❌ Direktori tidak ditemukan!${NC}"; return; }

  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear

  rm -f "/root/${THEME_NAME}.zip"
  rm -rf /root/pterodactyl

  echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║                       ${WHITE}🎉 INSTALLASI THEME BERHASIL! 🎉${NC}${GREEN}${BOLD}                       ║${NC}"
  echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  sleep 2
  clear
}


# Uninstall theme
uninstall_theme() {
  echo -e "                                                       "
  echo -e "${RED}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${RED}${BOLD}║                         ${WHITE}🗑️  DELETE THEME 🗑️${NC}${RED}${BOLD}                          ║${NC}"
  echo -e "${RED}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  bash <(curl https://raw.githubusercontent.com/Verlangid11/installer-theme/main/repair.sh)
  echo -e "                                                       "
  echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║                        ${WHITE}✅ DELETE THEME SUKSES ✅${NC}${GREEN}${BOLD}                         ║${NC}"
  echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}
install_themeSteeler() {
#!/bin/bash

echo -e "                                                       "
echo -e "${LIGHT_PURPLE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${LIGHT_PURPLE}${BOLD}║                       ${WHITE}⭐ INSTALLASI STELLAR THEME ⭐${NC}${LIGHT_PURPLE}${BOLD}                       ║${NC}"
echo -e "${LIGHT_PURPLE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo -e "                                                                   "

# Unduh file tema
wget -O /root/stellar.zip https://github.com/VerlangId/Installermenuverlang/raw/main/stellar.zip


# Ekstrak file tema
unzip /root/stellar.zip -d /root/pterodactyl

# Salin tema ke direktori Pterodactyl
sudo cp -rfT /root/pterodactyl /var/www/pterodactyl

# Instal Node.js dan Yarn
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm i -g yarn

# Instal dependensi dan build tema
cd /var/www/pterodactyl
yarn add react-feather
php artisan migrate
yarn build:production
php artisan view:clear

# Hapus file dan direktori sementara
sudo rm /root/stellar.zip
sudo rm -rf /root/pterodactyl

echo -e "                                                       "
echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}║                        ${WHITE}🎉 INSTALL SUCCESS! 🎉${NC}${GREEN}${BOLD}                        ║${NC}"
echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
echo -e ""
sleep 2
clear
exit 0

}
create_node() {
  read -p "Masukkan nama node: " node_name
  read -p "Masukkan lokasi ID: " locid
  read -p "Masukkan domain node (tanpa https://): " domain
  read -p "Masukkan total RAM (MB): " ram
  read -p "Masukkan total Disk (MB): " disk_space

  php artisan p:node:make <<EOF
$node_name
$node_name
$locid
https
$domain
yes
no
no
$ram
$ram
$disk_space
$disk_space
100
8080
2022
/var/lib/pterodactyl/volumes
EOF

  echo "Node berhasil dibuat."

  # Setup allocation otomatis
  read -p "Masukkan IP address untuk allocation: " ip_address
  read -p "Masukkan Port (contoh: 25565): " port
  read -p "Masukkan IP alias (boleh kosong): " ip_alias

  php artisan p:allocation:make <<EOF
$node_name
$ip_address
$port
$ip_alias
EOF

  echo "Allocation berhasil ditambahkan ke node $node_name."
}
uninstall_panel() {
  echo -e "                                                       "
  echo -e "${RED}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${RED}${BOLD}║                        ${WHITE}🗑️  UNINSTALL PANEL 🗑️${NC}${RED}${BOLD}                         ║${NC}"
  echo -e "${RED}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "


bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF


  echo -e "                                                       "
  echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║                       ${WHITE}✅ UNINSTALL PANEL SUKSES ✅${NC}${GREEN}${BOLD}                       ║${NC}"
  echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
configure_wings() {
  echo -e "                                                       "
  echo -e "${LIGHT_BLUE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${LIGHT_BLUE}${BOLD}║                        ${WHITE}🛠️  CONFIGURE WINGS 🛠️${NC}${LIGHT_BLUE}${BOLD}                         ║${NC}"
  echo -e "${LIGHT_BLUE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  #!/bin/bash

# Minta input token dari pengguna
read -p "Masukkan token Configure menjalankan wings: " wings

eval "$wings"
# Menjalankan perintah systemctl start wings
sudo systemctl start wings

  echo -e "                                                       "
  echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║                      ${WHITE}✅ CONFIGURE WINGS SUKSES ✅${NC}${GREEN}${BOLD}                       ║${NC}"
  echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
hackback_panel() {
  echo -e "                                                       "
  echo -e "${MAGENTA}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${MAGENTA}${BOLD}║                        ${WHITE}🔓 HACK BACK PANEL 🔓${NC}${MAGENTA}${BOLD}                         ║${NC}"
  echo -e "${MAGENTA}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  # Minta input dari pengguna
read -p "Masukkan Username Panel: " user
read -p "password login " psswdhb
  #!/bin/bash
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:user:make <<EOF
yes
hackback@gmail.com
$user
$user
$user
$psswdhb
EOF
  echo -e "                                                       "
  echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║                        ${WHITE}✅ AKUN TELAH DI ADD ✅${NC}${GREEN}${BOLD}                        ║${NC}"
  echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
ubahpw_vps() {
  echo -e "                                                       "
  echo -e "${ORANGE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${ORANGE}${BOLD}║                        ${WHITE}🔐 UBAH PASSWORD VPS 🔐${NC}${ORANGE}${BOLD}                         ║${NC}"
  echo -e "${ORANGE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
read -p "Masukkan Pw Baru: " pw
read -p "Masukkan Ulang Pw Baru " pw

passwd <<EOF
$pw
$pw

EOF


  echo -e "                                                       "
  echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║                      ${WHITE}✅ GANTI PW VPS SUKSES ✅${NC}${GREEN}${BOLD}                      ║${NC}"
  echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
# Main script
display_welcome
install_jq
check_token

while true; do
  clear
  echo -e "                                                                     "
  echo -e "${LIGHT_PURPLE}${BOLD}        _,gggggggggg.                     🚀 VERLANGID COMMUNITY 🚀${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}    ,ggggggggggggggggg.                                           ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}  ,ggggg        gggggggg.                 Auto Installer Verlangid${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD} ,ggg'               'ggg.                ────────────────────── ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}',gg       ,ggg.      'ggg:               💎 Verlangid Community${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}'ggg      ,gg'''  .    ggg               📱 @verlangid         ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}gggg      gg     ,     ggg               🎯 Premium Scripts     ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}ggg:     gg.     -   ,ggg                ⚡ Fast & Reliable    ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD} ggg:     ggg._    _,ggg                 🔧 Easy Installation   ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD} ggg.    '.'''ggggggp                    🛡️  Secure & Updated   ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}  'ggg    '-.__                                                 ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}    ggg                                                         ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}      ggg                                                       ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}        ggg.                                                    ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}          ggg.                                                  ${NC}"
  echo -e "${LIGHT_PURPLE}${BOLD}             b.                                                 ${NC}"
  echo -e "                                                                     "
  echo -e "${YELLOW}${BOLD}📋 BERIKUT LIST INSTALL :${NC}"
  echo -e "${CYAN}${BOLD}1.${NC} ${WHITE}🎨 Install theme${NC}"
  echo -e "${CYAN}${BOLD}2.${NC} ${WHITE}🗑️  Uninstall theme${NC}"
  echo -e "${CYAN}${BOLD}3.${NC} ${WHITE}🛠️  Configure Wings${NC}"
  echo -e "${CYAN}${BOLD}4.${NC} ${WHITE}🖥️  Create Node${NC}"
  echo -e "${CYAN}${BOLD}5.${NC} ${WHITE}🗑️  Uninstall Panel${NC}"
  echo -e "${CYAN}${BOLD}6.${NC} ${WHITE}⭐ Stellar Theme${NC}"
  echo -e "${CYAN}${BOLD}7.${NC} ${WHITE}🔓 Hack Back Panel${NC}"
  echo -e "${CYAN}${BOLD}8.${NC} ${WHITE}🔐 Ubah Pw Vps${NC}"
  echo -e "${CYAN}${BOLD}x.${NC} ${WHITE}🚪 Exit${NC}"
  echo -e "${GREEN}${BOLD}➤ Masukkan pilihan 1/2/x:${NC}"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
      3)
      configure_wings
      ;;
      4)
      create_node
      ;;
      5)
      uninstall_panel
      ;;
      6)
      install_themeSteeler
      ;;
      7)
      hackback_panel
      ;;
      8)
      ubahpw_vps
      ;;
    x)
      echo -e "${YELLOW}${BOLD}👋 Keluar dari skrip.${NC}"
      echo -e "${MAGENTA}${BOLD}© Verlangid Community${NC}"
      exit 0
      ;;
    *)
      echo -e "${RED}${BOLD}❌ Pilihan tidak valid, silahkan coba lagi.${NC}"
      sleep 2
      ;;
  esac
done