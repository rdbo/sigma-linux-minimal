#!/bin/sh

. ./config.sh

cd "$BUSYBOX_DIR"

echo "[*] Cleaning up before busybox build..."
make -j "$MAX_THREADS" distclean

echo "[*] Configuring busybox..."
make defconfig
# modify: # CONFIG_STATIC is not set
tmp_config="$CACHEDIR/tmp_config"
sed -E 's/.*[[:space:]]CONFIG_STATIC[[:space:]].*/CONFIG_STATIC=y/g' .config > "$tmp_config"
cp "$tmp_config" .config
rm "$tmp_config"

echo "[*] Building busybox..."
time make -j "$MAX_THREADS"