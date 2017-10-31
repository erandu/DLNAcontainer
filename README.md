# DLNAcontainer
Run minidlna within a small Docker container



How to use ?


docker build -t erandu/dlnacontainer .

docker run -d --name minidlna --net=host -p 8200:8200 -p 1900:1900/udp \
-v <MUSIC_DIR>:/var/lib/minidlna/music
-v <VIDEO_DIR>:/var/lib/minidlna/videos
-v <PIC_DIR>:/var/lib/minidlna/pictures
erandu/dlnacontainer



