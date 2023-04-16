#!/bin/sh
OUTPUTDIR=output
mkdir $OUTPUTDIR
cp -R * $OUTPUTDIR/
rm -rf $OUTPUTDIR/.git $OUTPUTDIR/.github