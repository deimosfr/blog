#!/bin/bash

w_max=600
h_max=300

for i in static/images/logo_* ; do
	if [ $(identify -format '%w' $i) -gt $w_max ] || [ $(identify -format '%h' $i) -gt $h_max ] ; then
		echo "Converting $i"
		convert $i -resize 600x300\> ${i}_tmp ; mv ${i}_tmp $i
	fi
done
