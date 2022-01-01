#!/bin/bash

#youtube-dl audiomation script 
#Download directory - change wherever you want it to be and it will change script-wide
downloaddir=$($HOME/Music/download/) #> /dev/null 2>&1

#{
mkdir -pv $downloaddir/tmp{1..5}
#} > /dev/null 2>&1
read -p "Enter link (or playlist ID): " link 
read -p "Do you want to download audio or video? [a/v] " av;
ls $USER/Music/download
read -p "Download destination: (In /home/jacob/Music/download directory): " dir
rm -rf $HOME/$downloaddir/$dir


	case $av in

		a)	echo 
			echo "1) m4a (recommended)"
			echo "2) aac"
			echo "3) flac"
			echo "4) mp3"
			echo 
			read -p "Choose audio format: [mp3; wav] " aformat

			youtube-dl --embed-thumbnail --extract-audio --audio-format $aformat -o "$downloaddir/$dir/%(title)s.%(ext)s" "$link";;

	#IMPORTANT: Make a "default" option for video formats

		v)	echo ""
			echo "1) mp4 (subtitles supported)"
			echo "2) flv"
			echo "3) ogg"
			echo "4) mkv (subtitles supported)"
			echo "5) avi"
			echo "6) Webm (subtitles supported"
			echo ""
			read -p "Choose video format: [mp4; flv; ogg] " vformat


		       	youtube-dl --recode-video $vformat -o "~/$dir/%(title)s.%(ext)s" --embed-subs "$link";;

		*) 	echo "unexpected input"


	esac

{
read -p "would you like to rename current temp directory?" renamedir
mv $dir $renamedir
} > /dev/null 2>&1


exit
