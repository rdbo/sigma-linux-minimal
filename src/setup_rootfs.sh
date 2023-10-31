#!/bin/sh

. ./config.sh

echo "[*] Setting up rootfs from sysroot base..."

if [ ! -d "$ROOTFS_DIR" ]; then
    echo "[!] Sysroot was not set up"
    exit 1
fi

cd "$BINUTILS_BUILD_DIR"
make -j "$MAX_THREADS" install DESTDIR="$ROOTFS_DIR"

cd "$CC_BUILD_DIR"
make -j "$MAX_THREADS" install-gcc DESTDIR="$ROOTFS_DIR"
make -j "$MAX_THREADS" install-target-libgcc DESTDIR="$ROOTFS_DIR"

echo "[*] Adding busybox to rootfs for chroot facilities..." # NOTE: maybe needs to be removed afterwards???
cd "$BUSYBOX_DIR"
make install CONFIG_PREFIX="$ROOTFS_DIR"