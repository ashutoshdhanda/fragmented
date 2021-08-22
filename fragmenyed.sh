for i in *.avi;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -re -i "$i" -g 52 -c:a aac -b:a 64k -c:v libx264 -b:v 448k -f mp4 -movflags frag_keyframe+empty_moov "${name}.mp4"
done