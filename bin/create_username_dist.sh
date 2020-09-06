#!/usr/bin/env bash
#CONSTANTS
directory_name=$1
here=$(pwd)
#MAIN
cd "$directory_name" || exit
cat ./*/failed_login_data.txt | awk '{print $4}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > username_dist_temp.txt

"$here"/bin/wrap_contents.sh username_dist_temp.txt "$here"/html_components/username_dist username_dist.html
