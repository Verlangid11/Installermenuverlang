#!/bin/bash

# Professional Color Scheme
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

# Display professional welcome message
display_welcome() {
  clear
  echo -e ""
  echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}${BOLD}║                                                                  ║${NC}"
  echo -e "${CYAN}${BOLD}║${WHITE}                    AUTO INSTALLER THEMA                      ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}║${YELLOW}                      © VERLANGID                             ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}║                                                                  ║${NC}"
  echo -e "${CYAN}${BOLD}╠══════════════════════════════════════════════════════════════════╣${NC}"
  echo -e "${CYAN}${BOLD}║${WHITE}                Professional Theme Management                 ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  echo -e "${WHITE}${BOLD}┌─────────────────────────────────────────────────────────────────┐${NC}"
  echo -e "${WHITE}${BOLD}│${NC} ${DIM}Script ini dibuat untuk mempermudah penginstalasian thema${WHITE}  │${NC}"
  echo -e "${WHITE}${BOLD}│${NC} ${DIM}pterodactyl dengan tampilan yang profesional dan modern.${WHITE}   │${NC}"
  echo -e "${WHITE}${BOLD}│${NC} ${RED}${BOLD}Dilarang Keras Share Bebas.${WHITE}                                │${NC}"
  echo -e "${WHITE}${BOLD}└─────────────────────────────────────────────────────────────────┘${NC}"
  echo -e ""
  echo -e "${PURPLE}${BOLD}🟥 YOUTUBE : ${YELLOW}@verlangid${NC}"
  echo -e "${PURPLE}${BOLD}🟪 INSTAGRAM : ${YELLOW}@verlang11${NC}"
  echo -e "${PURPLE}${BOLD}⬛ TIKTOK : ${YELLOW}@verlangid${NC}"
  echo -e "${PURPLE}${BOLD}🟦 : TELEGRAM ${YELLOW}@verlagid11${NC}"
  echo -e ""
  sleep 4
  clear
}

#Update and install jq
install_jq() {
  echo -e ""
  echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}${BOLD}║${WHITE}               UPDATE SYSTEM & INSTALL JQ                     ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  echo -e "${YELLOW}${BOLD}⚡ Memperbarui sistem dan menginstall dependencies...${NC}"
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e ""
    echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║${WHITE}              ✅ INSTALL JQ BERHASIL                         ${GREEN}║${NC}"
    echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  else
    echo -e ""
    echo -e "${RED}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}║${WHITE}              ❌ INSTALL JQ GAGAL                             ${RED}║${NC}"
    echo -e "${RED}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
    exit 1
  fi
  echo -e ""
  sleep 1
  clear
}

#Check user token
check_token() {
  echo -e ""
  echo -e "${PURPLE}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${PURPLE}${BOLD}║${WHITE}               🔐 VERLANGID LICENSE SYSTEM                   ${PURPLE}║${NC}"
  echo -e "${PURPLE}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  echo -e "${YELLOW}${BOLD}🔑 MASUKAN AKSES TOKEN :${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "verlangdev" ]; then
    echo -e "${GREEN}${BOLD}✅ AKSES BERHASIL - SELAMAT DATANG!${NC}"
  else
    echo -e "${RED}${BOLD}❌ Token Salah! Beli Kode Token Di Verlangid${NC}"
    echo -e ""
    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║${WHITE}                   📞 KONTAK PEMBELIAN                        ${CYAN}║${NC}"
    echo -e "${CYAN}${BOLD}╠══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${YELLOW}${BOLD}❕FOLLOW SEKARANG${NC}"
        echo -e ""
        echo -e "${PURPLE}${BOLD}📱 KONTAK PEMBELIAN:${NC}"
        echo -e "${PURPLE}${BOLD}🟦 TELEGRAM  : ${YELLOW}@verlangid11${NC}"
        echo -e "${PURPLE}${BOLD}💬 WHATSAPP  : ${YELLOW}+6287821239407${NC}"
        echo -e ""
        echo -e "${GREEN}${BOLD}🌐 TOKEN IS PRIVATE${NC}"
        echo -e "${MAGENTA}${BOLD}© Verlangid Community${NC}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
    exit 1
  fi
  clear
}

# Install theme
install_theme() {
  clear
  echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}${BOLD}║${WHITE}                🎨 INSTALL PTERODACTYL THEME                  ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo ""

  echo -e "${YELLOW}${BOLD}🎯 PILIH THEME YANG INGIN DIINSTALL:${NC}"
  echo -e "${WHITE}${BOLD}┌─────────────────────────────────────────────────────────────────┐${NC}"
  echo -e "${WHITE}${BOLD}│${NC} ${CYAN}1.${NC} ${GREEN}⭐ Stellar Theme${NC}${WHITE}                                        │${NC}"
  echo -e "${WHITE}${BOLD}│${NC} ${CYAN}2.${NC} ${BLUE}💳 Billing Theme${NC}${WHITE}                                        │${NC}"
  echo -e "${WHITE}${BOLD}│${NC} ${CYAN}3.${NC} ${PURPLE}🔮 Enigma Theme${NC}${WHITE}                                         │${NC}"
  echo -e "${WHITE}${BOLD}│${NC} ${RED}x.${NC} ${YELLOW}⬅️  Kembali${NC}${WHITE}                                              │${NC}"
  echo -e "${WHITE}${BOLD}└─────────────────────────────────────────────────────────────────┘${NC}"
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

  THEME_URL="https://github.com/Verlangid11/Installermenuverlang/raw/main/${THEME_NAME}.zip"

  echo -e "${YELLOW}${BOLD}📥 Mengunduh theme $THEME_NAME...${NC}"
  wget -q -O "/root/${THEME_NAME}.zip" "$THEME_URL"

  if [ ! -f "/root/${THEME_NAME}.zip" ]; then
    echo -e "${RED}${BOLD}❌ Gagal mengunduh theme.${NC}"
    return
  fi

  unzip -oq "/root/${THEME_NAME}.zip" -d /root/pterodactyl

  if [ "$THEME_NAME" == "enigma" ]; then
    echo -e "${YELLOW}${BOLD}🔗 Masukkan link WhatsApp (https://wa.me/...):${NC}"
    read LINK_WA
    echo -e "${YELLOW}${BOLD}👥 Masukkan link group:${NC}"
    read LINK_GROUP
    echo -e "${YELLOW}${BOLD}📢 Masukkan link channel:${NC}"
    read LINK_CHNL

    sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
  fi

  echo -e "${YELLOW}${BOLD}⚙️ Menginstall dependensi dan apply theme...${NC}"
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

  echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║${WHITE}              ✅ INSTALLASI THEME BERHASIL                     ${GREEN}║${NC}"
  echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  sleep 2
  clear
}

# Uninstall theme
uninstall_theme() {
  echo -e ""
  echo -e "${RED}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${RED}${BOLD}║${WHITE}                    🗑️  DELETE THEME                           ${RED}║${NC}"
  echo -e "${RED}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  bash <(curl https://raw.githubusercontent.com/Verlangid11/installer-theme/main/repair.sh)
  echo -e ""
  echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║${WHITE}                 ✅ DELETE THEME SUKSES                       ${GREEN}║${NC}"
  echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  sleep 2
  clear
}

install_themeSteeler() {
#!/bin/bash

echo -e ""
echo -e "${BLUE}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}${BOLD}║${WHITE}                  ⭐ INSTALLASI STELLAR THEME                  ${BLUE}║${NC}"
echo -e "${BLUE}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
echo -e ""

# Unduh file tema
wget -O /root/stellar.zip https://github.com/Verlangid11/Installermenuverlang/raw/main/stellar.zip

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

echo -e ""
echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}║${WHITE}                   ✅ INSTALL SUCCESS                          ${GREEN}║${NC}"
echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
echo -e ""
sleep 2
clear
exit 0

}

create_node() {
  echo -e ""
  echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}${BOLD}║${WHITE}                    🖥️  CREATE NODE                           ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  
  # Minta input dari pengguna
  read -p "🏢 Masukkan nama lokasi: " location_name
  read -p "📝 Masukkan deskripsi lokasi: " location_description
  read -p "🌐 Masukkan domain: " domain
  read -p "📊 Masukkan nama node: " node_name
  read -p "💾 Masukkan RAM (dalam MB): " ram
  read -p "💽 Masukkan jumlah maksimum disk space (dalam MB): " disk_space
  read -p "🔢 Masukkan Locid: " locid

  # Ubah ke direktori pterodactyl
  cd /var/www/pterodactyl || { echo "❌ Direktori tidak ditemukan"; exit 1; }

  # Membuat lokasi baru
  php artisan p:location:make <<EOF
$location_name
$location_description
EOF

  # Membuat node baru
  php artisan p:node:make <<EOF
$node_name
$location_description
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

  echo -e ""
  echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║${WHITE}        ✅ CREATE NODE & LOCATION SUKSES                      ${GREEN}║${NC}"
  echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  sleep 2
  clear
  exit 0
}

uninstall_panel() {
  echo -e ""
  echo -e "${RED}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${RED}${BOLD}║${WHITE}                    🗑️  UNINSTALL PANEL                       ${RED}║${NC}"
  echo -e "${RED}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""

  bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF

  echo -e ""
  echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║${WHITE}                 ✅ UNINSTALL PANEL SUKSES                   ${GREEN}║${NC}"
  echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  sleep 2
  clear
  exit 0
}

configure_wings() {
  echo -e ""
  echo -e "${BLUE}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${BLUE}${BOLD}║${WHITE}                    ⚙️  CONFIGURE WINGS                       ${BLUE}║${NC}"
  echo -e "${BLUE}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  
  # Minta input token dari pengguna
  read -p "🔑 Masukkan token Configure menjalankan wings: " wings

  eval "$wings"
  # Menjalankan perintah systemctl start wings
  sudo systemctl start wings

  echo -e ""
  echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║${WHITE}                 ✅ CONFIGURE WINGS SUKSES                   ${GREEN}║${NC}"
  echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  sleep 2
  clear
  exit 0
}

hackback_panel() {
  echo -e ""
  echo -e "${PURPLE}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${PURPLE}${BOLD}║${WHITE}                    🔐 HACK BACK PANEL                       ${PURPLE}║${NC}"
  echo -e "${PURPLE}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  
  # Minta input dari pengguna
  read -p "👤 Masukkan Username Panel: " user
  read -p "🔒 Password login: " psswdhb
  
  cd /var/www/pterodactyl || { echo "❌ Direktori tidak ditemukan"; exit 1; }

  # Membuat user baru
  php artisan p:user:make <<EOF
yes
hackback@gmail.com
$user
$user
$user
$psswdhb
EOF
  
  echo -e ""
  echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║${WHITE}                 ✅ AKUN TELAH DI ADD                        ${GREEN}║${NC}"
  echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  sleep 2
  exit 0
}

ubahpw_vps() {
  echo -e ""
  echo -e "${YELLOW}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${YELLOW}${BOLD}║${WHITE}                    🔑 UBAH PASSWORD VPS                     ${YELLOW}║${NC}"
  echo -e "${YELLOW}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  
  read -p "🔒 Masukkan Password Baru: " pw
  read -p "🔒 Masukkan Ulang Password Baru: " pw2

  passwd <<EOF
$pw
$pw2

EOF

  echo -e ""
  echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${GREEN}${BOLD}║${WHITE}                 ✅ GANTI PASSWORD VPS SUKSES                ${GREEN}║${NC}"
  echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  sleep 2
  exit 0
}

# Main script
display_welcome
install_jq
check_token

while true; do
  clear
  echo -e ""
  echo -e "${CYAN}${BOLD}        ╔══════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}${BOLD}        ║                                              ║${NC}"
  echo -e "${CYAN}${BOLD}        ║${WHITE}    ██╗   ██╗███████╗██████╗ ██╗      ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ║${WHITE}    ██║   ██║██╔════╝██╔══██╗██║      ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ║${YELLOW}    ██║   ██║█████╗  ██████╔╝██║      ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ║${YELLOW}    ╚██╗ ██╔╝██╔══╝  ██╔══██╗██║      ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ║${GREEN}     ╚████╔╝ ███████╗██║  ██║███████╗ ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ║${GREEN}      ╚═══╝  ╚══════╝╚═╝  ╚═╝╚══════╝ ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ║                                              ║${NC}"
  echo -e "${CYAN}${BOLD}        ║${WHITE}        Professional Auto Installer       ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ║${DIM}        • Telegram : @verlangdev           ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ║${DIM}        • Credit   : @verlangid            ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ║${DIM}        • Support by Verlangid             ${CYAN}║${NC}"
  echo -e "${CYAN}${BOLD}        ╚══════════════════════════════════════════════╝${NC}"
  echo -e ""
  echo -e "${WHITE}${BOLD}╔══════════════════════════════════════════════════════════════════╗${NC}"
  echo -e "${WHITE}${BOLD}║${CYAN}                      📋 MENU UTAMA                           ${WHITE}║${NC}"
  echo -e "${WHITE}${BOLD}╠══════════════════════════════════════════════════════════════════╣${NC}"
  echo -e "${WHITE}${BOLD}║${NC} ${CYAN}1.${NC} ${GREEN}🎨 Install Theme${NC}${WHITE}                                           ║${NC}"
  echo -e "${WHITE}${BOLD}║${NC} ${CYAN}2.${NC} ${RED}🗑️  Uninstall Theme${NC}${WHITE}                                        ║${NC}"
  echo -e "${WHITE}${BOLD}║${NC} ${CYAN}3.${NC} ${BLUE}⚙️  Configure Wings${NC}${WHITE}                                        ║${NC}"
  echo -e "${WHITE}${BOLD}║${NC} ${CYAN}4.${NC} ${PURPLE}🖥️  Create Node${NC}${WHITE}                                             ║${NC}"
  echo -e "${WHITE}${BOLD}║${NC} ${CYAN}5.${NC} ${YELLOW}🗑️  Uninstall Panel${NC}${WHITE}                                        ║${NC}"
  echo -e "${WHITE}${BOLD}║${NC} ${CYAN}6.${NC} ${GREEN}⭐ Stellar Theme${NC}${WHITE}                                            ║${NC}"
  echo -e "${WHITE}${BOLD}║${NC} ${CYAN}7.${NC} ${PURPLE}🔐 Hack Back Panel${NC}${WHITE}                                          ║${NC}"
  echo -e "${WHITE}${BOLD}║${NC} ${CYAN}8.${NC} ${YELLOW}🔑 Ubah Password VPS${NC}${WHITE}                                        ║${NC}"
  echo -e "${WHITE}${BOLD}║${NC} ${RED}x.${NC} ${DIM}❌ Exit${NC}${WHITE}                                                      ║${NC}"
  echo -e "${WHITE}${BOLD}╚══════════════════════════════════════════════════════════════════╝${NC}"
  echo -e ""
  echo -ne "${GREEN}${BOLD}➤ Masukkan pilihan (1-8/x): ${NC}"
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
      echo -e "${YELLOW}${BOLD}👋 Terima kasih telah menggunakan installerverlangid. Dukung verlangid dengan cara follow semua sosial medianya!${NC}"
      echo -e "${GREEN}${BOLD}🚀 Sampai jumpa lagi!${NC}"
      exit 0
      ;;
    *)
      echo -e "${RED}${BOLD}❌ Pilihan tidak valid, silahkan coba lagi.${NC}"
      sleep 1
      ;;
  esac
done