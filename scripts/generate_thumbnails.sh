#!/bin/bash

for page in content/post/*.md ; do
#page="content/post/2016-01-20-how-we-speed-up-news-feed-and-user-wall-display-using-elasticsearch.md"
	# Generate thumbnail if defined but not present
	if [ $(ggrep -c "^thumbnailImage: " $page) == 1 ] ; then
		thumbnail_path="static$(gawk '/^thumbnailImage: /{print $2}' $page)"
		if [ ! -f "./$thumbnail_path" ] ; then
			image=$(echo $thumbnail_path | gsed -r 's~.*/(.+)~\1~')
			if [ -f "static/images/$image" ] ; then
				convert static/images/$image -resize 140x140\> $thumbnail_path
				continue
			else
				echo "$page: can't convert $image, because not found"
			fi
		fi
	fi

	# Ensure image is set in the page header
	if [ $(ggrep "^image: " $page | ggrep -c -v http) == 1 ] ; then
		image=$(gawk '/^image: /{print $2}' $page | gsed -r 's~.*/(.+)~\1~')
		thumbnail_path="/static/thumbnails/$image"
		if [ $(ggrep -c "^thumbnailImage: " $page) == 0 ] ; then
			gsed -ri "s~^(image:.*)~\1\nthumbnailImage: /thumbnails/$image\nthumbnailImagePosition: left~g" $page
		fi
		if [ ! -f ".$thumbnail_path" ] ; then
			convert static/images/$image -resize 140x140\> .$thumbnail_path
		fi
	fi
done
