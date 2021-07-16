#!/bin/bash

export DESTINATION=/home/sigge/Dropbox/fsdata

# mkdir -p "$DESTINATION"

tar --exclude='\.git'  -cvf - . | (cd "$DESTINATION" ; tar xvf - )

