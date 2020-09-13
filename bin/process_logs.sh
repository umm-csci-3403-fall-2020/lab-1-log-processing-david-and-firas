#CONSTANTS
HERE=$(pwd)
BIN=$(dirname $0)

mkdir scratch
for i in $*
do

  FILENAME=$(basename "$i" .tgz)

  mkdir scratch/"$FILENAME"
  tar -xvzf $i -C ./scratch/$FILENAME
  "$BIN"/process_client_logs.sh scratch/"$FILENAME" 
done
"$BIN"/create_username_dist.sh scratch/
"$BIN"/create_hours_dist.sh scratch/
"$BIN"/create_country_dist.sh scratch/
"$BIN"/assemble_report.sh scratch/
mv scratch/failed_login_summary.html failed_login_summary.html
rm -r scratch
