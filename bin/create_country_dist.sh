#!/usr/bin/env bash
#CONSTANTS
directory_name=$1
here=$(pwd)
BIN="$(dirname "$(readlink -f $0)")"
#MAIN
cd "$directory_name" || exit

# next line looks at data, passes to awk to find ip's, sorts those ips, adds country code, counts unique entries, prints out formatted country code data
cat ./*/failed_login_data.txt | awk '{print $5}'| sort | join - "$BIN"/../etc/country_IP_map.txt | awk '{print $2};' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > country_dist_temp.txt

"$BIN"/wrap_contents.sh country_dist_temp.txt "$BIN"/../html_components/country_dist country_dist.html

#Cleaning Temp File
rm country_dist_temp.txt
