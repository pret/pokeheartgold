ROOT=$1
MON=$2
FORM=$3

mkdir $MON
mv $ROOT/$ROOT.png $MON/$MON$FORM.png
mv $ROOT/${ROOT}_shiny.png $MON/$MON${FORM}_shiny.png
rm -rf $ROOT