#!/bin/bash

mkdir -p dst/ eps/ flat/ pnm/

for f in orig/*.png; do
    name=`basename $f`
    name_no_ext=`basename $f .png`
    convert -flatten orig/$name flat/$name
    pngtopnm < flat/$name > pnm/$name_no_ext.pnm
    potrace < pnm/$name_no_ext.pnm > eps/$name_no_ext.eps
    convert -size 320x320  eps/$name_no_ext.eps dst/$name_no_ext.png
done
