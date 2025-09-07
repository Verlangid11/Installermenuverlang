#!/bin/bash

# Warna untuk tampilan
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fungsi untuk menampilkan header
print_header() {
    clear
    echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}          🦅 PTERODACTYL ALLOCATION SETUP SCRIPT 🦅          ${NC}"
    echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
    echo
}

# Fungsi untuk animasi loading
loading_animation() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
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
    for cmd in curl jq php; do
        if ! command -v $cmd &> /dev/null; then
            echo -e "${RED}❌ $cmd tidak ditemukan! Silakan instal terlebih dahulu.${NC}"
            exit 1
        fi
    done
    echo -e "${GREEN}✅ Semua dependensi terpenuhi!${NC}"
    sleep 1
}

# Fungsi untuk meminta input pengguna
get_user_input() {
    print_header
    echo -e "${YELLOW}📝 Masukkan informasi yang diperlukan:${NC}"
    read -p "🔗 URL Panel Pterodactyl (contoh: https://panel.example.com): " PANEL_URL
    read -p "🆔 ID Node: " NODE_ID
    read -p "🌐 IP Address: " IP
    read -p "🔢 Port (pisahkan dengan spasi, contoh: 25565 8080 3000): " -a PORTS

    # Validasi input
    if [[ -z "$PANEL_URL" || -z "$NODE_ID" || -z "$IP" || ${#PORTS[@]} -eq 0 ]]; then
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

# Fungsi untuk membuat API Key
generate_api_key() {
    print_header
    echo -e "${YELLOW}🔑 Membuat API Key Admin...${NC}"
    (php artisan p:admin:generate-token --name "API_SCRIPT" > /tmp/api_key.txt) & 
    loading_animation $!
    API_KEY=$(grep "Your API Key" /tmp/api_key.txt | awk '{print $4}')
    rm -f /tmp/api_key.txt

    if [ -z "$API_KEY" ]; then
        echo -e "${RED}❌ Gagal membuat API Key!${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ API Key berhasil dibuat: $API_KEY${NC}"
    sleep 1
}

# Fungsi untuk menambahkan allocation
add_allocation() {
    print_header
    echo -e "${YELLOW}🛠️ Menambahkan IP Allocation & Port ke Node ID $NODE_ID...${NC}"
    for PORT in "${PORTS[@]}"; do
        RESPONSE=$(curl -s -X POST "$PANEL_URL/api/application/nodes/$NODE_ID/allocations" \
            -H "Authorization: Bearer $API_KEY" \
            -H "Content-Type: application/json" \
            -H "Accept: application/json" \
            -d "{\"ip\": \"$IP\", \"port\": $PORT}" &
        )
        loading_animation $!
        
        if echo "$RESPONSE" | grep -q "attributes"; then
            echo -e "${GREEN}✅ Berhasil menambahkan allocation: $IP:$PORT${NC}"
        else
            echo -e "${RED}❌ Gagal menambahkan allocation untuk $IP:$PORT${NC}"
            echo -e "${RED}Response: $RESPONSE${NC}"
        fi
        sleep 0.5
    done
}

# Fungsi untuk menghasilkan token Wings
generate_wings_token() {
    print_header
    echo -e "${YELLOW}🔄 Menghasilkan token Wings untuk Node ID $NODE_ID...${NC}"
    RESPONSE=$(curl -s -X POST "$PANEL_URL/api/application/nodes/$NODE_ID/configuration" \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" &
    )
    loading_animation $!
    
    TOKEN=$(echo "$RESPONSE" | jq -r '.attributes.token' 2>/dev/null)

    if [ -n "$TOKEN" ] && [ "$TOKEN" != "null" ]; then
        echo -e "${GREEN}✅ Token Wings berhasil dibuat: $TOKEN${NC}"
    else
        echo -e "${RED}❌ Gagal membuat token Wings!${NC}"
        echo -e "${RED}Response: $RESPONSE${NC}"
    fi
}

# Main execution
check_dependencies
get_user_input
navigate_to_panel
generate_api_key
add_allocation
generate_wings_token

print_header
echo -e "${GREEN}🎉 Semua proses selesai! Terima kasih telah menggunakan skrip ini. 🦅${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"