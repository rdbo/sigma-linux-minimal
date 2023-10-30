#!/bin/sh

. ./config.sh

cd "$BASH_DIR"

echo "[*] Cleaning up before bash build..."
rm -rf "$BASH_BUILD_DIR"
mkdir -p "$BASH_BUILD_DIR"
cd "$BASH_BUILD_DIR"

echo "[*] Configuring bash..."
"$BASH_DIR/configure" --prefix= # TODO: Cross-compile with installed glibc

echo "[*] Building bash..."
time make -j "$MAX_THREADS"