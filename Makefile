nimi = kaytannollista_latexia
latex = lualatex -interaction=nonstopmode

$(nimi).pdf: *.tex *.bib
	$(latex) $(nimi)
	biber $(nimi)
	$(latex) $(nimi)
	$(latex) $(nimi)

clean:
	rm -f $(nimi).aux $(nimi).bbl $(nimi).bcf $(nimi).blg \
		$(nimi).fdb_latexmk $(nimi).fls $(nimi).log $(nimi).out \
		$(nimi).run.xml $(nimi).toc *.idx *.ind *.ilg

distclean: clean
	rm -f $(nimi).pdf

.PHONY: clean distclean
