#!/usr/bin/env bash
#CONSTANTS
directory_name=$1
here=$(pwd)
BIN="$(dirname "$(readlink -f $0)")"
#MAIN
cd "$directory_name" || exit
# cat looks at data, passes to awk to find 
cat ./*/failed_login_data.txt | awk '{print $4}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > username_dist_temp.txt
"$BIN"/wrap_contents.sh username_dist_temp.txt "$BIN"/../html_components/username_dist username_dist.html

#Cleaning Temp File
rm username_dist_temp.txt
