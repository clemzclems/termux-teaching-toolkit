#!/data/data/com.termux/files/usr/bin/bash
OUT=/sdcard/DCIM/recording.wav
echo "🎙️ Recording... Press Ctrl+C to stop."
termux-microphone-record -f "$OUT"
echo "✅ Saved to $OUT"
echo "🔊 Playing back with espeak..."
espeak "Recording completed. File saved." 
