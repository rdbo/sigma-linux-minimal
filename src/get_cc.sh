#!/bin/sh

. ./config.sh

echo "[*] CC Version: $CC_VER"
echo "[*] CC URL: $CC_URL"

cd "$CACHEDIR"

cc_filename="cc.tar.xz"
cc_extract_dir="gcc-$CC_VER"

gmp_ver="6.3.0"
gmp_url="https://gmplib.org/download/gmp/gmp-${gmp_ver}.tar.xz"
gmp_filename="gmp.tar.xz"
gmp_extract_dir="gmp-$gmp_ver"

mpfr_ver="4.2.1"
mpfr_url="https://www.mpfr.org/mpfr-current/mpfr-${mpfr_ver}.tar.xz"
mpfr_filename="mpfr.tar.xz"
mpfr_extract_dir="mpfr-$mpfr_ver"

mpc_ver="1.3.1"
mpc_url="https://ftp.gnu.org/gnu/mpc/mpc-${mpc_ver}.tar.gz"
mpc_filename="mpc.tar.gz"
mpc_extract_dir="mpc-$mpc_ver"

echo "[*] Cleaning up before getting CC..."
rm -rf "$CC_DIR" "$cc_filename" "$cc_extract_dir" "$gmp_filename" "$gmp_extract_dir"

echo "[*] Downloading dependencies..."
wget "$gmp_url" -O "$gmp_filename"
wget "$mpfr_url" -O "$mpfr_filename"
wget "$mpc_url" -O "$mpc_filename"

echo "[*] Downloading CC..."
wget "$CC_URL" -O "$cc_filename"

echo "[*] Extracting CC..."
tar -xf "$cc_filename"
mv "$cc_extract_dir" "$CC_DIR"
rm "$cc_filename"

echo "[*] Setting up CC dependencies..."
tar -xf "$gmp_filename"
mv "$gmp_extract_dir" "$CC_DIR/gmp"

tar -xf "$mpfr_filename"
mv "$mpfr_extract_dir" "$CC_DIR/mpfr"

tar -xf "$mpc_filename"
mv "$mpc_extract_dir" "$CC_DIR/mpc"