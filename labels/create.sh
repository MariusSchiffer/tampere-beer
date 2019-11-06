#!/bin/bash
max=$((($3-1)/2))
for i in $(seq 0 $max); do
c1=$(($2 + 2*$i))
c2=$(($2 + 2*$i + 1))
bc1=$(printf "%04d" $c1)
bc2=$(printf "%04d" $c2)
qrencode --background ffffff00 -o /tmp/qr1.png "https://sbrew.de/b/$bc1"
convert $1 \( /tmp/qr1.png -filter point -resize 430 \) -geometry +2000+515 -composite -font helvetica -gravity northwest -fill black -pointsize 28  -draw "text 2188,960 '$bc1'" /tmp/output1.png
qrencode --background ffffff00 -o /tmp/qr2.png "https://sbrew.de/b/$bc1"
convert $1 \( /tmp/qr2.png -filter point -resize 430 \) -geometry +2000+515 -composite -font helvetica -gravity northwest -fill black -pointsize 28  -draw "text 2188,960 '$bc2'" /tmp/output2.png
convert -size 2221x3141 xc:white \( /tmp/output1.png -rotate 90 \) -geometry +0+0 -composite  \( /tmp/output2.png -rotate 90 \) -geometry +1010+0 -composite print$i.png 
done;
