#!/data/data/com.termux/files/usr/bin/bash
clear
echo "=============================         📘 Termux Teaching Toolkit"
echo "============================="
echo "1) Frames → Video (framestitch)"
echo "2) Images → Video (python)"
echo "3) Record Audio (espeak demo)"
echo "4) Convert MP3 → Text (mp3_to_txt)"
echo "5) ElevenLabs TTS (text → mp3)"
echo "6) Upload to YouTube (python)"
echo "7) Bulk SMS (contacts.csv)"
echo "8) Exit"
echo "============================="
read -p "Select an option: " choice

case $choice in
  1) bash ~/termux-teaching-toolkit/scripts/framestitch.sh ;;
  2) python ~/termux-teaching-toolkit/scripts/images_to_video.py ;;
  3) bash ~/termux-teaching-toolkit/scripts/recaudio.sh ;;
  4) bash ~/termux-teaching-toolkit/scripts/mp3_to_txt.sh ;;
  5) python ~/termux-teaching-toolkit/scripts/eleven_tts.py ;;
  6) python ~/termux-teaching-toolkit/scripts/youtube_uploader.py ;;
  7) python ~/termux-teaching-toolkit/scripts/bulk_sms.py ;;
  8) exit ;;
  *) echo "❌ Invalid choice" ;;
esac
