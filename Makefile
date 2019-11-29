all: privacy-ln.pdf

#.ONESHELL:
privacy-ln.pdf: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex -halt-on-error privacy-ln.tex; \
	rm -rf privacy-ln.aux privacy-ln.log privacy-ln.out privacy-ln.toc privacy-ln.lof privacy-ln.lot privacy-ln.bbl privacy-ln.blg privacy-ln-autopp.log privacy-ln-autopp.out privacy-ln-pics.pdf

bib: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex privacy-ln.tex; \
	bibtex privacy-ln.aux; \
	pdflatex privacy-ln.tex; \
	pdflatex privacy-ln.tex; \
	rm -rf privacy-ln.aux privacy-ln.log privacy-ln.out privacy-ln.toc privacy-ln.lof privacy-ln.lot privacy-ln.bbl privacy-ln.blg privacy-ln-autopp.out privacy-ln-pics.pdf

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
