#!/bin/bash

#Repo must be added to slitaz first
REPO=http://pangolin.slitaz.org/downloads/backports/4.0/
LIST=packages.list

wget $REPO$LIST

for pkg in `cat $LIST`
do
    if [ $pkg != $LIST ]; then
        tazpkg -gi $pkg;
    fi
done
