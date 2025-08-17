#!/bin/bash

BLUE='\033[0;34m'.
NO_COLOR='\033[0m'

if (( $EUID != 0 )); then
    echo "Silakan jalankan sebagai root"
    exit
fi

clear

installTheme(){
    cd /var/www/
    tar -cvf IceMinecraftTheme.tar.gz pterodactyl
    echo "Menginstal tema..."
    cd /var/www/pterodactyl
    rm -r IceMinecraftTheme
    git clone https://raw.githubusercontent.com/Kalzzoffc/IceMinecraftTheme.git
    cd IceMinecraftTheme
    rm /var/www/pterodactyl/resources/scripts/IceMinecraftTheme.css
    rm /var/www/pterodactyl/resources/scripts/index.tsx
    rm /var/www/pterodactyl/resources/scripts/components/server/console/Console.tsx
    mv resources/scripts/index.tsx /var/www/pterodactyl/resources/scripts/index.tsx
    mv resources/scripts/IceMinecraftTheme.css /var/www/pterodactyl/resources/scripts/IceMinecraftTheme.css
    mv resources/scripts/components/server/console/Console.tsx /var/www/pterodactyl/resources/scripts/components/server/console/Console.tsx
    cd /var/www/pterodactyl

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | sudo -E bash -
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install node || {
        echo "perintah nvm tidak ditemukan, mencoba sumber skrip nvm secara langsung..."
        . ~/.nvm/nvm.sh
        nvm install node
    }
    apt update

    npm i -g yarn
    yarn
    export NODE_OPTIONS=--openssl-legacy-provider
    yarn build:production || {
        echo "node: --openssl-legacy-provider tidak diizinkan di NODE_OPTIONS"
        export NODE_OPTIONS=
        yarn build:production
    }
    sudo php artisan optimize:clear
}

installThemeQuestion(){
    while true; do
        read -p "Apakah Anda yakin ingin memasang tema ini? [Y/N]? " yn
        case $yn in
            [Yy]* ) installTheme; break;;
            [Nn]* ) exit;;
            * ) exit;;
        esac
    done
}

repair(){
    bash <(curl https://raw.githubusercontent.com/Kalzzoffc/IceMinecraftTheme/main/repair.sh)
}

restoreBackUp(){
    echo "Memulihkan cadangan..."
    cd /var/www/
    tar -xvf IceMinecraftTheme.tar.gz
    rm IceMinecraftTheme.tar.gz

    cd /var/www/pterodactyl
    yarn build:production
    sudo php artisan optimize:clear
}
                                                                                                                           
printf "${blue} ____       _____        ______          _________________  ____   ____      ______        ______  _______        ______    \n"
printf "${blue}|    |  ___|\    \   ___|\     \        /                 \|    | |    | ___|\     \      |      \/       \   ___|\     \   \n"
printf "${blue}|    | /    /\    \ |     \     \       \______     ______/|    | |    ||     \     \    /          /\     \ |     \     \  \n"
printf "${blue}|    ||    |  |    ||     ,_____/|         \( /    /  )/   |    |_|    ||     ,_____/|  /     /\   / /\     ||     ,_____/| \n"
printf "${blue}|    ||    |  |____||     \--'\_|/          ' |   |   '    |    .-.    ||     \--'\_|/ /     /\ \_/ / /    /||     \--'\_|/ \n"
printf "${blue}|    ||    |   ____ |     /___/|              |   |        |    | |    ||     /___/|  |     |  \|_|/ /    / ||     /___/|   \n"
printf "${blue}|    ||    |  |    ||     \____|\            /   //        |    | |    ||     \____|\ |     |       |    |  ||     \____|\  \n"
printf "${blue}|____||\ ___\/    /||____ '     /|          /___//         |____| |____||____ '     /||\____\       |____|  /|____ '     /| \n"
printf "${blue}|    || |   /____/ ||    /_____/ |         |    |          |    | |    ||    /_____/ || |    |      |    | / |    /_____/ | \n"
printf "${blue}|____| \|___|    | /|____|     | /         |____|          |____| |____||____|     | / \|____|      |____|/  |____|     | / \n"
printf "${blue}  \(     \( |____|/   \( |_____|/            \(              \(     )/    \( |_____|/     \(          )/       \( |_____|/  \n"
printf "${blue}   '      '   )/       '    )/                '               '     '      '    )/         '          '         '    )/     \n"
printf "${blue}              '             '                                                   '                                    '      \n"
echo ""
echo "Copyright (c) 2022 Angelillo15 | angelillo15.es"
echo "Telegram: https://t.me/Kalzzoffc"
echo "Website: https://profil-kalzz-official-developer.vercel.app/"
echo ""
echo "[1] Instal tema"
echo "[2] Pulihkan cadangan"
echo "[3] Panel perbaikan (gunakan jika Anda mengalami kesalahan dalam instalasi tema)"
echo "[4] Perbarui panelnya"
echo "[5] Keluar"
printf "${NO_COLOR}"

read -p "Silakan masukkan nomor: " choice
if [ $choice == "1" ]
    then
    installThemeQuestion
fi
if [ $choice == "2" ]
    then
    restoreBackUp
fi
if [ $choice == "3" ]
    then
    repair
fi
if [ $choice == "4" ]
    then
    repair
fi
if [ $choice == "5" ]
    then
    exit
fi
