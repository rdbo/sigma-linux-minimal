#!/bin/sh

cd src
./config.sh
./clean.sh
./get_kernel.sh
./patch_kernel.sh
./build_kernel.sh
./get_libc.sh
./build_libc.sh
./setup_sysroot.sh
./get_busybox.sh
./build_busybox.sh
./get_binutils.sh
./build_binutils.sh
./get_cc.sh
./build_cc.sh
./setup_rootfs.sh
./get_bash.sh
./build_bash.sh
./make_rootfs.sh
./make_initrd.sh
./make_iso.sh
