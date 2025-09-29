#!/data/data/com.termux/files/usr/bin/bash
echo "📦 Installing Termux Toolkit dependencies..."
pkg update -y && pkg upgrade -y
pkg install -y ffmpeg python espeak git curl jq
pip install --upgrade pip
pip install pillow pandas google-api-python-client google-auth-oauthlib google-auth-httplib2
echo "✅ All dependencies installed."
