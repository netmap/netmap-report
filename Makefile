REPORT=p
REFS=$(wildcard *.bib)
LATEX=pdflatex
BIBTEX=bibtex --min-crossrefs=1000

SRCS=$(wildcard *.tex *.pdf )
SPELLSRC=intro.tex
all: $(REPORT).pdf 

$(REPORT).pdf: $(SRCS) $(REFS)
	$(LATEX) $(REPORT)
	$(BIBTEX) $(REPORT)
	$(LATEX) $(REPORT)
	$(LATEX) $(REPORT)

spell:
	ispell $(SPELLSRC)

clean:
	rm -f *.out *.bak *.dvi *.aux *.log *.blg *.bbl $(REPORT).pdf
