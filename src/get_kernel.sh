#!/bin/sh

. ./config.sh

echo "[*] Kernel Major: $KERNEL_MAJOR"
echo "[*] Kernel Version: $KERNEL_VER"
echo "[*] Kernel URL: $KERNEL_URL"

kernel_filename="linux.tar.xz"
kernel_extract_dir="linux-$KERNEL_VER"

cd "$CACHEDIR"

if [ -d "$KERNEL_DIR" ]; then
    echo "[*] Kernel directory exists, skipping..."
    exit
fi

if [ ! -f "$kernel_filename" ]; then
    echo "[*] Downloading kernel..."
    wget "$KERNEL_URL" -O "$kernel_filename"
else
    echo "[*] Kernel already downloaded"
fi

echo "[*] Extracting kernel..."
tar -xf "$kernel_filename"
mv "$kernel_extract_dir" "$KERNEL_DIR"
rm "$kernel_filename"