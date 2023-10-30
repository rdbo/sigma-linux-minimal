#!/bin/sh

. ./config.sh

cd "$BUSYBOX_DIR"

echo "[*] Cleaning up before busybox build..."
make -j "$MAX_THREADS" distclean

echo "[*] Configuring busybox..."
make defconfig
# modify: # CONFIG_STATIC is not set
sed -iE 's/.*[[:space:]]CONFIG_STATIC[[:space:]].*/CONFIG_STATIC=y/' .config
# NOTE: busybox will be compiled statically, so no need for SYSROOT
# modify: CONFIG_SYSROOT=""
#sed -iE "s|.*CONFIG_SYSROOT=.*|CONFIG_SYSROOT=\"$ROOTFS_DIR\"|" .config
#modify: CONFIG_EXTRA_CFLAGS=""
#lib_dir="lib"
#if [ "$BITS" = "64" ]; then
#    lib_dir="${lib_dir}64"
#fi
#sed -iE "s|.*CONFIG_EXTRA_CFLAGS.*|CONFIG_EXTRA_CFLAGS=\"-L$ROOTFS_DIR/$lib_dir\"|" .config
cd "$BUSYBOX_DIR"

echo "[*] Building busybox..."
time make -j "$MAX_THREADS"