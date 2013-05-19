REPORT=p

LATEX=pdflatex
BIBTEX=bibtex --min-crossrefs=1000

REFS=$(wildcard src/*.bib)
SRCS=$(wildcard src/*.tex src/figures/*.pdf)
SPELLSRC=src/intro.tex
all: pdf/$(REPORT).pdf

tmp/:
	mkdir -p tmp/

pdf/:
	mkdir -p pdf/

pdf/$(REPORT).pdf: $(SRCS) $(REFS) tmp/ pdf/
	cd src && $(LATEX) -interaction=nonstopmode -output-directory=../tmp $(REPORT)
	cd tmp && $(BIBTEX) tmp/$(REPORT).aux
	cd src && $(LATEX) -interaction=nonstopmode -output-directory=../tmp $(REPORT)
	cd src && $(LATEX) -interaction=nonstopmode -output-directory=../tmp $(REPORT)
	mv tmp/p.pdf pdf/

spell:
	ispell $(SPELLSRC)

clean:
	rm -f *.out *.bak *.dvi *.aux *.log *.blg *.bbl $(REPORT).pdf
