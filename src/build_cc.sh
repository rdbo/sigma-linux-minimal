#!/bin/sh

. ./config.sh

cd "$CC_DIR"

echo "[*] Cleaning up before CC build..."
rm -rf "$CC_BUILD_DIR"
mkdir -p "$CC_BUILD_DIR"
cd "$CC_BUILD_DIR"

echo "[*] Configuring CC..."

"$CC_DIR/configure" \
    --prefix="/usr" \
    --with-build-sysroot="$ROOTFS_DIR" \
    --with-sysroot="$ROOTFS_DIR" \
    --disable-multilib \
    --disable-nls \
    --disable-libsanitizer \
    --enable-languages=c,c++

echo "[*] Building CC..."
time make -j "$MAX_THREADS" all-gcc
time make -j "$MAX_THREADS" all-target-libgcc