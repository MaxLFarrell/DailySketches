cd data
ffmpeg -f image2 -i frame_%%05d.jpg video.avi
ffmpeg -i video.avi -pix_fmt rgb24 out.gif
rm frame_*
rm video.avi
mv out.gif ../
rm -rf data
cd ..
(goto) 2>nul & del "%~f0"