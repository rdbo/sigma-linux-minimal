#!/bin/sh

. ./config.sh

cd "$LIBC_DIR"

echo "[*] Modifying libc config..."
rm -rf "$LIBC_BUILD_DIR"
mkdir -p "$LIBC_BUILD_DIR"
cd "$LIBC_BUILD_DIR"
"$LIBC_DIR/configure" --prefix="/usr"

echo "[*] Building libc..."
time make -j "$MAX_THREADS"