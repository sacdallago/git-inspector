#!/bin/bash

OUTPUTFOLDER=`pwd`/html

CURRENTFOLDER=`pwd`

cd repositories

for DIRECTORY in *; do
    if [ -d "${DIRECTORY}" ]; then
        echo "In ${DIRECTORY}"
        cd $DIRECTORY
        git pull
        cd ..
        python $CURRENTFOLDER/inspector/gitinspector/gitinspector.py $DIRECTORY -HTlrm -F html -f html,js,json,css,csv > $OUTPUTFOLDER/$DIRECTORY.html
    fi
done

cd $OUTPUTFOLDER
echo "" > index.html

for REPORT in *.html; do
    echo "<a href=\"$REPORT\">$REPORT</a><br>" >> index.html
done

exit 0