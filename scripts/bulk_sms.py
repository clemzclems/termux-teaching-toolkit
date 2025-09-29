import pandas as pd, os, sys, subprocess

if len(sys.argv) < 3:
    print("❌ Usage: python bulk_sms.py contacts.csv 'Your message here'")
    sys.exit(1)

csv_file, message = sys.argv[1], sys.argv[2]
df = pd.read_csv(csv_file)

for num in df["contacts"]:
    print(f"📩 Sending to {num}...")
    subprocess.run(["termux-sms-send","-n",str(num),message])
print("✅ Done sending all messages.")
