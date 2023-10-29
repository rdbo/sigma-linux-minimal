#!/bin/sh

. ./config.sh

cd "$BINUTILS_DIR"

echo "[*] Modifying binutils config..."
rm -rf "$BINUTILS_BUILD_DIR"
mkdir -p "$BINUTILS_BUILD_DIR"
cd "$BINUTILS_BUILD_DIR"
"$BINUTILS_DIR/configure" --prefix="/usr" # TODO: Cross-compile with installed glibc

echo "[*] Building binutils..."
time make -j "$MAX_THREADS"