#!/bin/sh

. ./config.sh

echo "[*] Libc Version: $LIBC_VER"
echo "[*] Libc URL: $LIBC_URL"

libc_filename="glibc.tar.xz"
libc_extract_dir="glibc-$LIBC_VER"

cd "$CACHEDIR"

if [ -d "$LIBC_DIR" ]; then
    echo "[*] Libc directory exists, skipping..."
    exit
fi

if [ ! -f "$libc_filename" ]; then
    echo "[*] Downloading libc..."
    wget "$LIBC_URL" -O "$libc_filename"
else
    echo "[*] Libc already downloaded"
fi

echo "[*] Extracting libc..."
tar -xf "$libc_filename"
mv "$libc_extract_dir" "$LIBC_DIR"
rm "$libc_filename"