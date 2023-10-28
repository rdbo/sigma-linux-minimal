#!/bin/sh

. ./config.sh

echo "[*] Patching kernel..."
uts_file="$KERNEL_DIR/include/linux/uts.h"
tmp_uts_file="$CACHEDIR/tmp_uts.h"
sed -E 's/UTS_SYSNAME[[:space:]]+"Linux"/UTS_SYSNAME "Sigma Linux"/g' "$uts_file" > "$tmp_uts_file"
cp "$tmp_uts_file" "$uts_file"
rm "$tmp_uts_file"
printf "[*] UTS_SYSNAME: "
cat "$uts_file" | grep -E "#define[[:space:]]+UTS_SYSNAME"