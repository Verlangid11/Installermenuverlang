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
DIM='\033[2m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
REVERSE='\033[7m'
STRIKETHROUGH='\033[9m'

# Background Colors
BG_BLACK='\033[40m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'
BG_PURPLE='\033[45m'
BG_CYAN='\033[46m'
BG_WHITE='\033[47m'

# Reset
NC='\033[0m'

# Animated loading function
show_loading() {
    local message="$1"
    local duration=${2:-3}
    local spinner='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    
    echo -ne "${CYAN}${BOLD}$message ${NC}"
    for ((i=0; i<duration*10; i++)); do
        printf "\r${CYAN}${BOLD}$message ${YELLOW}${spinner:i%10:1}${NC}"
        sleep 0.1
    done
    echo -e "\r${GREEN}${BOLD}$message ✓${NC}"
}

# Enhanced banner
print_banner() {
    clear
    echo -e "${LIGHT_PURPLE}${BOLD}"
    echo "  ██╗   ██╗███████╗██████╗ ██╗      █████╗ ███╗   ██╗ ██████╗ ██╗██████╗ "
    echo "  ██║   ██║██╔════╝██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝ ██║██╔══██╗"
    echo "  ██║   ██║█████╗  ██████╔╝██║     ███████║██╔██╗ ██║██║  ███╗██║██║  ██║"
    echo "  ╚██╗ ██╔╝██╔══╝  ██╔══██╗██║     ██╔══██║██║╚██╗██║██║   ██║██║██║  ██║"
    echo "   ╚████╔╝ ███████╗██║  ██║███████╗██║  ██║██║ ╚████║╚██████╔╝██║██████╔╝"
    echo "    ╚═══╝  ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═════╝ "
    echo -e "${NC}"
}

# Enhanced welcome message
display_welcome() {
    print_banner
    echo -e "${CYAN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║                                                                               ║${NC}"
    echo -e "${CYAN}${BOLD}║                    ${LIGHT_YELLOW}${BOLD}⭐ AUTO INSTALLER THEMA PTERODACTYL ⭐${NC}${CYAN}${BOLD}                    ║${NC}"
    echo -e "${CYAN}${BOLD}║                          ${LIGHT_PURPLE}${BOLD}© VERLANGID COMMUNITY${NC}${CYAN}${BOLD}                           ║${NC}"
    echo -e "${CYAN}${BOLD}║                                                                               ║${NC}"
    echo -e "${RED}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    echo -e "${YELLOW}${BOLD}${BG_BLUE}                              🎯 INFORMASI SCRIPT 🎯                            ${NC}"
    echo -e ""
    echo -e "${WHITE}${BOLD}Script ini dibuat untuk mempermudah instalasi tema Pterodactyl Panel${NC}"
    echo -e "${RED}${BOLD}⚠️  DILARANG KERAS SHARE BEBAS - SCRIPT BERBAYAR ⚠️${NC}"
    echo -e ""
    echo -e "${GREEN}${BOLD}${BG_BLACK}                             📱 MEDIA SOSIAL 📱                               ${NC}"
    echo -e ""
    echo -e "${PURPLE}${BOLD}🟥 YOUTUBE   : ${YELLOW}@verlangid${NC}"
    echo -e "${PURPLE}${BOLD}🟪 INSTAGRAM : ${YELLOW}@verlang11${NC}"
    echo -e "${PURPLE}${BOLD}⬛ TIKTOK    : ${YELLOW}@verlangid${NC}"
    echo -e "${PURPLE}${BOLD}🟦 TELEGRAM  : ${YELLOW}@verlangid11${NC}"
    echo -e ""
    echo -e "${MAGENTA}${BOLD}💎 CREDITS: Verlangid Community${NC}"
    echo -e ""
    show_loading "Memuat script" 4
    clear
}

#Update and install jq
install_jq() {
    print_banner
    echo -e "${CYAN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║                       ${LIGHT_YELLOW}🔧 UPDATE SYSTEM & INSTALL JQ 🔧${NC}${CYAN}${BOLD}                       ║${NC}"
    echo -e "${CYAN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    
    show_loading "Memperbarui repository sistem" 2
    sudo apt update >/dev/null 2>&1
    
    show_loading "Menginstall jq package" 2
    sudo apt install -y jq >/dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo -e ""
        echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${GREEN}${BOLD}║                         ${WHITE}✅ INSTALL JQ BERHASIL ✅${NC}${GREEN}${BOLD}                           ║${NC}"
        echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    else
        echo -e ""
        echo -e "${RED}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${RED}${BOLD}║                          ${WHITE}❌ INSTALL JQ GAGAL ❌${NC}${RED}${BOLD}                            ║${NC}"
        echo -e "${RED}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
        exit 1
    fi
    sleep 2
    clear
}

#Check user token
check_token() {
    print_banner
    echo -e "${PURPLE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}${BOLD}║                        ${LIGHT_CYAN}🔐 LICENSY VERLANGID CODE 🔐${NC}${PURPLE}${BOLD}                        ║${NC}"
    echo -e "${PURPLE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    echo -e "${YELLOW}${BOLD}🔑 MASUKAN AKSES TOKEN: ${NC}"
    echo -ne "${CYAN}${BOLD}➤ ${NC}"
    read -r USER_TOKEN

    if [ "$USER_TOKEN" = "verlangid" ]; then
        echo -e "${GREEN}${BOLD}🎉 AKSES BERHASIL! SELAMAT DATANG DI VERLANGID INSTALLER 🎉${NC}"
        show_loading "Verifikasi token" 2
    else
        echo -e ""
        echo -e "${RED}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${RED}${BOLD}║                           ${WHITE}❌ TOKEN SALAH! ❌${NC}${RED}${BOLD}                              ║${NC}"
        echo -e "${RED}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
        echo -e ""
        echo -e "${YELLOW}${BOLD}❕FOLLOW SEKARANG${NC}"
        echo -e ""
        echo -e "${PURPLE}${BOLD}📱 KONTAK PEMBELIAN:${NC}"
        echo -e "${PURPLE}${BOLD}🟦 TELEGRAM  : ${YELLOW}@verlangid11${NC}"
        echo -e "${PURPLE}${BOLD}💬 WHATSAPP  : ${YELLOW}+6287821239407${NC}"
        echo -e ""
        echo -e "${GREEN}${BOLD}🌐 TOKEN IS PRIVATE${NC}"
        echo -e "${MAGENTA}${BOLD}© Verlangid Community${NC}"
        exit 1
    fi
    clear
}

# Enhanced install theme function
install_theme() {
    clear
    print_banner
    echo -e "${LIGHT_BLUE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${LIGHT_BLUE}${BOLD}║                     ${WHITE}🎨 INSTALL PTERODACTYL THEME 🎨${NC}${LIGHT_BLUE}${BOLD}                     ║${NC}"
    echo -e "${LIGHT_BLUE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""

    echo -e "${YELLOW}${BOLD}🎭 PILIH THEME YANG INGIN DIINSTALL:${NC}"
    echo -e "${CYAN}${BOLD}┌─────────────────────────────────────┐${NC}"
    echo -e "${CYAN}${BOLD}│  ${LIGHT_GREEN}1.${NC} ${WHITE}⭐ Stellar Theme             ${CYAN}${BOLD}│${NC}"
    echo -e "${CYAN}${BOLD}│  ${LIGHT_GREEN}2.${NC} ${WHITE}💳 Billing Theme             ${CYAN}${BOLD}│${NC}"
    echo -e "${CYAN}${BOLD}│  ${LIGHT_GREEN}3.${NC} ${WHITE}🔮 Enigma Theme              ${CYAN}${BOLD}│${NC}"
    echo -e "${CYAN}${BOLD}│  ${RED}x.${NC} ${WHITE}🚪 Kembali ke Menu Utama      ${CYAN}${BOLD}│${NC}"
    echo -e "${CYAN}${BOLD}└─────────────────────────────────────┘${NC}"
    echo -ne "${GREEN}${BOLD}➤ Masukkan pilihan (1/2/3/x): ${NC}"
    read -r SELECT_THEME

    case "$SELECT_THEME" in
        1)
            THEME_NAME="stellar"
            THEME_DISPLAY="⭐ Stellar"
            ;;
        2)
            THEME_NAME="billing"
            THEME_DISPLAY="💳 Billing"
            ;;
        3)
            THEME_NAME="enigma"
            THEME_DISPLAY="🔮 Enigma"
            ;;
        x)
            return
            ;;
        *)
            echo -e "${RED}${BOLD}❌ Pilihan tidak valid.${NC}"
            sleep 2
            install_theme
            return
            ;;
    esac

    THEME_URL="https://github.com/VerlangId/Installermenuverlang/raw/main/${THEME_NAME}.zip"

    echo -e "${YELLOW}${BOLD}📥 Mengunduh theme $THEME_DISPLAY...${NC}"
    show_loading "Download theme $THEME_DISPLAY" 3
    wget -q -O "/root/${THEME_NAME}.zip" "$THEME_URL"

    if [ ! -f "/root/${THEME_NAME}.zip" ]; then
        echo -e "${RED}${BOLD}❌ Gagal mengunduh theme.${NC}"
        return
    fi

    show_loading "Ekstrak file theme" 2
    unzip -oq "/root/${THEME_NAME}.zip" -d /root/pterodactyl

    if [ "$THEME_NAME" == "enigma" ]; then
        echo -e "${CYAN}${BOLD}🔗 KONFIGURASI LINK ENIGMA THEME:${NC}"
        echo -e "${YELLOW}${BOLD}📱 Masukkan link WhatsApp (https://wa.me/...):${NC}"
        echo -ne "${CYAN}${BOLD}➤ ${NC}"
        read LINK_WA
        echo -e "${YELLOW}${BOLD}👥 Masukkan link group:${NC}"
        echo -ne "${CYAN}${BOLD}➤ ${NC}"
        read LINK_GROUP
        echo -e "${YELLOW}${BOLD}📺 Masukkan link channel:${NC}"
        echo -ne "${CYAN}${BOLD}➤ ${NC}"
        read LINK_CHNL

        sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
        sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
        sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    fi

    echo -e "${YELLOW}${BOLD}⚡ Menginstall dependensi dan apply theme...${NC}"
    show_loading "Copy file theme" 2
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl

    show_loading "Setup Node.js environment" 3
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - >/dev/null 2>&1
    sudo apt install -y nodejs >/dev/null 2>&1
    sudo npm install -g yarn >/dev/null 2>&1

    cd /var/www/pterodactyl || { echo -e "${RED}${BOLD}❌ Direktori tidak ditemukan!${NC}"; return; }

    show_loading "Install dependencies" 3
    yarn add react-feather >/dev/null 2>&1
    php artisan migrate >/dev/null 2>&1
    
    show_loading "Build production theme" 5
    yarn build:production >/dev/null 2>&1
    php artisan view:clear >/dev/null 2>&1

    show_loading "Cleanup temporary files" 2
    rm -f "/root/${THEME_NAME}.zip"
    rm -rf /root/pterodactyl

    echo -e ""
    echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║                       ${WHITE}🎉 INSTALLASI THEME BERHASIL! 🎉${NC}${GREEN}${BOLD}                       ║${NC}"
    echo -e "${GREEN}${BOLD}║                         ${YELLOW}Theme: $THEME_DISPLAY${NC}${GREEN}${BOLD}                              ║${NC}"
    echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    sleep 3
    clear
}

# Enhanced uninstall theme function
uninstall_theme() {
    print_banner
    echo -e "${RED}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}║                         ${WHITE}🗑️  DELETE THEME PANEL 🗑️${NC}${RED}${BOLD}                          ║${NC}"
    echo -e "${RED}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    
    show_loading "Menjalankan script repair theme" 3
    bash <(curl -s https://raw.githubusercontent.com/Verlangid11/installer-theme/main/repair.sh)
    
    echo -e ""
    echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║                        ${WHITE}✅ DELETE THEME BERHASIL ✅${NC}${GREEN}${BOLD}                         ║${NC}"
    echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    sleep 3
    clear
}

# Enhanced Stellar theme installer
install_themeSteeler() {
    print_banner
    echo -e "${LIGHT_PURPLE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${LIGHT_PURPLE}${BOLD}║                       ${WHITE}⭐ INSTALLASI STELLAR THEME ⭐${NC}${LIGHT_PURPLE}${BOLD}                       ║${NC}"
    echo -e "${LIGHT_PURPLE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""

    show_loading "Download Stellar theme" 3
    wget -O /root/stellar.zip https://github.com/VerlangId/Installermenuverlang/raw/main/stellar.zip >/dev/null 2>&1

    show_loading "Extract theme files" 2
    unzip /root/stellar.zip -d /root/pterodactyl >/dev/null 2>&1

    show_loading "Copy theme to Pterodactyl directory" 2
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl

    show_loading "Setup Node.js and Yarn" 3
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - >/dev/null 2>&1
    sudo apt install -y nodejs >/dev/null 2>&1
    sudo npm i -g yarn >/dev/null 2>&1

    cd /var/www/pterodactyl
    show_loading "Install theme dependencies" 3
    yarn add react-feather >/dev/null 2>&1
    php artisan migrate >/dev/null 2>&1
    
    show_loading "Build production assets" 5
    yarn build:production >/dev/null 2>&1
    php artisan view:clear >/dev/null 2>&1

    show_loading "Clean up temporary files" 2
    sudo rm /root/stellar.zip
    sudo rm -rf /root/pterodactyl

    echo -e ""
    echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║                        ${WHITE}🎉 STELLAR THEME INSTALLED! 🎉${NC}${GREEN}${BOLD}                        ║${NC}"
    echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    sleep 3
    clear
    exit 0
}

# Enhanced create node function
create_node() {
    print_banner
    echo -e "${CYAN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║                          ${WHITE}🖥️  CREATE NEW NODE 🖥️${NC}${CYAN}${BOLD}                           ║${NC}"
    echo -e "${CYAN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    
    echo -e "${YELLOW}${BOLD}📝 MASUKKAN INFORMASI NODE:${NC}"
    echo -ne "${CYAN}${BOLD}🏷️  Nama node: ${NC}"
    read -p "" node_name
    echo -ne "${CYAN}${BOLD}📍 Lokasi ID: ${NC}"
    read -p "" locid
    echo -ne "${CYAN}${BOLD}🌐 Domain node (tanpa https://): ${NC}"
    read -p "" domain
    echo -ne "${CYAN}${BOLD}💾 Total RAM (MB): ${NC}"
    read -p "" ram
    echo -ne "${CYAN}${BOLD}💿 Total Disk (MB): ${NC}"
    read -p "" disk_space

    show_loading "Membuat node baru" 3
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

    echo -e "${GREEN}${BOLD}✅ Node berhasil dibuat.${NC}"
    echo -e ""
    echo -e "${YELLOW}${BOLD}🔧 SETUP ALLOCATION:${NC}"
    echo -ne "${CYAN}${BOLD}🌐 IP address untuk allocation: ${NC}"
    read -p "" ip_address
    echo -ne "${CYAN}${BOLD}🔌 Port (contoh: 25565): ${NC}"
    read -p "" port
    echo -ne "${CYAN}${BOLD}🏷️  IP alias (boleh kosong): ${NC}"
    read -p "" ip_alias

    show_loading "Menambahkan allocation" 2
    php artisan p:allocation:make <<EOF
$node_name
$ip_address
$port
$ip_alias
EOF

    echo -e "${GREEN}${BOLD}🎉 Allocation berhasil ditambahkan ke node $node_name.${NC}"
    sleep 3
}

# Enhanced uninstall panel function
uninstall_panel() {
    print_banner
    echo -e "${RED}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}║                        ${WHITE}🗑️  UNINSTALL PANEL 🗑️${NC}${RED}${BOLD}                         ║${NC}"
    echo -e "${RED}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    
    echo -e "${YELLOW}${BOLD}⚠️  PERINGATAN: Ini akan menghapus seluruh panel Pterodactyl!${NC}"
    echo -ne "${RED}${BOLD}❓ Apakah Anda yakin? (y/n): ${NC}"
    read -r confirm
    
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        show_loading "Menjalankan uninstaller" 3
        bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF

        echo -e ""
        echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${GREEN}${BOLD}║                       ${WHITE}✅ UNINSTALL PANEL BERHASIL ✅${NC}${GREEN}${BOLD}                       ║${NC}"
        echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    else
        echo -e "${YELLOW}${BOLD}🔄 Operasi dibatalkan.${NC}"
    fi
    sleep 3
    clear
    exit 0
}

# Enhanced configure wings function
configure_wings() {
    print_banner
    echo -e "${LIGHT_BLUE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${LIGHT_BLUE}${BOLD}║                        ${WHITE}🛠️  CONFIGURE WINGS 🛠️${NC}${LIGHT_BLUE}${BOLD}                         ║${NC}"
    echo -e "${LIGHT_BLUE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    
    echo -e "${YELLOW}${BOLD}🔑 Masukkan token configure untuk menjalankan wings:${NC}"
    echo -ne "${CYAN}${BOLD}➤ ${NC}"
    read -p "" wings

    show_loading "Menjalankan konfigurasi wings" 3
    eval "$wings"
    
    show_loading "Starting wings service" 2
    sudo systemctl start wings

    echo -e ""
    echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║                      ${WHITE}✅ CONFIGURE WINGS BERHASIL ✅${NC}${GREEN}${BOLD}                       ║${NC}"
    echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    sleep 3
    clear
    exit 0
}

# Enhanced hackback panel function
hackback_panel() {
    print_banner
    echo -e "${MAGENTA}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}${BOLD}║                        ${WHITE}🔓 HACK BACK PANEL 🔓${NC}${MAGENTA}${BOLD}                         ║${NC}"
    echo -e "${MAGENTA}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    
    echo -e "${YELLOW}${BOLD}👤 BUAT AKUN ADMIN BARU:${NC}"
    echo -ne "${CYAN}${BOLD}🏷️  Username Panel: ${NC}"
    read -p "" user
    echo -ne "${CYAN}${BOLD}🔑 Password login: ${NC}"
    read -s psswdhb
    echo ""

    cd /var/www/pterodactyl || { echo -e "${RED}${BOLD}❌ Direktori tidak ditemukan${NC}"; exit 1; }

    show_loading "Membuat akun admin baru" 3
    php artisan p:user:make <<EOF
yes
hackback@gmail.com
$user
$user
$user
$psswdhb
EOF

    echo -e ""
    echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║                        ${WHITE}✅ AKUN ADMIN BERHASIL DIBUAT ✅${NC}${GREEN}${BOLD}                        ║${NC}"
    echo -e "${GREEN}${BOLD}║                          ${YELLOW}Username: $user${NC}${GREEN}${BOLD}                                ║${NC}"
    echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    sleep 3
    exit 0
}

# Enhanced VPS password change function
ubahpw_vps() {
    print_banner
    echo -e "${ORANGE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${ORANGE}${BOLD}║                        ${WHITE}🔐 UBAH PASSWORD VPS 🔐${NC}${ORANGE}${BOLD}                         ║${NC}"
    echo -e "${ORANGE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    
    echo -e "${YELLOW}${BOLD}🔒 GANTI PASSWORD ROOT VPS:${NC}"
    echo -ne "${CYAN}${BOLD}🔑 Password baru: ${NC}"
    read -s pw
    echo ""
    echo -ne "${CYAN}${BOLD}🔑 Konfirmasi password: ${NC}"
    read -s pw_confirm
    echo ""
    
    if [ "$pw" != "$pw_confirm" ]; then
        echo -e "${RED}${BOLD}❌ Password tidak cocok!${NC}"
        sleep 2
        return
    fi

    show_loading "Mengubah password VPS" 2
    passwd <<EOF
$pw
$pw
EOF

    echo -e ""
    echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║                      ${WHITE}✅ PASSWORD VPS BERHASIL DIUBAH ✅${NC}${GREEN}${BOLD}                      ║${NC}"
    echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    sleep 3
    exit 0
}

# Enhanced main menu
show_main_menu() {
    print_banner
    echo -e "${CYAN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║                           ${WHITE}🎮 MENU UTAMA VERLANGID 🎮${NC}${CYAN}${BOLD}                           ║${NC}"
    echo -e "${CYAN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    
    echo -e "${LIGHT_PURPLE}${BOLD}        _,gggggggggg.                     🚀 VERLANGID COMMUNITY 🚀${NC}"
    echo -e "${LIGHT_PURPLE}${BOLD}    ,ggggggggggggggggg.                                           ${NC}"
    echo -e "${LIGHT_PURPLE}${BOLD}  ,ggggg        gggggggg.                 Auto Installer Premium${NC}"
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
    echo -e ""
    
    echo -e "${YELLOW}${BOLD}${BG_BLUE}                            📋 DAFTAR MENU TERSEDIA 📋                          ${NC}"
    echo -e ""
    
    echo -e "${WHITE}${BOLD}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}${BOLD}║  ${LIGHT_GREEN}${BOLD}1.${NC} ${CYAN}🎨 Install Theme Pterodactyl${NC}${WHITE}${BOLD}                         ║${NC}"
    echo -e "${WHITE}${BOLD}║  ${LIGHT_GREEN}${BOLD}2.${NC} ${RED}🗑️  Uninstall Theme${NC}${WHITE}${BOLD}                                  ║${NC}"
    echo -e "${WHITE}${BOLD}║  ${LIGHT_GREEN}${BOLD}3.${NC} ${LIGHT_BLUE}🛠️  Configure Wings${NC}${WHITE}${BOLD}                                 ║${NC}"
    echo -e "${WHITE}${BOLD}║  ${LIGHT_GREEN}${BOLD}4.${NC} ${CYAN}🖥️  Create New Node${NC}${WHITE}${BOLD}                                  ║${NC}"
    echo -e "${WHITE}${BOLD}║  ${LIGHT_GREEN}${BOLD}5.${NC} ${RED}🗑️  Uninstall Panel${NC}${WHITE}${BOLD}                                  ║${NC}"
    echo -e "${WHITE}${BOLD}║  ${LIGHT_GREEN}${BOLD}6.${NC} ${LIGHT_PURPLE}⭐ Install Stellar Theme${NC}${WHITE}${BOLD}                        ║${NC}"
    echo -e "${WHITE}${BOLD}║  ${LIGHT_GREEN}${BOLD}7.${NC} ${MAGENTA}🔓 Hack Back Panel${NC}${WHITE}${BOLD}                                 ║${NC}"
    echo -e "${WHITE}${BOLD}║  ${LIGHT_GREEN}${BOLD}8.${NC} ${ORANGE}🔐 Ubah Password VPS${NC}${WHITE}${BOLD}                               ║${NC}"
    echo -e "${WHITE}${BOLD}║  ${RED}${BOLD}x.${NC} ${WHITE}🚪 Keluar dari Script${NC}${WHITE}${BOLD}                              ║${NC}"
    echo -e "${WHITE}${BOLD}╚════════════════════════════════════════════════════════════════╝${NC}"
    echo -e ""
    
    echo -ne "${GREEN}${BOLD}➤ Masukkan pilihan Anda (1-8/x): ${NC}"
}

# Main script execution
main() {
    display_welcome
    install_jq
    check_token

    while true; do
        show_main_menu
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
            x|X)
                echo -e ""
                print_banner
                echo -e "${YELLOW}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
                echo -e "${YELLOW}${BOLD}║                        ${WHITE}👋 TERIMA KASIH TELAH MENGGUNAKAN! 👋${NC}${YELLOW}${BOLD}                        ║${NC}"
                echo -e "${YELLOW}${BOLD}║                           ${LIGHT_PURPLE}© Verlangid Community${NC}${YELLOW}${BOLD}                            ║${NC}"
                echo -e "${YELLOW}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
                echo -e ""
                echo -e "${PURPLE}${BOLD}📱 TETAP TERHUBUNG DENGAN KAMI:${NC}"
                echo -e "${PURPLE}${BOLD}🟥 YOUTUBE   : ${YELLOW}@verlangid${NC}"
                echo -e "${PURPLE}${BOLD}🟪 INSTAGRAM : ${YELLOW}@verlang11${NC}"
                echo -e "${PURPLE}${BOLD}⬛ TIKTOK    : ${YELLOW}@verlangid${NC}"
                echo -e "${PURPLE}${BOLD}🟦 TELEGRAM  : ${YELLOW}@verlangid11${NC}"
                echo -e ""
                echo -e "${GREEN}${BOLD}💎 Jangan lupa follow untuk update terbaru!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}${BOLD}❌ Pilihan tidak valid! Silakan pilih 1-8 atau x untuk keluar.${NC}"
                echo -e "${YELLOW}${BOLD}⏳ Kembali ke menu dalam 3 detik...${NC}"
                sleep 3
                ;;
        esac
    done
}
