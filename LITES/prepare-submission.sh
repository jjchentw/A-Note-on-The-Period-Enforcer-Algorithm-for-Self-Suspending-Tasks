#!/bin/bash

OUT=chen-brandenburg-lites
CHECK=test-compile
FIGS=figures.txt

rm -rf $CHECK $OUT
mkdir -p $OUT
mkdir -p $CHECK

latexpand ../LITES/LITES-paper.tex > $OUT/paper.tex
cp -v ../LITES/{lites.cls,lites-logo.pdf,cc-by.pdf} $OUT
grep includegraphics $OUT/paper.tex | sort | uniq | sed -e 's/.*]{//' -e 's/}//' > $FIGS

for F in `cat $FIGS`
do 
    cp -v "$F" $OUT
done

cp -v ../bibliography/biblio.bib $OUT


sed -i.bak -e 's|../figures/.*/||' -e 's|../bibliography/||'  $OUT/paper.tex

rm $OUT/paper.tex.bak

cp -vpr $OUT/* $CHECK/

cd $CHECK
latexmk -pdf paper.tex
latexmk -pdf -c paper.tex
cd ..


cp $CHECK/paper.bbl $OUT/


tar vczf "${OUT}-sources.tgz" $OUT/

