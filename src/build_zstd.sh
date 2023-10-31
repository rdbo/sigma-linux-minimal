#!/bin/sh

. ./config.sh

cd "$ZSTD_DIR"

echo "[*] Cleaning up before zstd build..."
make -j "$MAX_THREADS" clean

echo "[*] Building zstd..."
time make -j "$MAX_THREADS"