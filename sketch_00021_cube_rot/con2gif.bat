ffmpeg -f image2 -i frame_%%05d.jpg video.avi
ffmpeg -i video.avi -pix_fmt rgb24 out.gif