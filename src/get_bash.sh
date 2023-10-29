#!/bin/sh

. ./config.sh

echo "[*] Bash Version: $BASH_VER"
echo "[*] Bash URL: $BASH_URL"

bash_filename="bash.tar.gz"
bash_extract_dir="bash-$BASH_VER"

cd "$CACHEDIR"

if [ -d "$BASH_DIR" ]; then
    echo "[*] Bash directory exists, skipping..."
    exit
fi

if [ ! -f "$bash_filename" ]; then
    echo "[*] Downloading bash..."
    wget "$BASH_URL" -O "$bash_filename"
else
    echo "[*] Bash already downloaded"
fi

echo "[*] Extracting bash..."
tar -xzf "$bash_filename"
mv "$bash_extract_dir" "$BASH_DIR"
rm "$bash_filename"