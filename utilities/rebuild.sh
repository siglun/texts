#!/bin/sh

#
# Shell script for rebuilding the entire blog from source
# Author: Sigfrid Lundberg (siggelundberg@gmail.com)
# Last modified $Date$ by $Author$
# $Id$

#
# We remove all subject menus
#
# rm -rf subjects

#
# The blog entrys lives in entries hierarchy. We merge in them in the
# global feed
#
utilities/feeder \
    --directory entries/ \
    $* \
    --atomfile all_files.xml > temp_files.xml

#
# Create index files in all year and subject directories
#
xsltproc utilities/generate_menus.xsl temp_files.xml 

#
# Create a global navigation file, which is included everywhere
#
xsltproc utilities/select_subjects.xsl temp_files.xml > subjects.xml

#
# We sort all blog entries and other contents, most recent first.
#
xsltproc utilities/sort.xsl temp_files.xml > files_sorted.xml

#
# Generate the news html for the home page
#
xsltproc utilities/generate_news.xsl files_sorted.xml > news.xml

#
# Creates the atom feed
#
xsltproc utilities/filter.xsl files_sorted.xml > atom_feed.atom

# the feed files.atom is now defunct.

#
# cleaning up
#
#rm temp_files.xml
cp subjects.xml navigation.html

#
# $Log$
# Revision 1.5  2009/08/14 15:20:33  sigfrid
# no comments
#
#
