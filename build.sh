#!/bin/sh

cd src
./clean.sh &&
./get_kernel.sh &&
./patch_kernel.sh &&
./build_kernel.sh &&
./get_busybox.sh &&
./build_busybox.sh &&
./get_libc.sh &&
./build_libc.sh &&
./make_rootfs.sh &&
./make_iso.sh
