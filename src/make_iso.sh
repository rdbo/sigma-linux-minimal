#!/bin/sh

echo "[*] Making ISO file..."

. ./config.sh

mkdir -p "$ISO_DIR"

cp "$KERNEL_DIR/arch/$ARCH/boot/bzImage" "$ISO_DIR/$KERNEL_IMAGE"

cd "$ROOTFS_DIR"
find . | cpio -R root:root -H newc -o | gzip > "$ISO_DIR/initrd.gz"

mkdir -p "$ISO_DIR/boot/grub"
cat << EOF > "$ISO_DIR/boot/grub/grub.cfg"
GRUB_TERMINAL_INPUT="console serial"
menuentry "Sigma Linux" {
    linux /$KERNEL_IMAGE
    initrd /initrd.gz
}
EOF

mkdir -p "$OUT_DIR"

# NOTE: install `grub-bios` and `grub-uefi` to support both BIOS and UEFI booting
grub-mkrescue "$ISO_DIR" -o "$ISO_FILE"