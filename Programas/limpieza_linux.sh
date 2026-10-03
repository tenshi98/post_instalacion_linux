#!/bin/bash

set -u

echo "====================================================="
echo "       LIMPIEZA PROFUNDA - LINUX MINT"
echo "====================================================="

echo
echo "Espacio antes de la limpieza:"
df -h /

echo
echo "-----------------------------------------------------"
echo "1. Limpiando caché de APT..."
echo "-----------------------------------------------------"

sudo apt clean
sudo apt autoclean

echo
echo "-----------------------------------------------------"
echo "2. Eliminando dependencias innecesarias..."
echo "-----------------------------------------------------"

sudo apt autoremove -y

echo
echo "-----------------------------------------------------"
echo "3. Limpiando caché de usuarios..."
echo "-----------------------------------------------------"

rm -rf ~/.cache/thumbnails/*
rm -rf ~/.cache/fontconfig/*
rm -rf ~/.cache/*

echo
echo "-----------------------------------------------------"
echo "4. Limpiando papelera..."
echo "-----------------------------------------------------"

rm -rf ~/.local/share/Trash/files/*
rm -rf ~/.local/share/Trash/info/*

echo
echo "-----------------------------------------------------"
echo "5. Limpiando logs de systemd..."
echo "-----------------------------------------------------"

sudo journalctl --vacuum-time=7d

echo
echo "-----------------------------------------------------"
echo "6. Limpiando archivos temporales..."
echo "-----------------------------------------------------"

sudo find /tmp -mindepth 1 -delete 2>/dev/null
sudo find /var/tmp -mindepth 1 -delete 2>/dev/null

echo
echo "-----------------------------------------------------"
echo "7. Limpiando caché de npm..."
echo "-----------------------------------------------------"

if command -v npm >/dev/null 2>&1; then
    npm cache clean --force 2>/dev/null || true
fi

echo
echo "-----------------------------------------------------"
echo "8. Limpiando caché de pip..."
echo "-----------------------------------------------------"

if command -v pip >/dev/null 2>&1; then
    pip cache purge 2>/dev/null || true
fi

if command -v pip3 >/dev/null 2>&1; then
    pip3 cache purge 2>/dev/null || true
fi

echo
echo "-----------------------------------------------------"
echo "9. Limpiando caché de Composer..."
echo "-----------------------------------------------------"

if command -v composer >/dev/null 2>&1; then
    composer clear-cache 2>/dev/null || true
fi

echo
echo "-----------------------------------------------------"
echo "10. Limpiando caché de Snap..."
echo "-----------------------------------------------------"

if [ -d "/var/lib/snapd/cache" ]; then
    sudo rm -rf /var/lib/snapd/cache/*
fi

echo
echo "-----------------------------------------------------"
echo "11. Limpieza segura de Docker..."
echo "-----------------------------------------------------"

if command -v docker >/dev/null 2>&1; then

    echo "Docker: eliminando recursos NO utilizados..."

    sudo docker system prune -f

    echo
    echo "No se eliminan:"
    echo "  - Contenedores activos"
    echo "  - Imágenes utilizadas"
    echo "  - Volúmenes"
    echo "  - Redes utilizadas"

fi

echo
echo "-----------------------------------------------------"
echo "12. Limpiando caché de iconos..."
echo "-----------------------------------------------------"

rm -rf ~/.cache/icon-cache.kcache 2>/dev/null || true

echo
echo "-----------------------------------------------------"
echo "13. Limpiando caché de VS Code..."
echo "-----------------------------------------------------"

rm -rf ~/.config/Code/Cache/* 2>/dev/null || true
rm -rf ~/.config/Code/CachedData/* 2>/dev/null || true
rm -rf ~/.config/Code/Service\ Worker/CacheStorage/* 2>/dev/null || true

echo
echo "-----------------------------------------------------"
echo "14. Limpiando caché de Firefox..."
echo "-----------------------------------------------------"

rm -rf ~/.cache/mozilla/firefox/*/cache2/* 2>/dev/null || true

echo
echo "====================================================="
echo "       LIMPIEZA FINALIZADA"
echo "====================================================="

echo
echo "Espacio después de la limpieza:"
df -h /

echo
echo "Uso de disco:"
sudo du -sh /var/cache 2>/dev/null
sudo du -sh /var/log 2>/dev/null
sudo du -sh /tmp 2>/dev/null
sudo du -sh /var/lib/docker 2>/dev/null

echo
echo "Proceso terminado."
