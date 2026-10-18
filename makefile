notify = \
	notify-send -a mrms-twado -i $(realpath ./img/$(1).jpg) $(1) "$(2)" || \
	notify-send -a mrms-twado -i $(realpath ./img/$(1).jpg) $(1) "Error in $(2)"

all: text book
text: */text.pdf
book: */cover.pdf */booklet.pdf
watch:
	while true; do $(MAKE) -q || ($(MAKE)); sleep 0.5; done

%/text.pdf: %/text.tex mrms.cls
	@(cd $(@D); pdflatex --interaction=batchmode text.tex && $(call notify,$(@D),"text"))

%/cover.pdf: %/text.pdf mrmsbook.cls
	@(cd $(@D); pdflatex --interaction=batchmode cover.tex && $(call notify,$(@D),"cover"))

%/booklet.pdf: %/text.pdf mrmsbook.cls
	@(cd $(@D); pdflatex --interaction=batchmode booklet.tex && $(call notify,$(@D),"booklet"))
