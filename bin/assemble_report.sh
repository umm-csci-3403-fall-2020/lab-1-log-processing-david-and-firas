#CONSTANTS
TARGET=$1
HERE=$(pwd)
BIN="$(dirname "$(readlink -f $0)")"

cd "$TARGET"

cat country_dist.html hours_dist.html username_dist.html > temp.html
"$BIN"/wrap_contents.sh temp.html "$BIN"/../html_components/summary_plots failed_login_summary.html

rm temp.html
