#!/data/data/com.termux/files/usr/bin/bash
IN="$1"
OUT=/sdcard/DCIM/$(basename "$IN" .mp3).txt

if [ -z "$IN" ]; then
  echo "❌ Usage: bash mp3_to_txt.sh /path/to/file.mp3"
  exit 1
fi

ffmpeg -y -i "$IN" -ar 16000 -ac 1 /sdcard/DCIM/tmp.wav

python - <<PY
import speech_recognition as sr, sys
r = sr.Recognizer()
with sr.AudioFile("/sdcard/DCIM/tmp.wav") as source:
    audio = r.record(source)
try:
    text = r.recognize_google(audio)
    open("$OUT","w").write(text)
    print("✅ Transcription saved to", "$OUT")
except Exception as e:
    print("❌ Error:", e)
PY
