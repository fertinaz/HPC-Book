#!/bin/sh

project=HPC-Book

src=$project.tex
aux=$project.aux
out=$project.pdf

pdflatex $src

bibtex   $aux

pdflatex $src
pdflatex $src

open     $out
