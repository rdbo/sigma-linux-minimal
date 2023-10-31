#!/bin/sh

echo "[*] Making ISO file..."

. ./config.sh

rm -rf "$ISO_DIR"
mkdir -p "$ISO_DIR"

kernel_dir="boot"
kernel_path="$kernel_dir/$KERNEL_IMAGE"
mkdir -p "$ISO_DIR/$kernel_dir"
cp "$KERNEL_DIR/arch/$ARCH/boot/bzImage" "$ISO_DIR/$kernel_path"
cp "$KERNEL_DIR/.config" "$ISO_DIR/boot/config-$KERNEL_IMAGE"

cd "$INITRD_DIR"
initrd_path="boot/initrd"
find . | cpio -R root:root -H newc -o | gzip > "$ISO_DIR/$initrd_path"

mkdir -p "$ISO_DIR/boot/grub"
cp "$ROOTDIR/src/grub-wallpaper.png" "$ISO_DIR/boot/grub/wallpaper.png"
cat << EOF > "$ISO_DIR/boot/grub/grub.cfg"
insmod all_video
insmod gfxterm

loadfont /boot/grub/fonts/unicode.pf2

set timeout=5
set gfxmode=640x480
terminal_output gfxterm

insmod png
background_image /boot/grub/wallpaper.png

menuentry "Sigma Linux" {
    echo "Loading vmlinuz..."
    linux /$kernel_path
    echo "Loading initrd..."
    initrd /$initrd_path
}
EOF

rootfs_file="squash.rootfs"
mksquashfs "$ROOTFS_DIR" "$ISO_DIR/$rootfs_file" # TODO: Tune this command for better results

mkdir -p "$OUT_DIR"

# NOTE: install `grub-bios` and `grub-uefi` to support both BIOS and UEFI booting
grub-mkrescue "$ISO_DIR" -o "$ISO_FILE"