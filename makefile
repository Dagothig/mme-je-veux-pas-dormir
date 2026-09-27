%/text.tex: %/text.pdf
	@(cd $<; pdflatex ./text.tex; pdflatex ./text.tex)

.PHONY: text
text: $(wildcard */text.pdf)
