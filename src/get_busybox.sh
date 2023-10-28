#!/bin/sh

. ./config.sh

echo "[*] Busybox Version: $BUSYBOX_VER"
echo "[*] Busybox URL: $BUSYBOX_URL"

busybox_filename="busybox.tar.bz2"
busybox_extract_dir="busybox-$BUSYBOX_VER"

cd "$CACHEDIR"

if [ -d "$BUSYBOX_DIR" ]; then
    echo "[*] Busybox directory exists, skipping..."
    exit
fi

if [ ! -f "$busybox_filename" ]; then
    echo "[*] Downloading busybox..."
    wget "$BUSYBOX_URL" -O "$busybox_filename"
else
    echo "[*] Busybox already downloaded"
fi

echo "[*] Extracting busybox..."
tar -xf "$busybox_filename"
mv "$busybox_extract_dir" "$BUSYBOX_DIR"
rm "$busybox_filename"