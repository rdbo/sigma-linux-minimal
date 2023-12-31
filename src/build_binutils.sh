#!/bin/sh

. ./config.sh

cd "$BINUTILS_DIR"

echo "[*] Cleaning up before binutils build..."
rm -rf "$BINUTILS_BUILD_DIR"
mkdir -p "$BINUTILS_BUILD_DIR"
cd "$BINUTILS_BUILD_DIR"

echo "[*] Configuring binutils..."
"$BINUTILS_DIR/configure" --prefix="/usr" --with-sysroot="$ROOTFS_DIR"

echo "[*] Building binutils..."
time make -j "$MAX_THREADS"