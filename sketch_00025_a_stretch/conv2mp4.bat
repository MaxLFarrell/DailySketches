ffmpeg -f image2 -i frame_%%05d.png -i data/stretch.mp3 -c:v libx264 -c:a aac -strict -2 -b:a 192k -r 30 -shortest out.mp4