#!/bin/sh

export ROOTDIR="$(pwd)/.."
export CACHEDIR="$ROOTDIR/cache"
export MAX_THREADS="$(nproc --ignore=2)"
export ARCH="$(uname -m)"
export ROOTFS_DIR="$CACHEDIR/rootfs"
export ISO_DIR="$CACHEDIR/iso"
export OUT_DIR="$CACHEDIR/out"
export ISO_FILE="$OUT_DIR/sigma-linux-minimal.iso"

export KERNEL_VER="6.5.9"
export KERNEL_MAJOR="$(echo $KERNEL_VER | awk -F '.' '{ print $1 }')"
export KERNEL_URL="https://cdn.kernel.org/pub/linux/kernel/v${KERNEL_MAJOR}.x/linux-${KERNEL_VER}.tar.xz"
export KERNEL_DIR="$CACHEDIR/kernel"
export KERNEL_IMAGE="vmlinuz"

export BUSYBOX_VER="1.36.1"
export BUSYBOX_URL="https://busybox.net/downloads/busybox-${BUSYBOX_VER}.tar.bz2"
export BUSYBOX_DIR="$CACHEDIR/busybox"

export LIBC_VER="2.38"
export LIBC_URL="https://ftp.gnu.org/gnu/glibc/glibc-${LIBC_VER}.tar.xz"
export LIBC_DIR="$CACHEDIR/libc"

if [ ! -d "$CACHEDIR" ]; then
  mkdir -p "$CACHEDIR"
fi