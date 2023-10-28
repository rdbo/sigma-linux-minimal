#!/bin/sh

. ./config.sh

echo "[*] Building kernel..."
cd "$KERNEL_DIR"
time make -j "$MAX_THREADS" mrproper defconfig bzImage