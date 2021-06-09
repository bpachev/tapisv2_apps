#!/bin/bash
# 
# TX FEMA STORM RUNS - Generator script
# Carlos del-Castillo-Negrete - cdelcastillo21@gmail.com
# June 2021
#
# Main entrypoint called by pylauncher application to generate files for pylauncher.
# Note here we just call the python script generator.py, which does the heavy lifting. 

DEBUG=true

if [ "$DEBUG" = true ] ; then
  set -x
fi

ITER=$1
NP=$2

set -x
echo "STARTING GENERATOR"
pwd
date

ls -lat 

# Generate input file
python generator.py $ITER $NP 

if [ "$DEBUG" = true ] ; then
  set +x
fi

exit 0
