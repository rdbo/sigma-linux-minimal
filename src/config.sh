#!/bin/sh

set -e # die on error

export ROOTDIR="$(pwd)/.."
export CACHEDIR="$ROOTDIR/cache"
export MAX_THREADS="$(nproc --ignore=2)"
export ARCH="$(uname -m)"
export BITS="$(getconf LONG_BIT)" # 64 or 32
export ROOTFS_DIR="$CACHEDIR/rootfs"
export ISO_DIR="$CACHEDIR/iso"
export OUT_DIR="$CACHEDIR/out"
export ISO_FILE="$OUT_DIR/sigma-linux-minimal.iso"
export INITRD_DIR="$CACHEDIR/initrd"

export KERNEL_VER="6.5.9"
export KERNEL_MAJOR="$(echo $KERNEL_VER | awk -F '.' '{ print $1 }')"
export KERNEL_URL="https://cdn.kernel.org/pub/linux/kernel/v${KERNEL_MAJOR}.x/linux-${KERNEL_VER}.tar.xz"
export KERNEL_DIR="$CACHEDIR/kernel"
export KERNEL_IMAGE="vmlinuz"

export LIBC_VER="2.38"
export LIBC_URL="https://ftp.gnu.org/gnu/glibc/glibc-${LIBC_VER}.tar.xz"
export LIBC_DIR="$CACHEDIR/libc"
export LIBC_BUILD_DIR="$LIBC_DIR/build"

export BUSYBOX_VER="1.36.1"
export BUSYBOX_URL="https://busybox.net/downloads/busybox-${BUSYBOX_VER}.tar.bz2"
export BUSYBOX_DIR="$CACHEDIR/busybox"

export BINUTILS_VER="2.40.90"
export BINUTILS_URL="https://sourceware.org/pub/binutils/snapshots/binutils-${BINUTILS_VER}.tar.xz"
export BINUTILS_DIR="$CACHEDIR/binutils"
export BINUTILS_BUILD_DIR="$BINUTILS_DIR/build"

export CC_VER="13.2.0"
export CC_URL="https://ftp.gnu.org/gnu/gcc/gcc-${CC_VER}/gcc-${CC_VER}.tar.xz"
export CC_DIR="$CACHEDIR/cc"
export CC_BUILD_DIR="$CC_DIR/build"

# Bash is required by some tools, like `ldd`, shipped with `glibc`
export BASH_VER="5.2.15"
export BASH_URL="https://ftp.gnu.org/gnu/bash/bash-${BASH_VER}.tar.gz"
export BASH_DIR="$CACHEDIR/bash"
export BASH_BUILD_DIR="$BASH_DIR/build"

if [ ! -d "$CACHEDIR" ]; then
  mkdir -p "$CACHEDIR"
fi