#!/bin/bash

# Usage: ./fetch_driver.sh <remote_user> <remote_host> [remote_path]
# Example: ./fetch_driver.sh hamza 192.168.1.100 /home/hamza/Downloads

REMOTE_USER=$1
REMOTE_HOST=$2
REMOTE_PATH=${3:-/home/$REMOTE_USER/canon}
FILE_NAME="linux-UFRII-drv-v610-m17n-03.tar.gz"

# Validate arguments
if [ -z "$REMOTE_USER" ] || [ -z "$REMOTE_HOST" ]; then
  echo "Usage: $0 <remote_user> <remote_host> [remote_path]"
  exit 1
fi

echo "📡 Connecting to $REMOTE_USER@$REMOTE_HOST..."
echo "📥 Downloading $FILE_NAME from $REMOTE_PATH..."

scp "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/${FILE_NAME}" .

if [ $? -ne 0 ]; then
  echo "❌ SCP failed. Check credentials, path, or network."
  exit 1
fi

echo "✅ File downloaded: $FILE_NAME"

# Optional: extract it
echo "📂 Extracting archive..."
tar -xzf "$FILE_NAME" && echo "✅ Extracted successfully."

cd linux-UFRII-drv-v610-m17n-03

./install.sh

echo "✅ Installation complete!"
echo "🖨️ You can now add your Canon MF3010 printer using system settings or CUPS (http://localhost:631)."


