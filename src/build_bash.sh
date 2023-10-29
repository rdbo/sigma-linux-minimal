#!/bin/sh

. ./config.sh

cd "$BASH_DIR"

echo "[*] Modifying bash config..."
rm -rf "$BASH_BUILD_DIR"
mkdir -p "$BASH_BUILD_DIR"
cd "$BASH_BUILD_DIR"
"$BASH_DIR/configure" --prefix="/usr"

echo "[*] Building bash..."
time make -j "$MAX_THREADS"