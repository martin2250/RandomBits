#!/bin/bash

#convert all mp3 files in folder to 128kb/s

mkdir output

for input in *.mp3
do
	ffmpeg -i "${input}" -codec:a libmp3lame -q:a 5 "output/${input}"
done
