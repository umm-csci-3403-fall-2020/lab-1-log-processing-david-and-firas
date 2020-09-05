#!/usr/bin/env bash

#CONSTANTS
file_name=$1
specifier=$2
new_file=$3

#MAIN
cat "$specifier"_header.html "$file_name" "$specifier"_footer.html > "$new_file" 
