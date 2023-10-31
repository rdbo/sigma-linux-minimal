#!/bin/sh

. ./config.sh

echo "[*] Cleaning up before setting up sysroot..."

rm -rf "$ROOTFS_DIR"
mkdir -p "$ROOTFS_DIR"

echo "[*] Setting up sysroot..."

cd "$KERNEL_DIR"
make -j "$MAX_THREADS" headers_install INSTALL_HDR_PATH="$ROOTFS_DIR/usr"

cd "$LIBC_BUILD_DIR"
make -j "$MAX_THREADS" install DESTDIR="$ROOTFS_DIR"

cd "$ZSTD_DIR"
make -j "$MAX_THREADS" install PREFIX="/usr" DESTDIR="$ROOTFS_DIR"
mv "$ROOTFS_DIR"/usr/lib/libzstd.* "$ROOTFS_DIR"/usr/lib64/

cd "$ROOTFS_DIR"
mkdir -p lib usr/lib