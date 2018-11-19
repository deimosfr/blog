#!/bin/bash

echo "Enter the name of the post:"
read post_name

current_date_minus=$(date "+%Y-%m-%d")
current_date_slash=$(date "+%Y\/%m\/%d")
post_name_minus=$(echo ${post_name} | sed 's/ /-/g' | tr '[:upper:]' '[:lower:]')
filename="${current_date_minus}-${post_name_minus}.md"

cp archetypes/default.md content/post/$filename
sed -i "s/DATE_MINUS/${current_date_minus}/g" content/post/$filename
sed -i "s/TITLE_MINUS/${post_name_minus}/g" content/post/$filename
sed -i "s/TITLE_NORMAL/${post_name}/g" content/post/$filename
sed -i "s/DATE_SLASH/${current_date_slash}/g" content/post/$filename
