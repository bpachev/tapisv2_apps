#!/bin/bash

dirname=$1

old_dir=$(pwd)
if [ ! -e $dirname ]; then
    echo "Directory $dirname does not exist"
    exit 0
fi
cp $FIGUREGEN_INPUT_FILES $dirname    
cd $dirname
singularity exec $FIGUREGEN_CONTAINER figuregen -I $FIGUREGEN_CONFIG_FILE
for fname in $FIGUREGEN_INPUT_FILES
do
    fname=$(basename $fname)
    # Use the fully qualified path name just to be sure we don't remove the wrong file    
    [ -f $dirname/$fname ] && rm $dirname/$fname
done

cd $old_dir
