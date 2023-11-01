#!/bin/sh

. ./config.sh

echo "[*] Building kernel..."
cd "$KERNEL_DIR"

make -j "$MAX_THREADS" mrproper

kernel_config="$SRCDIR/kernel-config"

if [ -f "$kernel_config" ]; then
    cp "$kernel_config" ./.config
else
    make defconfig
fi

time make -j "$MAX_THREADS" bzImage modules