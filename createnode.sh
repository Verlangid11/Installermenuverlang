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
    echo -e "${CYAN}        🦅 PTERODACTYL LOCATION & NODE SETUP SCRIPT 🦅      ${NC}"
    echo -e "${MAGENTA} __          ___ _                                    _ _       _    ${NC}"
    echo -e "${MAGENTA} \ \ /\ / / | | |___ _ __   __ _  ___ __ _(_)_ __ | |   ${NC}"
    echo -e "${MAGENTA}  \ V  V /| | | / __| '_ \ / _\` |/ __/ _\` | | '_ \| |   ${NC}"
    echo -e "${MAGENTA}   \_/\_/ |_|_|\___|_| |_|__,_| \_____,_|_| |_|_|   ${NC}"
    echo -e "${CYAN}                Created by verlangid - 2025                 ${NC}"
    echo -e "${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo
}

# Fungsi untuk animasi loading dengan warna
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

# Pemeriksaan dependensi
check_dependencies() {
    print_header
    echo -e "${YELLOW}🔍 Memeriksa dependensi...${NC}"
    if ! command -v php &> /dev/null; then
        echo -e "${RED}❌ PHP tidak ditemukan! Silakan instal terlebih dahulu.${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ Dependensi terpenuhi!${NC}"
    sleep 1
}

# Fungsi untuk meminta input pengguna dengan warna
get_user_input() {
    print_header
    echo -e "${YELLOW}📝 Masukkan informasi untuk lokasi dan node:${NC}"
    read -p "${BLUE}📍 Nama Lokasi: ${NC}" location_name
    read -p "${BLUE}📜 Deskripsi Lokasi: ${NC}" location_description
    read -p "${BLUE}🌐 Domain (contoh: panel.example.com): ${NC}" domain
    read -p "${BLUE}🖥️ Nama Node: ${NC}" node_name
    read -p "${BLUE}💾 RAM (dalam MB): ${NC}" ram
    read -p "${BLUE}💽 Disk Space Maksimum (dalam MB): ${NC}" disk_space
    read -p "${BLUE}🔢 LocID: ${NC}" locid

    # Validasi input
    if [[ -z "$location_name" || -z "$location_description" || -z "$domain" || -z "$node_name" || -z "$ram" || -z "$disk_space" || -z "$locid" ]]; then
        echo -e "${RED}❌ Semua input harus diisi!${NC}"
        exit 1
    fi
}

# Fungsi untuk masuk ke direktori panel
navigate_to_panel() {
    print_header
    echo -e "${YELLOW}📂 Memasuki direktori Pterodactyl...${NC}"
    cd /var/www/pterodactyl || { 
        echo -e "${RED}❌ Direktori Pterodactyl tidak ditemukan!${NC}"
        exit 1
    }
    echo -e "${GREEN}✅ Berhasil masuk ke direktori!${NC}"
    sleep 1
}

# Fungsi untuk membuat lokasi
create_location() {
    print_header
    echo -e "${YELLOW}📍 Membuat lokasi baru: $location_name...${NC}"
    (php artisan p:location:make <<EOF
$location_name
$location_description
EOF
) & 
    loading_animation $!
    echo -e "${GREEN}✅ Lokasi berhasil dibuat!${NC}"
    sleep 1
}

# Fungsi untuk membuat node
create_node() {
    print_header
    echo -e "${YELLOW}🖥️ Membuat node baru: $node_name...${NC}"
    (php artisan p:node:make <<EOF
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
) & 
    loading_animation $!
    echo -e "${GREEN}✅ Node berhasil dibuat!${NC}"
    sleep 1
}

# Main execution
check_dependencies
get_user_input
navigate_to_panel
create_location
create_node

print_header
echo -e "${GREEN}🎉 Proses pembuatan lokasi dan node selesai!${NC}"
echo -e "${MAGENTA} __          ___ _                                    _ _       _    ${NC}"
echo -e "${MAGENTA} \ \ /\ / / | | |___ _ __   __ _  ___ __ _(_)_ __ | |   ${NC}"
echo -e "${MAGENTA}  \ V  V /| | | / __| '_ \ / _\` |/ __/ _\` | | '_ \| |   ${NC}"
echo -e "${MAGENTA}   \_/\_/ |_|_|\___|_| |_|__,_| \_____,_|_|_| |_|   ${NC}"
echo -e "${CYAN}                Powered by verlangid - 2025                 ${NC}"
echo -e "${CYAN}════════════════════════════════════════════════════════════${NC}"