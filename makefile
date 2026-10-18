all: text book
text: */text.pdf
book: */cover.pdf */booklet.pdf
watch:
	while true; do $(MAKE) -q || ($(MAKE)); sleep 0.5; done

%/text.pdf: %/text.tex mrms.cls
	@(cd $(@D); pdflatex text.tex && notify-send -i ./img/$(@D).jpg $(@D) "Generated text" || notify-send -i ./img/$(@D).jpg $(@D) "Could not generate text")

%/cover.pdf: %/text.pdf mrmsbook.cls
	@(cd $(@D); pdflatex cover.tex && notify-send -i ./img/$(@D).jpg $(@D) "Generated cover" || notify-send -i ./img/$(@D).jpg $(@D) "Could not generate cover")

%/booklet.pdf: %/text.pdf mrmsbook.cls
	@(cd $(@D); pdflatex booklet.tex && notify-send -i ./img/$(@D).jpg $(@D) "Generated booklet" || notify-send -i ./img/$(@D).jpg $(@D) "Could not generate booklet")
