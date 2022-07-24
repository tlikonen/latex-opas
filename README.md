Käytännöllistä Latexia
======================

**Latex-ladontajärjestelmän opas**

English summary: *Käytännöllistä Latexia* is a Finnish practical manual
for [Latex](https://en.wikipedia.org/wiki/LaTeX) typesetting system. The
manual covers most of the topics that a typical document author needs.
So it can be useful guide for beginners as well as reference manual for
advanced users.


Esittely
--------

*Käytännöllistä Latexia* on nykyaikainen suomenkielinen opas
[Latex](https://fi.wikipedia.org/wiki/LaTeX)-ladontajärjestelmän
käyttäjälle. Se auttaa alkuun pääsyssä ja esittelee merkintäkielen
perusasiat. Opas sisältää käytännönläheiset ohjeet esimerkiksi
dokumentin sivu-, fontti- ja kieliasetusten tekemiseen. Se sisältää
teknisiä ohjeita ja typografisia vinkkejä tavallisimpiin
tekstidokumentin kirjoittamisen tarpeisiin. Oppaan avulla pitäisi
pärjätä niin hyvin, että laajennuspakettien ohjeita tarvitsee lukea vain
harvoin.

Edellisessä kappaleessa mainostettu nykyaikaisuus tarkoittaa esimerkiksi
sitä, että tässä oppaassa keskitytään Open Type -fontteihin,
Unicode-merkistöön ja PDF-tiedostoihin. Latexin vanha fonttitekniikka
sivuutetaan, eikä kummallisten fonttitiedostojen ja merkistörajoitusten
kanssa kamppailla. Oppaan ohjeet siis sopivat nykyaikaiselle tietokoneen
käyttäjälle.


Saatavuus
---------

Oppaan PDF-tiedosto ja lähdetiedostot ovat saatavilla
[CTAN][CTAN]-arkistossa. PDF-tiedosto on myös Githubissa
[julkaisusivulla](https://github.com/tlikonen/latex-opas/releases), ja
lähdetiedostot ovat versionhallintajärjestelmässä [Githubissa][Github].

[CTAN]:   https://ctan.org/pkg/kaytannollista-latexia
[Github]: https://github.com/tlikonen/latex-opas


Versionumerointi
----------------

Versionumerot tulevat julkaisuajan vuosiluvusta sekä mahdollisesti
kuukaudesta ja päivästä. Vuoden ensimmäinen tai ainoa julkaisu saa
versionumeronsa pelkästä vuosiluvusta, esimerkiksi versio ”2022”. Jos
samana vuonna julkaistaan oppaasta uusi versio, lisätään versionumeroon
kyseisen kuukauden numero, esimerkiksi versio ”2022.4” (huhtikuu 2022).
Saman kuun aikana toinen julkaisu saa versionumeroonsa vielä päivänkin
numeron, esimerkiksi ”2022.4.15” (15. huhtikuuta 2022).


Tekijänoikeus ja lisenssi
-------------------------

Tekijä: Teemu Likonen <<tlikonen@iki.fi>>

OpenPGP-avain: [6965F03973F0D4CA22B9410F0F2CAE0E07608462][PGP]

[PGP]: http://www.iki.fi/tlikonen/pgp-key.asc

Lisenssi: *Creative Commons Nimeä-JaaSamoin 4.0 Kansainvälinen* (CC
BY-SA 4.0). Lisenssi antaa sinulle luvan kopioida ja levittää tätä
teosta tai sen osia missä tahansa välineessä ja muodossa. Sisältöä saa
muokata, ja sen pohjalta saa luoda uusia teoksia mihin tahansa
tarkoitukseen, myös kaupallisesti. Ehdot ovat seuraavat:

  - Sinun on mainittava tekijä(t) asianmukaisesti, tarjottava linkki
    [lisenssin koko tekstiin][CC] sekä mainittava, mikäli olet tehnyt
    muutoksia.
  - Jos muokkaat teosta tai luot sen pohjalta uuden teoksen, sinun on
    jaettava muutoksiasi samalla lisenssillä kuin alkuperäistä teosta.
  - Et saa asettaa sellaisia oikeudellisia ehtoja tai teknisiä estoja,
    jotka estävät muita tekemästä asioita, jotka tämä lisenssi sallii.

[CC]: https://creativecommons.org/licenses/by-sa/4.0/legalcode.fi


Kääntäminen ja asentaminen
--------------------------

Latex-lähdetiedostojen kääntäminen eli latominen PDF-dokumentiksi vaatii
useita Latexin makropaketteja ja pari fonttia. Latexin jakelukokonaisuus
[Texlive](https://tug.org/texlive/) sisältää kaiken tarvittavan.
Esimerkiksi [Debian](https://www.debian.org) Linux -käyttöjärjestelmässä
asennuspaketti `texlive-full` asentaa koko Texliven.

[CTAN][CTAN]-arkistossa julkaistut lähdetiedostot käännetään
PDF-tiedostoksi komennoilla `lualatex` ja `biber` seuraavasti:

    lualatex -shell-escape kaytannollista-latexia
    biber kaytannollista-latexia
    lualatex -shell-escape kaytannollista-latexia
    lualatex -shell-escape kaytannollista-latexia

[Git][Github]-versionhallintajärjestelmässä säilytettävä opas sisältää
tiedoston `Makefile`, joka puolestaan sisältää kääntämisohjeet
`make`-komennolle. PDF-tiedoston saa ladottua yhdellä komennolla:

    make

Kääntämisessä syntyneen PDF-tiedoston voi siirtää haluamaansa paikkaan
käyttöä varten. Oppaan voi myös asentaa Texin standardiin
hakemistorakenteeseen, josta muut ohjelmat voivat sen löytää. Sen voi
tehdä seuraavalla komennolla:

    make install

Edellisen asennuskomennon voi suorittaa ilman erillistä
kääntämisvaihettakin, koska ennen asentamista se varmistaa, että
tarvittavat tiedostot on käännetty. Asennuskohde on käyttäjän
kotihakemistossa eli polussa `$HOME/texmf`. Kohteeseen asentuu paitsi
oppaan PDF-tiedosto myös lähdetiedostot ja tämä käsillä oleva
`README.md`. Asentamisen jälkeen esimerkiksi Texliveen sisältyvä komento
`texdoc` osaa löytää ja avata oppaan, kun komennolle antaa argumentiksi
joitakin oppaan nimen kirjaimia, esimerkiksi `texdoc kaytann`.

Asennus poistetaan komennolla `make uninstall`. Komento tosin säilyttää
polun `$HOME/texmf`, koska siellä voi edelleen sijaita muita Texiin ja
Latexiin liittyviä tiedostoja.

Kääntämishakemiston voi siivota alla olevilla komennoilla. Ensin
mainittu komento poistaa useimmat väliaikaistiedostot mutta säilyttää
oppaan PDF:n ja muut julkaisuun vaadittavat tiedostot. Jälkimmäinen
poistaa kaikki syntyneet tiedostot.

    make clean
    make distclean


Puutteita ja suunnitelmia
-------------------------

  - Lisätään biblatex-lukuun päiväysten muuttaminen (mm. urldate).
  - Lisätään Muuta tekniikkaa -luku, jonka sisällöksi esimerkiksi:
    päiväykset ja kellonajat (datetime2), textpos-paketti, omien
    makropakettien ja dokumenttiluokkien tekeminen.
  - Mahdollisesti vaihdetaan uudempaan wrapfig2-pakettiin, kunhan se
    yleistyy.
  - Uusi `fi-x-school`-tavutuskaava.
  - Babelin versiossa 3.70 on ominaisuus, joka hoitaa automaattisesti
    yhdysmerkin oikein tilanteessa "pakastekaapit ja -arkut".
