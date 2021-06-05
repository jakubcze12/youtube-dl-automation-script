#!/bin/sh

#youtube-dl audiomation script 
#version alpha 0.01


echo ""; echo -n "Welcome to jacob's youtube-dl automation script. your youtube-dl version is: "; youtube-dl --version
echo ""

read -p "Enter link (or playlist ID): " link
read -p "Do you want to download audio or video? [a/v]" av


	case $av in

		a  ) youtube-dl --embed-thumbnail --extract-audio --audio-format mp3 $link;;
		v  ) youtube-dl --embed-thumbnail $link;;

	esac

