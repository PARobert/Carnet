#! /bin/bash

lilypond-book --pdf --format=latex --output=LilyPondPrecompile Cérémonial.lytex
cd LilyPondPrecompile/
pdflatex Cérémonial.tex
mv ./Cérémonial.pdf ../Cérémonial.pdf

exit
