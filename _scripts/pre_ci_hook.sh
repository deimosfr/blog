#/bin/sh

echo "Resizing logos"
./_scripts/resize_logos.sh
echo "Generating thumbnails"
./_scripts/generate_thumbnails.sh
