#!/bin/sh

. ./config.sh

echo "[*] Building kernel..."
cd "$KERNEL_DIR"
# TODO: Copy kernel config before building
time make -j "$MAX_THREADS" mrproper defconfig bzImage modules