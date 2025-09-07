#!/bin/bash

# Warna untuk tampilan
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Fungsi untuk menampilkan header dengan ASCII art berwarna
print_header() {
    clear
    echo -e "${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}         🦅 PTERODACTYL AUTO INSTALLER BY VERLANGID 🦅      ${NC}"
    echo -e "${MAGENTA} __          ___ _                                    _ _       _    ${NC}"
    echo -e "${MAGENTA} \ \ /\ / / | | |___ _ __   __ _  ___ __ _(_)_ __ | |   ${NC}"
    echo -e "${MAGENTA}  \ V  V /| | | / __| '_ \ / _\` |/ __/ _\` | | '_ \| |   ${NC}"
    echo -e "${MAGENTA}   \_/\_/ |_|_|\___|_| |_|__,_| \_____,_|_|_| |_|   ${NC}"
    echo -e "${CYAN}                Created by verlangid - 2025                 ${NC}"
    echo -e "${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo
}

# Fungsi untuk animasi loading
loading_animation() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf "${YELLOW} [%c]  ${NC}" "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Display welcome message
display_welcome() {
    print_header
    echo -e "${YELLOW}Skrip ini dibuat untuk mempermudah penginstalan tema Pterodactyl.${NC}"
    echo -e "${RED}Dilarang Keras Share Bebas!${NC}"
    echo
    echo -e "${BLUE}KONTAK:${NC}"
    echo -e "${BLUE}YouTube: verlangid${NC}"
    echo -e "${BLUE}Telegram: @verlangid11${NC}"
    echo -e "${BLUE}Instagram: @verlang11${NC}"
    echo -e "${BLUE}TikTok: @verlangid${NC}"
    echo -e "${CYAN}© verlangid 2025${NC}"
    sleep 4
    clear
}

# Update and install jq
install_jq() {
    print_header
    echo -e "${YELLOW}🔍 Mengupdate sistem & menginstall jq...${NC}"
    (sudo apt update && sudo apt install -y jq) &
    loading_animation $!
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Install jq berhasil!${NC}"
    else
        echo -e "${RED}❌ Install jq gagal!${NC}"
        exit 1
    fi
    sleep 1
    clear
}

# Check user token
check_token() {
    print_header
    echo -e "${YELLOW}🔐 Masukkan akses token:${NC}"
    read -r USER_TOKEN

    if [ "$USER_TOKEN" = "verlangid" ]; then
        echo -e "${GREEN}✅ Akses berhasil!${NC}"
    else
        echo -e "${RED}❌ Token salah! Beli kode token di @verlangid11${NC}"
        echo -e "${BLUE}YouTube: verlangid${NC}"
        echo -e "${BLUE}Telegram: @verlangid11${NC}"
        echo -e "${BLUE}Instagram: @verlang11${NC}"
        echo -e "${BLUE}TikTok: @verlangid${NC}"
        echo -e "${YELLOW}Harga token: 25K (Free update untuk token baru)${NC}"
        echo -e "${CYAN}© verlangid${NC}"
        exit 1
    fi
    sleep 1
    clear
}

# Install theme
install_theme() {
    print_header
    echo -e "${YELLOW}🎨 Pilih tema yang ingin diinstall:${NC}"
    echo "1. Stellar"
    echo "2. Billing"
    echo "3. Enigma"
    echo "x. Kembali"
    read -p "${BLUE}Masukkan pilihan (1/2/3/x): ${NC}" SELECT_THEME

    case "$SELECT_THEME" in
        1) THEME_NAME="stellar" ;;
        2) THEME_NAME="billing" ;;
        3) THEME_NAME="enigma" ;;
        x) return ;;
        *)
            echo -e "${RED}❌ Pilihan tidak valid!${NC}"
            sleep 1
            install_theme
            return
            ;;
    esac

    THEME_URL="https://github.com/verlangid/Pterodactyl-Theme-Autoinstaller/raw/main/${THEME_NAME}.zip"
    echo -e "${YELLOW}📥 Mengunduh tema $THEME_NAME...${NC}"
    (wget -q -O "/root/${THEME_NAME}.zip" "$THEME_URL") &
    loading_animation $!

    if [ ! -f "/root/${THEME_NAME}.zip" ]; then
        echo -e "${RED}❌ Gagal mengunduh tema!${NC}"
        return
    fi

    echo -e "${YELLOW}📦 Mengekstrak tema...${NC}"
    (unzip -oq "/root/${THEME_NAME}.zip" -d /root/pterodactyl) &
    loading_animation $!

    if [ "$THEME_NAME" == "enigma" ]; then
        print_header
        echo -e "${YELLOW}🔗 Masukkan link WhatsApp (https://wa.me/...):${NC}"
        read LINK_WA
        echo -e "${YELLOW}🔗 Masukkan link group:${NC}"
        read LINK_GROUP
        echo -e "${YELLOW}🔗 Masukkan link channel:${NC}"
        read LINK_CHNL

        sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
        sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
        sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    fi

    echo -e "${YELLOW}🛠️ Menginstall dependensi dan menerapkan tema...${NC}"
    (sudo cp -rfT /root/pterodactyl /var/www/pterodactyl &&
     curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&
     sudo apt install -y nodejs &&
     sudo npm install -g yarn &&
     cd /var/www/pterodactyl &&
     yarn add react-feather &&
     php artisan migrate &&
     yarn build:production &&
     php artisan view:clear) &
    loading_animation $!

    rm -f "/root/${THEME_NAME}.zip"
    rm -rf /root/pterodactyl

    echo -e "${GREEN}✅ Instalasi tema $THEME_NAME berhasil!${NC}"
    sleep 2
    clear
}

# Install Stellar theme
install_themeSteeler() {
    print_header
    echo -e "${YELLOW}📥 Mengunduh tema Stellar...${NC}"
    (wget -O /root/stellar.zip https://github.com/verlangid/Pterodactyl-Theme-Autoinstaller/raw/main/stellar.zip) &
    loading_animation $!

    echo -e "${YELLOW}📦 Mengekstrak tema...${NC}"
    (unzip /root/stellar.zip -d /root/pterodactyl) &
    loading_animation $!

    echo -e "${YELLOW}🛠️ Menginstall tema Stellar...${NC}"
    (sudo cp -rfT /root/pterodactyl /var/www/pterodactyl &&
     curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&
     sudo apt install -y nodejs &&
     sudo npm i -g yarn &&
     cd /var/www/pterodactyl &&
     yarn add react-feather &&
     php artisan migrate &&
     yarn build:production &&
     php artisan view:clear) &
    loading_animation $!

    sudo rm /root/stellar.zip
    sudo rm -rf /root/pterodactyl

    echo -e "${GREEN}✅ Instalasi tema Stellar berhasil!${NC}"
    sleep 2
    clear
}

# Uninstall theme
uninstall_theme() {
    print_header
    echo -e "${YELLOW}🗑️ Menghapus tema...${NC}"
    (bash <(curl -s https://raw.githubusercontent.com/verlangid/installer-theme/main/repair.sh)) &
    loading_animation $!
    echo -e "${GREEN}✅ Penghapusan tema berhasil!${NC}"
    sleep 2
    clear
}

# Create node
create_node() {
    print_header
    echo -e "${YELLOW}📝 Masukkan informasi untuk node:${NC}"
    read -p "${BLUE}🖥️ Nama Node: ${NC}" node_name
    read -p "${BLUE}🔢 Lokasi ID: ${NC}" locid
    read -p "${BLUE}🌐 Domain Node (tanpa https://): ${NC}" domain
    read -p "${BLUE}💾 Total RAM (MB): ${NC}" ram
    read -p "${BLUE}💽 Total Disk (MB): ${NC}" disk_space
    read -p "${BLUE}🌐 IP Address untuk Allocation: ${NC}" ip_address
    read -p "${BLUE}🔢 Port (contoh: 25565): ${NC}" port
    read -p "${BLUE}📛 IP Alias (boleh kosong): ${NC}" ip_alias

    # Validasi input
    if [[ -z "$node_name" || -z "$locid" || -z "$domain" || -z "$ram" || -z "$disk_space" || -z "$ip_address" || -z "$port" ]]; then
        echo -e "${RED}❌ Semua input wajib harus diisi (IP Alias boleh kosong)!${NC}"
        sleep 2
        return
    fi

    echo -e "${YELLOW}📂 Memasuki direktori Pterodactyl...${NC}"
    cd /var/www/pterodactyl || { echo -e "${RED}❌ Direktori tidak ditemukan!${NC}"; exit 1; }
    echo -e "${GREEN}✅ Berhasil masuk ke direktori!${NC}"

    echo -e "${YELLOW}🖥️ Membuat node baru: $node_name...${NC}"
    (php artisan p:node:make <<EOF
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
) &
    loading_animation $!

    echo -e "${YELLOW}🌐 Membuat alokasi untuk node: $node_name...${NC}"
    (php artisan p:allocation:make <<EOF
$node_name
$ip_address
$port
$ip_alias
EOF
) &
    loading_animation $!

    echo -e "${GREEN}✅ Pembuatan node dan alokasi berhasil!${NC}"
    sleep 2
    clear
}

# Uninstall panel
uninstall_panel() {
    print_header
    echo -e "${YELLOW}🗑️ Menguninstall panel Pterodactyl...${NC}"
    (bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF
) &
    loading_animation $!
    echo -e "${GREEN}✅ Uninstall panel berhasil!${NC}"
    sleep 2
    clear
}

# Configure wings
configure_wings() {
    print_header
    echo -e "${YELLOW}🔧 Masukkan token untuk konfigurasi wings:${NC}"
    read -p "${BLUE}Token: ${NC}" wings
    echo -e "${YELLOW}🚀 Mengkonfigurasi wings...${NC}"
    (eval "$wings" && sudo systemctl start wings) &
    loading_animation $!
    echo -e "${GREEN}✅ Konfigurasi wings berhasil!${NC}"
    sleep 2
    clear
}

# Hack back panel
hackback_panel() {
    print_header
    echo -e "${YELLOW}🔐 Menambahkan akun admin baru...${NC}"
    read -p "${BLUE}Masukkan Username Panel: ${NC}" user
    read -p "${BLUE}Masukkan Password: ${NC}" psswdhb

    cd /var/www/pterodactyl || { echo -e "${RED}❌ Direktori tidak ditemukan!${NC}"; exit 1; }
    echo -e "${YELLOW}👤 Membuat akun baru...${NC}"
    (php artisan p:user:make <<EOF
yes
hackback@gmail.com
$user
$user
$user
$psswdhb
EOF
) &
    loading_animation $!
    echo -e "${GREEN}✅ Akun berhasil ditambahkan!${NC}"
    sleep 2
    clear
}

# Ubah password VPS
ubahpw_vps() {
    print_header
    echo -e "${YELLOW}🔑 Mengubah password VPS...${NC}"
    read -p "${BLUE}Masukkan Password Baru: ${NC}" pw
    read -p "${BLUE}Masukkan Ulang Password Baru: ${NC}" pw_confirm

    if [ "$pw" != "$pw_confirm" ]; then
        echo -e "${RED}❌ Password tidak cocok!${NC}"
        sleep 2
        return
    fi

    (passwd <<EOF
$pw
$pw
EOF
) &
    loading_animation $!
    echo -e "${GREEN}✅ Password VPS berhasil diubah!${NC}"
    sleep 2
    clear
}

# Main menu
display_welcome
install_jq
check_token

while true; do
    print_header
    echo -e "${MAGENTA} __          ___ _                                    _ _       _    ${NC}"
    echo -e "${MAGENTA} \ \ /\ / / | | |___ _ __   __ _  ___ __ _(_)_ __ | |   ${NC}"
    echo -e "${MAGENTA}  \ V  V /| | | / __| '_ \ / _\` |/ __/ _\` | | '_ \| |   ${NC}"
    echo -e "${MAGENTA}   \_/\_/ |_|_|\___|_| |_|__,_| \_____,_|_|_| |_|   ${NC}"
    echo -e "${CYAN}                Powered by verlangid - 2025                 ${NC}"
    echo -e "${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo
    echo -e "${YELLOW}Pilih opsi instalasi:${NC}"
    echo "1. Install Theme"
    echo "2. Uninstall Theme"
    echo "3. Configure Wings"
    echo "4. Create Node"
    echo "5. Uninstall Panel"
    echo "6. Stellar Theme"
    echo "7. Hack Back Panel"
    echo "8. Ubah Password VPS"
    echo "x. Keluar"
    read -p "${BLUE}Masukkan pilihan (1/2/3/4/5/6/7/8/x): ${NC}" MENU_CHOICE
    clear

    case "$MENU_CHOICE" in
        1) install_theme ;;
        2) uninstall_theme ;;
        3) configure_wings ;;
        4) create_node ;;
        5) uninstall_panel ;;
        6) install_themeSteeler ;;
        7) hackback_panel ;;
        8) ubahpw_vps ;;
        x)
            print_header
            echo -e "${GREEN}👋 Keluar dari skrip. Terima kasih!${NC}"
            echo -e "${CYAN}© verlangid 2025${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}❌ Pilihan tidak valid, silakan coba lagi.${NC}"
            sleep 2
            ;;
    esac
done