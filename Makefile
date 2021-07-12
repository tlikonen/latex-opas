versio = 0 (2021)
nimi = kaytannollista_latexia
lahde = $(nimi).tex asetukset.tex esipuhe.tex \
	merkintakieli.tex rakenne.tex tavutusvihjeet.tex \
	valmistautuminen.tex kirjallisuutta.bib \
	matematiikka.tex muuta.tex
tds = doc/finnish/latex
julkaisutiedostot = $(nimi).pdf versio.tex $(lahde) README.md
julkaisukohteet = $(patsubst %,$(tds)/$(nimi)/%,$(julkaisutiedostot))
asiahakemistot = paketit ymparistot komennot mitat laskurit luokat
texmf = $(HOME)/texmf
latex = lualatex -interaction=nonstopmode
latexmk = latexmk -lualatex \
	-pdflualatex="lualatex -interaction=nonstopmode %O %S"

$(nimi).pdf: versio.tex versio.txt $(lahde)
	@if which latexmk >/dev/null; \
		then $(latexmk) $(nimi) && touch $@; \
		else $(latex) $(nimi) && biber $(nimi) && \
			$(latex) $(nimi) && $(latex) $(nimi); \
		fi
	@echo "Versio: $(shell cat versio.txt)"

versio.txt: $(lahde)
	if v=$$(git describe --always --dirty) && \
		pvm=$$(git log -1 --format=format:%at); \
		then echo "$$v ($$(date +%Y -d@$$pvm))" > $@; \
		else echo "$(versio)" > $@; \
		fi

versio.tex: versio.txt
	echo '\\newcommand{\\versio}{$(shell cat $<)}' > $@

tavutusvihjeet.txt:
	sort -u $@ > $@.tmp && mv $@.tmp $@
	sed -e s/-//g $@ | uniq -cdi

tavutusvihjeet.tex: tavutusvihjeet.txt
	{ echo '\\hyphenation{'; cat $<; echo '}'; } > $@

$(julkaisukohteet): $(tds)/$(nimi)/%: %
	@mkdir -p $(tds)/$(nimi)
	cp $< $@

$(tds)/$(nimi).tds.zip: $(julkaisukohteet)
	zip -r9 $@ $(tds)/$(nimi)

$(nimi).zip: $(tds)/$(nimi).tds.zip $(julkaisukohteet)
	cd $(tds) && zip -r9 $@ $(nimi).tds.zip $(nimi)
	mv $(tds)/$@ .

ctan: $(nimi).zip

install: $(julkaisukohteet)
	mkdir -p $(texmf)/$(tds)
	cp -r $(tds)/$(nimi) $(texmf)/$(tds)
	mktexlsr $(texmf)

uninstall:
	rm -fr $(texmf)/$(tds)/$(nimi)
	mktexlsr $(texmf)

clean:
	rm -f $(addprefix $(nimi).,aux bbl bcf blg fdb_latexmk fls lo* out \
		run.xml toc xdv)
	rm -f texput.log $(nimi).zip
	rm -f $(addsuffix .idx,$(asiahakemistot))
	rm -f $(addsuffix .ind,$(asiahakemistot))
	rm -f $(addsuffix .ilg,$(asiahakemistot))
	rm -fr doc

distclean: clean
	rm -f $(nimi).pdf versio.tex versio.txt tavutusvihjeet.tex

.PHONY: clean distclean ctan install uninstall
