#!/bin/sh

# base=/Users/fatih.ertinaz@ibm.com/Reports

# bib=references.bib

project=HPC-Book

src=$project.tex
aux=$project.aux
out=$project.pdf

pdflatex $src

bibtex   $aux

pdflatex $src
pdflatex $src

open     $out
