#!/bin/bash
mkdir -p binary

url=$(curl -sL https://api.github.com/repos/nilaoda/N_m3u8DL-RE/releases/latest | grep -Eo 'https://[^"]*N_m3u8DL-RE_[^"]*_win-x64_[^"]*.zip' | head -n 1)
echo "Downloading $url"
curl -L "$url" -o re.zip
unzip -f -j re.zip -d binary
mv binary/N_m3u8DL-RE.exe

url=$(curl -sL https://api.github.com/repos/GyanD/codexffmpeg/releases/latest | grep -Eo 'https://[^"]*ffmpeg-[^"]*-essentials_build.7z' | head -n 1)
echo "Downloading $url"
curl -L "$url" -o ffmpeg.7z
7z x ffmpeg.7z -obuild
cp build/*/bin/ffmpeg.exe binary/ffmpeg.exe

url="https://www.bok.net/Bento4/binaries/Bento4-SDK-1-6-0-641.x86_64-microsoft-win32.zip"
echo "Downloading $url"
curl -L "$url" -o bento.zip
unzip -f -j bento.zip '*/bin/mp4decrypt.exe' -d binary