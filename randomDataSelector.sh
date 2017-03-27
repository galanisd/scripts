#!/bin/bash

# This scripts randomly selects n=<NUMOFFILES> files from <INPUTDIR>
# and copies them to <OUTPUTDIR>.

INPUTDIR=$1
OUTPUTDIR=$2
NUMOFFILES=$3

printUsage(){
 echo "Usage: randomDataSelector.sh <INPUTDIR> <OUTPUTDIR> <NUMOFFILES>"
}

if [ "$#" -ne  "3" ]
then
	printUsage
	exit
else
	echo "-- --- -- --- --"
	# Remove OUTPUTDIR and all its contents
	if [ -d "$OUTPUTDIR" ]; then
        	echo "Remove OUTPUTDIR: $OUTPUTDIR"
	        rm -rf $OUTPUTDIR
	fi

	# Create OUTPUTDIR
	echo "Creating OUTPUTDIR: $OUTPUTDIR"
	mkdir $OUTPUTDIR

	# Selecting data.
	echo "Randomly selecting data from: $INPUTDIR" 
	find $INPUTDIR -type f | shuf -n $NUMOFFILES | xargs cp -t $OUTPUTDIR
	
	# ls
	echo "Contents of output dir: $OUTPUTDIR"
	ls -l $OUTPUTDIR
fi


