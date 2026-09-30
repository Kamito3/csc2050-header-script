#!/usr/bin/env bash
if [ $# -ne 1 ]; then
	echo "Usage: $0 <file.c>"
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "$1 no such file"
	exit 1
fi

if [ "${1##*.}" != "c" ]; then
	echo "$1 not a .c file"
	exit 1
fi

file="$1"
name=$( ls -l "$1" | awk '{ print $3 }' )
date=$( ls -l "$1" | awk '{ print $7, $8, $9 }' )

tmp="$1.tmp"
echo "/**" > "$tmp"
echo " * File Name: $file" >> "$tmp"
echo " * Owner: $name" >> "$tmp"
echo " * Last Modified On: $date" >> "$tmp"
echo " */" >> "$tmp"
cat "$1" >> "$tmp"
mv "$tmp" "$1"
