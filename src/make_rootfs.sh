#!/bin/sh

echo "[*] Making rootfs..."

. ./config.sh

cd "$KERNEL_DIR"
make -j "$MAX_THREADS" modules_install INSTALL_MOD_PATH="$ROOTFS_DIR"

cd "$BASH_BUILD_DIR"
make -j "$MAX_THREADS" install DESTDIR="$ROOTFS_DIR"

# TODO: Remove busybox from rootfs (maybe???)