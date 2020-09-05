#!/usr/bin/env bash

#CONSTANTS
directory_name=$1
here=$(pwd)

#MAIN
cd "$directory_name" || exit

cat ./failed_login_data.txt | sort | awk '{print $4}' | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | username_dist_temp.html

cd "$here" || exit

./bin/wrap_contents.sh 
