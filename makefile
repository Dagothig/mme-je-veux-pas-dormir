notify = \
	notify-send -a $(1) -i $(realpath ./img/$(1).jpg) "$(2)" || \
	notify-send -a $(1) -i $(realpath ./img/$(1).jpg) "Error in $(2)"

texts = $(subst .tex,.pdf, $(wildcard */text.tex))
covers = $(subst .tex,.pdf, $(wildcard */cover.tex))
booklets = $(subst .tex,.pdf, $(wildcard */booklet.tex))

all: text book
text: $(texts)
book: $(covers) $(booklets)

watch:
	@while true; do $(MAKE) -q || ($(MAKE)); sleep 0.5; done

watch-text:
	@while true; do $(MAKE) text -q || ($(MAKE) text); sleep 0.5; done

clean:
	@rm */*.pdf

%/text.pdf: %/text.tex mrms.cls
	@(cd $(@D); pdflatex --interaction=batchmode text.tex && $(call notify,$(@D),"text"))

%/cover.pdf: %/text.pdf mrmsbook.cls
	@(cd $(@D); pdflatex --interaction=batchmode cover.tex && $(call notify,$(@D),"cover"))

%/booklet.pdf: %/text.pdf mrmsbook.cls
	@(cd $(@D); pdflatex --interaction=batchmode booklet.tex && $(call notify,$(@D),"booklet"))
