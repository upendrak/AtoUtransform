#!/bin/bash

set -x
set -e

while getopts ":hg:i:o:" opt; do
  case $opt in
    i)
    input=$OPTARG # Reference genome file
     ;;
    o)
    output=$OPTARG # Input folder
     ;;
    h)
    usage
     exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

fneighbor -datafile $input -outfile $output
new=$(basename $input ".dat")
Rscript /usr/bin/plotting.r --input_file $new."treefile"
