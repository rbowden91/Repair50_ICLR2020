TEXFILES = $(wildcard *.tex) $(wildcard sections/*.tex) $(wildcard figures/*.tex)
BIBFILES = $(wildcard *.bib)

iclr.pdf: $(TEXFILES) $(BIBFILES)
	-mkdir -p build
	pdflatex -output-directory build iclr.tex
	-bibtex build/iclr
	pdflatex -output-directory build iclr.tex
	pdflatex -output-directory build iclr.tex
	cp build/iclr.pdf .

clean:
	/bin/rm -rf iclr.pdf build
