# Configuration
CSL=csl/american-chemical-society.csl
BIBFILES=sample.bib # or BIBFILES=$(shell ls *.bib)

PAPER_MARKDOWN=$(shell ls *.md)
PAPER_PDF=$(PAPER_MARKDOWN:.md=.pdf)
PAPER_DOCX=$(PAPER_MARKDOWN:.md=.docx)

pdf: $(PAPER_PDF)
word: $(PAPER_DOCX)

%.pdf: %.md templates/default.tex $(BIBFILES)
	pandoc \
		-s \
		-o $@ \
		--to=latex \
		--filter pandoc-crossref \
		--template=templates/default.tex \
		--citeproc \
		--csl=$(CSL) \
		$<

aip.pdf: aip.md templates/aip.tex $(BIBFILES)
	pandoc \
		-s \
		-o $@ \
		--to=latex \
		--filter pandoc-crossref \
		--template=templates/aip.tex \
		--citeproc \
		--csl=$(CSL) \
		$<

%.docx: %.md $(BIBFILES)
	pandoc \
		-o $@ \
		--quiet \
		-f markdown \
		--from=markdown+tex_math_single_backslash+tex_math_dollars+raw_tex \
		--reference-doc=templates/default.docx \
		--filter pandoc-crossref \
		--citeproc \
		--csl=$(CSL) \
		--to=docx \
		--mathjax \
		-t docx \
		$<

%.tex: %.md
	pandoc \
		-s \
		-o $@ \
		-t latex \
		--citeproc \
		--csl=$(CSL) \
		--template=templates/default.tex \
		--filter pandoc-crossref \
		$<

aip.tex: aip.md
	pandoc \
		-s \
		-o $@ \
		-t latex \
		--citeproc \
		--csl=$(CSL) \
		--template=templates/aip.tex \
		--filter pandoc-crossref \
		$<

clean:
	rm -f *.pdf $(PAPER_DOCX) *.log *.out *.aux

