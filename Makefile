versio = 2021.12
nimi = kaytannollista-latexia
lahde = $(nimi).tex luku-asetukset.tex luku-esipuhe.tex \
	luku-merkintakieli.tex luku-rakenne.tex tavutusvihjeet.tex \
	luku-valmistautuminen.tex kirjallisuutta.bib luku-erikoiset.tex
tds = doc/finnish/latex
julkaisutiedostot = $(nimi).pdf versio.tex $(lahde) README.md
julkaisukohteet = $(patsubst %,$(nimi)/%,$(julkaisutiedostot))
asiahakemistot = paketit ymparistot komennot mitat laskurit dokumenttiluokat
texmf = $(HOME)/texmf
lualatex = lualatex -interaction=nonstopmode -shell-escape
latexmk = latexmk -lualatex -lualatex="$(lualatex) %O %S"

$(nimi).pdf: versio.tex $(lahde)
	@if which latexmk >/dev/null; \
		then $(latexmk) $(nimi) && touch $@; \
		else $(lualatex) $(nimi) && biber $(nimi) && \
			$(lualatex) $(nimi) && $(lualatex) $(nimi); \
		fi
	@sed -En -e 's/^ *(\\label\{[^}]+\}).*$$/\1/p' $(lahde) | \
		sort | uniq -cd

versio.tex: $(lahde)
	v=$$(git describe --always --dirty) || v="$(versio)"; \
		echo "\\\\newcommand{\\\\versio}{$$v}" > $@

tavutusvihjeet.txt:
	sort -u $@ > $@.tmp && mv $@.tmp $@
	sed -e s/-//g $@ | uniq -cdi

tavutusvihjeet.tex: tavutusvihjeet.txt
	{ echo '\\hyphenation{'; cat $<; echo '}'; } > $@

$(julkaisukohteet): $(nimi)/%: %
	@mkdir -p $(nimi)
	cp $< $@

$(nimi).zip: $(julkaisukohteet)
	zip -r9 $@ $(nimi)

ctan: $(nimi).zip

install: $(julkaisukohteet)
	mkdir -p $(texmf)/$(tds)
	cp -r $(nimi) $(texmf)/$(tds)
	mktexlsr $(texmf)

uninstall:
	rm -fr $(texmf)/$(tds)/$(nimi)
	mktexlsr $(texmf)

clean:
	rm -f $(addprefix $(nimi).,aux bbl bcf blg fdb_latexmk fls lo* out \
		run.xml toc idx xdv zip) texput.log
	rm -f $(addprefix $(nimi)-*.,idx ilg ind)
	rm -fr $(nimi)

distclean: clean
	rm -f $(nimi).pdf versio.tex tavutusvihjeet.tex TAGS

TAGS: $(lahde)
	etags $(lahde)

.PHONY: clean distclean ctan install uninstall
