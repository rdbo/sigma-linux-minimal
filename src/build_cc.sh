#!/bin/sh

. ./config.sh

cd "$CC_DIR"

echo "[*] Cleaning up before CC build..."
rm -rf "$CC_BUILD_DIR"
mkdir -p "$CC_BUILD_DIR"
cd "$CC_BUILD_DIR"

echo "[*] Configuring CC..."
"$CC_DIR/configure" --prefix="/usr" --with-sysroot="$ROOTFS_DIR" --disable-multilib # TODO: Add support for 32 bits as well on a 64 bit system

echo "[*] Building CC..."
time make -j "$MAX_THREADS"