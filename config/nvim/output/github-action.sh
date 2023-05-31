#!/bin/sh
# Just a helper script for the github action
# that will allow me to change my nvim config
# and will push to a remote repo where I use
# this repos nvim.

OUTPUTDIR=output
mkdir $OUTPUTDIR
cp -R * $OUTPUTDIR/
rm -rf $OUTPUTDIR/.git $OUTPUTDIR/.github $OUTPUTDIR/github-action.sh