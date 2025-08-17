if (( $EUID != 0 )); then
    echo "Silakan jalankan sebagai root"
    exit
fi

fix() {
    echo "Memperbaiki tema..."
    cd /var/www/pterodactyl
    npx browserslist@latest --update-db
    npx update-browserslist-db@latest
    echo "Harap tunggu hingga proses selesai..."
    yarn build:production
}


echo "Selamat datang di Kalzz Theme fixer!"

while true; do
    read -p "Apa kamu yakin [Y/N]? " yn
    case $yn in
        [Yy]* ) fix; break;;
        [Nn]* ) exit;;
        * ) exit;;
    esac
done