#!/bin/bash

export DESTINATION=/home/sigge/Dropbox/fsdata

# mkdir -p "$DESTINATION"

tar --xattrs-exclude='^\.git'  -cvf - . | (cd "$DESTINATION" ; tar xvf - )

