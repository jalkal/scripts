#!/bin/sh

##############################################
# Author: Jose Alcalde
# Descriptrion: script that given a file name pattern is able find those files with this pattern
# and do whatever for each file
###############################################

multiFile() {
for FILE in $(ls $WORK_DIR/$PATTERN )
		do
		    singleFile $FILE
		done
}

singleFile(){
    echo "executing for $1"
}

usage(){
    echo "usage processXml.sh --file-pattern=<pattern> --mode=<single|multiple>"
    echo "                    --input-file=<inputFile>"
    exit 1
}
if [ $# = 0 ]; then
    usage
fi

WORK_DIR="files"

for i in "$@"
do
case $i in
    --input-file=*)
    INPUT_FILE="${i#*=}"
    shift # past argument=value
    ;;
    --mode=*)
    MODE="${i#*=}"
    shift # past argument=value
    ;;
    --file-pattern=*)
    PATTERN="${i#*=}"
    shift # past argument=value
    ;;
esac
done

#echo "INPUT_FILE:$INPUT_FILE"
#echo "MODE:$MODE"
#echo "PATTERN:$PATTERN"

if [[ $INPUT_FILE != "" ]]; then
    singleFile $INPUT_FILE
elif [[ $PATTERN != "" ]]; then
    if [[ $MODE = "multiple" ]]; then
        multiFile
    elif [[ $MODE = "single" ]]; then
        LAST_FILE=$(ls -lt $WORK_DIR/$PATTERN | awk '/.*/ { f=$NF };END{ print f }')
        singleFile $LAST_FILE
    else
        usage
    fi
else
    usage
fi
