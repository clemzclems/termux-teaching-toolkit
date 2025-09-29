from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
import google_auth_oauthlib.flow, google.auth.transport.requests, os, pickle

SCOPES = ["https://www.googleapis.com/auth/youtube.upload"]

def authenticate():
    creds = None
    if os.path.exists("token.pkl"):
        with open("token.pkl","rb") as f: creds = pickle.load(f)
    if not creds:
        flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
            "client_secret.json", SCOPES)
        creds = flow.run_local_server(port=0)
        with open("token.pkl","wb") as f: pickle.dump(creds,f)
    return creds

def upload(video, title="Toolkit Upload", desc="Uploaded from Termux Toolkit"):
    creds = authenticate()
    youtube = build("youtube","v3",credentials=creds)
    request = youtube.videos().insert(
        part="snippet,status",
        body={"snippet":{"title":title,"description":desc},
              "status":{"privacyStatus":"unlisted"}},
        media_body=MediaFileUpload(video)
    )
    response = request.execute()
    print("✅ Uploaded:", response["id"])

if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("❌ Usage: python youtube_uploader.py file.mp4")
    else:
        upload(sys.argv[1])
