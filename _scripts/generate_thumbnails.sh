#!/bin/bash

for page in content/post/*.md ; do
	# Ensure image is set in the page header
	if [ $(grep "^image: " $page | grep -c -v http) != 1 ] ; then
		continue
	fi
	image=$(awk '/^image: /{print $2}' $page | sed -r 's~.*/(.*)~\1~')
	thumbnails_path="/static/thumbnails/$image"
	if [ $(grep -c "^thumbnailImage: " $page) == 0 ] ; then
		sed -ri "s~^(image:.*)~\1\nthumbnailImage: /thumbnails/$image\nthumbnailImagePosition: left~g" $page
	fi
	if [ ! -f ".$thumbnails_path" ] ; then
		convert static/images/$image -resize 140x140\> .$thumbnails_path
	fi
done
