#!/bin/bash

echo $1
pyfile=$1
byfile=${pyfile/%py/bkpy}
cfile=${pyfile/%py/c}   
ofile=${pyfile/%py/o}
sofile=${pyfile/%py/so}

cython $pyfile
gcc -c $cfile `python-config --libs` `python-config --includes` -fPIC
gcc -o $sofile $ofile -fPIC  --shared `python-config --libs`

rm $cfile $ofile
mv $pyfile $byfile
