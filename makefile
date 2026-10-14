all: text book
text: */text.pdf
book: */cover.pdf */booklet.pdf
watch:
	while true; do $(MAKE) -q || ($(MAKE); notify-send "Mrms generated"); sleep 0.5; done

%/text.pdf: %/text.tex
	@(cd $(@D); pdflatex text.tex)

%/cover.pdf: %/text.pdf
	@(cd $(@D); pdflatex cover.tex)

%/booklet.pdf: %/text.pdf
	@(cd $(@D); pdflatex booklet.tex)
