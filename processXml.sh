#!/bin/sh

##############################################
# Author: Jose Alcalde
# Descriptrion: script that give a file name pattern is able find those files with this pattern
# and do whatever for each file
###############################################

WORK_DIR="files"

if [ $# = 0 ];
then
    echo "usage" $0 "--file-pattern=<pattern> --mode=<single|multipe>"
    exit 1
fi

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

echo $INPUT_FILE
echo $MODE
echo $PATTERN