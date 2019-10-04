#!/bin/bash

echo "Enter the name of the post:"
read post_name

echo "Enter the logo image name (size 300x300 max)":
read logo_image

current_date_minus=$(date "+%Y-%m-%d")
current_date_slash=$(date "+%Y\/%m\/%d")
post_name_minus=$(echo ${post_name} | gsed 's/ /-/g' | tr '[:upper:]' '[:lower:]')
filename="${current_date_minus}-${post_name_minus}.md"

cp archetypes/default.md content/post/$filename
gsed -i "s/DATE_MINUS/${current_date_minus}/g" content/post/$filename
gsed -i "s/TITLE_MINUS/${post_name_minus}/g" content/post/$filename
gsed -i "s/TITLE_NORMAL/${post_name}/g" content/post/$filename
gsed -i "s/DATE_SLASH/${current_date_slash}/g" content/post/$filename
gsed -i "s/LOGO_IMAGE/${logo_image}/g" content/post/$filename
