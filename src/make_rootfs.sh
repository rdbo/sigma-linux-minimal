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

cd "$ROOTFS_DIR"
mkdir -p proc dev sys tmp
cat << EOF > init
#!/bin/sh

dmesg -n 1
mount -t devtmpfs none /dev
mount -t proc none /proc
mount -t sysfs none /sys
mount -t tmpfs none /tmp
setsid cttyhack /bin/sh
EOF
chmod +x init