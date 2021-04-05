nimi = kaytannollista_latexia
hakemistot = paketit ymparistot komennot mitat
latex = lualatex -interaction=nonstopmode

$(nimi).pdf: *.tex *.bib
	$(latex) $(nimi)
	biber $(nimi)
	$(latex) $(nimi)
	$(latex) $(nimi)

clean:
	rm -f $(addprefix $(nimi).,aux bbl bcf blg fdb_latexmk fls log out \
		run.xml toc) texput.log
	rm -f $(addsuffix .idx,$(hakemistot)) \
		$(addsuffix .ind,$(hakemistot)) \
		$(addsuffix .ilg,$(hakemistot))

distclean: clean
	rm -f $(nimi).pdf

.PHONY: clean distclean
