#!/data/data/com.termux/files/usr/bin/bash
# Frames → Video (12 frames teaching animation)
INPUT=/sdcard/DCIM/frames
OUTPUT=/sdcard/DCIM/framestitch.mp4
FPS=0.2   # ~5 sec per frame

ffmpeg -y -framerate $FPS -i "$INPUT/frame_%02d.png" -c:v libx264 -pix_fmt yuv420p "$OUTPUT"
echo "✅ Video created at $OUTPUT"
