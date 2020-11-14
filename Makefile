opas.pdf: *.tex *.bib
	latexmk -lualatex opas
	@touch $@

clean:
	latexmk -c

clean-all:
	latexmk -C

.PHONY: clean clean-all
