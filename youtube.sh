#!/bin/sh

# 1. Introduction

echo ""
echo -n "Welcome to jacob's youtube-dl automation script. your youtube-dl version is: "; youtube-dl --version
echo ""

read -p "Enter link: " link
read -p "Do you want to download audio or video? [a/v] " audio
echo -n "Is it a playlist? [yes/no] "; read playlist 
#echo -n "Enter directory in ~ : "; read dir

if [$playlist -eq "no"]; then

	case $audio in
	
		v ) youtube-dl -t -w $link;;
		a ) youtube-dl -t -w $link --extract-audio;;

	esac

elif [$playlist -eq $yes]; then

	case $audio in
	
		v ) youtube-dl -t -w --yes-playlist $link;;
		a ) youtube-dl -t -w --yes-playlist $link --extract-audio;;

	esac

else

	echo "Unexpected error, select valid letter [y/n] "; exit



fi