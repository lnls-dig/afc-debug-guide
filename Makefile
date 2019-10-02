# Makefile for Latex work

TEXFILE = afc-debug-guide.tex
DIAGRAM = $(wildcard *.dia)

.PHONY: clean view

$(TEXFILE:.tex=.pdf): $(TEXFILE) $(DIAGRAM:.dia=.pdf)
	pdflatex $(TEXFILE)
	pdflatex $(TEXFILE)

%.pdf: %.eps
	epstopdf $<

%.eps: %.dia
	dia -e $@ $<

view: $(TEXFILE:.tex=.pdf)
	evince $(TEXFILE:.tex=.pdf)

clean:
	rm -f \
	$(TEXFILE:.tex=.aux) \
	$(TEXFILE:.tex=.log) \
	$(TEXFILE:.tex=.out) \
	$(TEXFILE:.tex=.toc) \
	$(TEXFILE:.tex=.pdf) \
	$(DIAGRAM:.dia=.pdf) \
	$(DIAGRAM:.dia=.eps)

