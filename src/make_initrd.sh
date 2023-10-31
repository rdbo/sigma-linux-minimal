#!/bin/sh

echo "[*] Making initrd..."

. ./config.sh

rm -rf "$INITRD_DIR"
mkdir -p "$INITRD_DIR"

cd "$BUSYBOX_DIR"
make install CONFIG_PREFIX="$INITRD_DIR"

cd "$INITRD_DIR"
mkdir -p proc dev sys tmp
cat << EOF > init
#!/bin/sh

echo "Starting Sigma Linux..."
dmesg -n 1
mount -t devtmpfs none /dev
mount -t proc none /proc
mount -t sysfs none /sys
mount -t tmpfs none /tmp
mkdir -p /dev/pts
mount -t devpts none /dev/pts
mdev -s
setsid cttyhack /bin/sh
EOF
chmod +x init