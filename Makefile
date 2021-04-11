nimi = kaytannollista_latexia
hakemistot = paketit ymparistot komennot mitat laskurit luokat
tavutus = tavutusvihjeet

$(nimi).pdf: *.tex *.bib
	latexmk -lualatex \
		-pdflualatex="lualatex -interaction=nonstopmode %O %S" \
		$(nimi)
	@touch $@

aakkostus:
	@{ echo "\hyphenation{"; grep -e '^  ' $(tavutus).tex | sort -u; \
		echo "}"; } > $(tavutus).tmp && \
		mv -f $(tavutus).tmp $(tavutus).tex

clean:
	rm -f $(addprefix $(nimi).,aux bbl bcf blg fdb_latexmk fls log out \
		run.xml toc xdv) texput.log
	rm -f $(addsuffix .idx,$(hakemistot))
	rm -f $(addsuffix .ind,$(hakemistot))
	rm -f $(addsuffix .ilg,$(hakemistot))

distclean: clean
	rm -f $(nimi).pdf

.PHONY: aakkostus clean distclean
