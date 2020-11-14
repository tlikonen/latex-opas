nimi = opas

$(nimi).pdf: *.tex *.bib
	lualatex $(nimi)
	biber $(nimi)
	lualatex $(nimi)
	lualatex $(nimi)

clean:
	rm -f $(nimi).aux $(nimi).bbl $(nimi).bcf $(nimi).blg \
		$(nimi).fdb_latexmk $(nimi).fls $(nimi).log $(nimi).out \
		$(nimi).run.xml $(nimi).toc

clean-all: clean
	rm -f $(nimi).pdf

.PHONY: clean clean-all
