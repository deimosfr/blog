#/bin/sh

if [ ! -d .git ] ; then
	test -d ../.git && cd ..
	test -d ../../.git && cd ../..
fi

echo "Resizing logos"
./scripts/resize_logos.sh
echo "Generating thumbnails"
./scripts/generate_thumbnails.sh
