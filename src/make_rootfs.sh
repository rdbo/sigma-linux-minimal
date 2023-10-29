#!/bin/sh

echo "[*] Making rootfs..."

. ./config.sh

if [ -d "$ROOTFS_DIR" ]; then
    echo "[*] RootFS already exists, skipping..."
    exit
fi

mkdir -p "$ROOTFS_DIR"

cd "$BUSYBOX_DIR"
make install CONFIG_PREFIX="$ROOTFS_DIR"

cd "$LIBC_BUILD_DIR"
make -j "$MAX_THREADS" install DESTDIR="$ROOTFS_DIR"

cd "$BASH_BUILD_DIR"
make -j "$MAX_THREADS" install DESTDIR="$ROOTFS_DIR"

cd "$ROOTFS_DIR"
mkdir -p proc dev sys tmp
cat << EOF > init
#!/bin/sh

echo "Starting Sigma Linux..."
dmesg -n 1
mount -t devtmpfs none /dev
mount -t proc none /proc
mount -t sysfs none /sys
mount -t tmpfs none /tmp
mkdir -p /dev/devpts
mount -t devpts none /dev/pts
mdev -s
setsid cttyhack /bin/sh
EOF
chmod +x init