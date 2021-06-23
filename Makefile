versio = 0
nimi = kaytannollista_latexia
lahde = $(nimi).tex asetukset.tex esim-latexmkrc.tex esipuhe.tex \
	merkintakieli.tex rakenne.tex tavutusvihjeet.tex \
	valmistautuminen.tex kirjallisuutta.bib \
	matematiikka.tex muuta.tex
julkaisutiedostot = $(nimi).pdf versio.tex $(lahde) README.md
julkaisukohteet = $(patsubst %,doc/latex/$(nimi)/%,$(julkaisutiedostot))
asiahakemistot = paketit ymparistot komennot mitat laskurit luokat
texmf = $(HOME)/texmf
latex = lualatex -interaction=nonstopmode
latexmk = latexmk -lualatex \
	-pdflualatex="lualatex -interaction=nonstopmode %O %S"

$(nimi).pdf: versio.tex versio.txt $(lahde)
	@if which latexmk >/dev/null; then \
		$(latexmk) $(nimi); \
		touch $@; \
	else \
		$(latex) $(nimi) && \
		biber $(nimi) && \
		$(latex) $(nimi) && \
		$(latex) $(nimi); \
	fi
	@echo Versio: $(shell cat versio.txt)

versio.txt: $(lahde)
	{ git describe --always --dirty 2>/dev/null || echo $(versio); } > $@

versio.tex: versio.txt
	echo '\\newcommand{\\versio}{$(shell cat versio.txt)}' > $@

aakkostus:
	{ echo "\hyphenation{"; grep -e '^  ' tavutusvihjeet.tex | sort -u; \
		echo "}"; } > tavutusvihjeet.tmp && \
		mv -f tavutusvihjeet.tmp tavutusvihjeet.tex

$(julkaisukohteet): doc/latex/$(nimi)/%: %
	@mkdir -p doc/latex/$(nimi)
	cp $< $@

$(nimi).tds.zip: $(julkaisukohteet)
	zip -r9 $@ doc/latex/$(nimi)

$(nimi).zip: $(nimi).tds.zip $(julkaisukohteet)
	zip -r9 $@ $(nimi).tds.zip
	cd doc/latex && zip -r9 ../../$@ $(nimi)

ctan: $(nimi).zip

install: $(julkaisukohteet)
	mkdir -p $(texmf)
	cp -r doc $(texmf)
	mktexlsr $(texmf)

uninstall:
	rm -fr $(texmf)/doc/latex/$(nimi)
	mktexlsr $(texmf)

clean:
	rm -f $(addprefix $(nimi).,aux bbl bcf blg fdb_latexmk fls log out \
		run.xml toc xdv)
	rm -f texput.log $(nimi).zip $(nimi).tds.zip
	rm -f $(addsuffix .idx,$(asiahakemistot))
	rm -f $(addsuffix .ind,$(asiahakemistot))
	rm -f $(addsuffix .ilg,$(asiahakemistot))
	rm -fr doc

distclean: clean
	rm -f $(nimi).pdf versio.tex versio.txt

.PHONY: aakkostus clean distclean ctan install uninstall
