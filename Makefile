nimi = opas
kaantaja = lualatex

$(nimi).pdf: *.tex *.bib
	$(kaantaja) $(nimi)
	biber $(nimi)
	$(kaantaja) $(nimi)
	$(kaantaja) $(nimi)

clean:
	rm -f $(nimi).aux $(nimi).bbl $(nimi).bcf $(nimi).blg \
		$(nimi).fdb_latexmk $(nimi).fls $(nimi).log $(nimi).out \
		$(nimi).run.xml $(nimi).toc

distclean: clean
	rm -f $(nimi).pdf

.PHONY: clean distclean
