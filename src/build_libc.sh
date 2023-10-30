#!/bin/sh

. ./config.sh

cd "$LIBC_DIR"

echo "[*] Cleaning up before libc build..."
rm -rf "$LIBC_BUILD_DIR"
mkdir -p "$LIBC_BUILD_DIR"
cd "$LIBC_BUILD_DIR"

echo "[*] Installing kernel headers..."
kernel_headers_dir="$LIBC_BUILD_DIR/kernel-headers"
mkdir -p "$kernel_headers_dir"
make -C "$KERNEL_DIR" headers_install INSTALL_HDR_PATH="$kernel_headers_dir"

echo "[*] Configuring libc..."
"$LIBC_DIR/configure" --prefix="/usr" --with-headers="$kernel_headers_dir/include"

echo "[*] Building libc..."
time make -j "$MAX_THREADS"