#!/bin/bash

for page in content/post/*.md ; do
#page="content/post/2016-01-20-how-we-speed-up-news-feed-and-user-wall-display-using-elasticsearch.md"
	# Generate thumbnail if defined but not present
	if [ $(grep -c "^thumbnailImage: " $page) == 1 ] ; then
		thumbnail_path="static$(awk '/^thumbnailImage: /{print $2}' $page)"
		if [ ! -f "./$thumbnail_path" ] ; then
			image=$(echo $thumbnail_path | sed -r 's~.*/(.+)~\1~')
			if [ -f "static/images/$image" ] ; then
				convert static/images/$image -resize 140x140\> $thumbnail_path
				continue
			else
				echo "$page: can't convert $image, because not found"
			fi
		fi
	fi

	# Ensure image is set in the page header
	if [ $(grep "^image: " $page | grep -c -v http) == 1 ] ; then
		image=$(awk '/^image: /{print $2}' $page | sed -r 's~.*/(.+)~\1~')
		thumbnail_path="/static/thumbnails/$image"
		if [ $(grep -c "^thumbnailImage: " $page) == 0 ] ; then
			sed -ri "s~^(image:.*)~\1\nthumbnailImage: /thumbnails/$image\nthumbnailImagePosition: left~g" $page
		fi
		if [ ! -f ".$thumbnail_path" ] ; then
			convert static/images/$image -resize 140x140\> .$thumbnail_path
		fi
	fi
done
