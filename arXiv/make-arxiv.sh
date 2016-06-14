#!/bin/bash

OUT=submission
FIGS=figures.txt

mkdir -p submission
mkdir -p check

latexpand ../LITES/LITES-paper.tex > $OUT/paper.tex
grep includegraphics $OUT/paper.tex | sort | uniq | sed -e 's/.*]{//' -e 's/}//' > $FIGS

for F in `cat $FIGS`
do 
    cp -v "$F" $OUT
done

cp -v ../bibliography/biblio.bib $OUT


sed -i.bak -e 's|../figures/.*/||' -e 's|../bibliography/||'  $OUT/paper.tex

rm $OUT/paper.tex.bak

cd $OUT
latexmk -pdf paper.tex
latexmk -pdf -c paper.tex

mv -v paper.pdf ../check
rm biblio.bib


