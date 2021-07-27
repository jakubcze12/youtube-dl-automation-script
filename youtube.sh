#!/bin/bash

#youtube-dl audiomation script 

#echo -e -n "Welcome. This program aims to simplify youtube-dl. your youtube-dl version is: "; youtube-dl --version
#echo "Examples of possible inputs will be shown in square brackets"
read -p "Enter link (or playlist ID): " link echo 
read -p "Do you want to download audio or video? [a/v] " av;
echo -e "These are the contents of you home directory:"
echo 
ls ~/; echo 
read -p "Download destination:(In your ~ home directory)] : " dir

	#In the future, embeding subtitles required
	#Fix exceptions

	case $av in

		a)	echo 
			echo "1) mp3 (default)"
			echo "2) aac"
			echo "3) flac"
			echo "4) m4a"
			echo 
			read -p "Choose audio format: [mp3; wav] " aformat
			echo ""

			youtube-dl --embed-thumbnail --extract-audio --audio-format $aformat -o "~/$dir/%(title)s.%(ext)s" "$link";;

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

exit
