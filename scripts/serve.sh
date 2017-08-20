#!/bin/sh
echo "Resizing logos"
./scripts/resize_logos.sh
echo "Generating thumbnails"
./scripts/generate_thumbnails.sh
hugo server --buildDrafts --ignoreCache=true
