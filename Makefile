versio = 0
nimi = kaytannollista_latexia
osat = kaytannollista_latexia.tex asetukset.tex esim-latexmkrc.tex \
	esipuhe.tex merkintakieli.tex rakenne.tex tavutusvihjeet.tex \
	valmistautuminen.tex kirjallisuutta.bib
hakemistot = paketit ymparistot komennot mitat laskurit luokat
tavutus = tavutusvihjeet

$(nimi).pdf: versio.tex $(osat)
	latexmk -lualatex \
		-pdflualatex="lualatex -interaction=nonstopmode %O %S" \
		$(nimi)
	@touch $@

versio.tex:
	{ git describe || echo $(versio); } | tee $@

aakkostus:
	@{ echo "\hyphenation{"; grep -e '^  ' $(tavutus).tex | sort -u; \
		echo "}"; } > $(tavutus).tmp && \
		mv -f $(tavutus).tmp $(tavutus).tex

clean:
	rm -f $(addprefix $(nimi).,aux bbl bcf blg fdb_latexmk fls log out \
		run.xml toc xdv) texput.log versio.tex
	rm -f $(addsuffix .idx,$(hakemistot))
	rm -f $(addsuffix .ind,$(hakemistot))
	rm -f $(addsuffix .ilg,$(hakemistot))

distclean: clean
	rm -f $(nimi).pdf

.PHONY: aakkostus clean distclean
