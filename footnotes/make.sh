#!/bin/sh

xsltproc atom_anchor_id.xsl  footnotes.atom > temp.atom
xsltproc atom_entry_to_php_page.xsl temp.atom > index.php
