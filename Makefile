versio = 0
nimi = kaytannollista_latexia
osat = $(nimi).tex asetukset.tex esim-latexmkrc.tex esipuhe.tex \
	merkintakieli.tex rakenne.tex tavutusvihjeet.tex \
	valmistautuminen.tex esim-tietokirjarakenne.tex kirjallisuutta.bib \
	kuva-list-mitat.tex
hakemistot = paketit ymparistot komennot mitat laskurit luokat
texmf = $(HOME)/texmf

$(nimi).pdf: versio.tex $(osat)
	@if which latexmk >/dev/null; then \
		latexmk -lualatex \
		-pdflualatex="lualatex -interaction=nonstopmode %O %S" \
		$(nimi); \
	else \
		lualatex $(nimi) && \
		biber $(nimi) && \
		lualatex $(nimi) && \
		lualatex $(nimi); \
	fi
	@touch $@

versio.tex:
	@printf '\\newcommand{\\versio}{%s}\n' \
		"$$(git describe --always --dirty || echo $(versio))" > $@

aakkostus:
	@{ echo "\hyphenation{"; grep -e '^  ' tavutusvihjeet.tex | sort -u; \
		echo "}"; } > tavutusvihjeet.tmp && \
		mv -f tavutusvihjeet.tmp tavutusvihjeet.tex

doc: $(nimi).pdf versio.tex $(osat) README.md
	mkdir -p doc/latex/$(nimi)
	for f in $^; do ln -fn "$$f" doc/latex/$(nimi)/"$$f"; done
	@touch $@

$(nimi): doc
	ln -sfn doc/latex/$(nimi)
	@touch $@

$(nimi).tds.zip: doc
	zip -r9 $@ $^

$(nimi).zip: $(nimi) $(nimi).tds.zip
	zip -r9 $@ $(nimi).tds.zip $(nimi)

ctan: $(nimi).zip

install: doc
	mkdir -p $(texmf)
	cp -r doc $(texmf)
	mktexlsr $(texmf)

uninstall:
	rm -r $(texmf)/doc/latex/$(nimi)
	mktexlsr $(texmf)

clean:
	rm -f $(addprefix $(nimi).,aux bbl bcf blg fdb_latexmk fls log out \
		run.xml toc xdv) texput.log $(nimi)*.zip $(nimi)
	rm -f $(addsuffix .idx,$(hakemistot))
	rm -f $(addsuffix .ind,$(hakemistot))
	rm -f $(addsuffix .ilg,$(hakemistot))
	rm -fr doc

distclean: clean
	rm -f $(nimi).pdf versio.tex

.PHONY: aakkostus clean distclean ctan install uninstall
