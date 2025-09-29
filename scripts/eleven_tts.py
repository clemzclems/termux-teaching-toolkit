import requests, sys, os

API_KEY = os.getenv("ELEVEN_API_KEY") or "your_api_key_here"
VOICE_ID = "21m00Tcm4TlvDq8ikWAM"  # default voice

if len(sys.argv) < 2:
    print("❌ Usage: python eleven_tts.py 'your text here'")
    sys.exit(1)

text = sys.argv[1]
url = f"https://api.elevenlabs.io/v1/text-to-speech/{VOICE_ID}"

headers = {
    "Accept": "audio/mpeg",
    "Content-Type": "application/json",
    "xi-api-key": API_KEY
}
data = {"text": text, "voice_settings": {"stability": 0.5, "similarity_boost": 0.7}}

out_file = "/sdcard/DCIM/tts_output.mp3"
resp = requests.post(url, headers=headers, json=data)

if resp.status_code == 200:
    with open(out_file, "wb") as f: f.write(resp.content)
    print(f"✅ Saved to {out_file}")
else:
    print("❌ Error:", resp.text)
