#!/bin/sh

. ./config.sh

echo "[*] Zstd Version: $ZSTD_VER"
echo "[*] Zstd URL: $ZSTD_URL"

zstd_filename="zstd.tar.gz"
zstd_extract_dir="zstd-$ZSTD_VER"

cd "$CACHEDIR"

if [ -d "$ZSTD_DIR" ]; then
    echo "[*] Zstd directory exists, skipping..."
    exit
fi

if [ ! -f "$zstd_filename" ]; then
    echo "[*] Downloading zstd..."
    wget "$ZSTD_URL" -O "$zstd_filename"
else
    echo "[*] Zstd already downloaded"
fi

echo "[*] Extracting zstd..."
tar -xzf "$zstd_filename"
mv "$zstd_extract_dir" "$ZSTD_DIR"
rm "$zstd_filename"