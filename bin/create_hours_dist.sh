#!/usr/bin/env bash
#CONSTANTS
directory_name=$1
here=$(pwd)
BIN="$(dirname "$(readlink -f $0)")"
#MAIN
cd "$directory_name" || exit
cat ./*/failed_login_data.txt | awk '{print $3}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > hours_dist_temp.txt

"$BIN"/wrap_contents.sh hours_dist_temp.txt "$BIN"/../html_components/hours_dist hours_dist.html

#Cleaning Temp files
rm hours_dist_temp.txt
