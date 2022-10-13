#!/bin/bash
# For all the files in a folder, show their properties
for f in $1/*; do
file "$f"
done
