#!/bin/sh

. ./config.sh

echo "[*] Binutils Version: $BINUTILS_VER"
echo "[*] Binutils URL: $BINUTILS_URL"

binutils_filename="binutils.tar.xz"
binutils_extract_dir="binutils-$BINUTILS_VER"

cd "$CACHEDIR"

if [ -d "$BINUTILS_DIR" ]; then
    echo "[*] Binutils directory exists, skipping..."
    exit
fi

if [ ! -f "$binutils_filename" ]; then
    echo "[*] Downloading binutils..."
    wget "$BINUTILS_URL" -O "$binutils_filename"
else
    echo "[*] Binutils already downloaded"
fi

echo "[*] Extracting binutils..."
tar -xf "$binutils_filename"
mv "$binutils_extract_dir" "$BINUTILS_DIR"
rm "$binutils_filename"