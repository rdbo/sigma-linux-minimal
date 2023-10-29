#!/bin/sh

. ./config.sh

cd "$LIBC_DIR"

echo "[*] Modifying libc config..."
rm -rf build
mkdir -p build
cd build
../configure --prefix="/usr"
make -j "$MAX_THREADS"

echo "[*] Building libc..."
time make -j "$MAX_THREADS"