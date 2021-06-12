Käytännöllistä Latexia
======================

**Latex-ladontajärjestelmän opas**


Esittely
--------

*Käytännöllistä Latexia* on nykyaikainen suomenkielinen opas
[Latex](https://fi.wikipedia.org/wiki/LaTeX)-ladontajärjestelmän
käyttäjälle. Se auttaa alkuun pääsyssä ja esittelee merkintäkielen
perusasiat. Opas sisältää käytännönläheiset ohjeet esimerkiksi
dokumentin sivu-, fontti- ja kieliasetusten tekemiseen. Se sisältää
teknisiä ohjeita ja typografisia vinkkejä tavallisimpiin
tekstidokumentin kirjoittamisen tarpeisiin. Oppaan avulla pitäisi
pärjätä niin hyvin, että makropakettien ohjeita tarvitsee lukea vain
harvoin.

Edellisessä kappaleessa mainostettu nykyaikaisuus tarkoittaa esimerkiksi
sitä, että tässä oppaassa keskitytään Open Type -fontteihin,
Unicode-merkistöön ja PDF-tiedostoihin. Latexin vanha fonttitekniikka
sivuutetaan, eikä merkistörajoitusten kanssa enää kamppailla. Oppaan
ohjeet siis sopivat nykyaikaiselle tietokoneen käyttäjälle.


Versionumerointi
----------------

Oppaan versionumerot tulevat julkaisuajan vuosiluvusta sekä
mahdollisesti kuukaudesta ja päivästä. Vuoden ensimmäinen tai ainoa
julkaisu saa versionumeronsa pelkästä vuosiluvusta, esimerkiksi versio
22 (vuosi 2022). Jos samana vuonna julkaistan oppaasta uusi versio,
lisätään versionumeroon kyseisen kuukauden numero, esimerkiksi versio
22.4 (huhtikuu 2022). Saman kuun aikana toinen julkaisu saa
versionumeroonsa vielä päivänkin numeron, esimerkiksi 22.4.15 (15.
huhtikuuta 2022).


Saatavuus
---------

Ei saatavilla. Sijaitsee vain tekijän salatulla kiintolevyllä ja
salatuilla varmuuskopioilla.


Tekijänoikeus ja lisenssi
-------------------------

Tekijä: Teemu Likonen <<tlikonen@iki.fi>>

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

Poikkeus lisenssiin: Jos teet tästä teoksesta oman sähköisen dokumentin
(esim. PDF), dokumenttiin mahdollisesti upotettavat fontit eivät kuulu
tämän lisenssin piiriin, eli niillä saa olla jokin toinen lisenssi.
Ilmaise sähköisen dokumentin käyttäjille selvästi, jos upotettujen
fonttien lisenssi rajoittaa käyttöä eri tavalla kuin tämä lisenssi ja
että tämä lisenssi on silti voimassa teoksen muun sisällön osalta. (Jos
haluat, voit poistaa tämän poikkeuksen, jolloin myös fonttien lisenssin
on oltava yhteensopiva tämän lisenssin kanssa.)


Kääntäminen Latexilla
---------------------

Oppaan Latex-lähdetiedostojen kääntäminen PDF-dokumentiksi vaatii useita
Latexin makropaketteja ja pari fonttia. Latexin jakelukokonaisuus
[Texlive](https://tug.org/texlive/) sisältää kaiken tarvittavan.
Esimerkiksi [Debian](https://www.debian.org) Linux -käyttöjärjestelmässä
metapaketti `texlive-full` asentaa koko Texliven.

Pelkän PDF-tiedoston tekeminen on helpointa yhdellä `make`-komennolla:

    make

Kääntämisessä syntyneen PDF-tiedoston voi siirtää haluamaansa paikkaan
käyttöä varten. Oppaan voi myös asentaa Texin standardiin
hakemistorakenteeseen, josta muut ohjelmat voivat sen löytää. Se tehdään
seuraavalla komennolla:

    make install

Edellisen asennuskomennon voi suorittaa ilman erillistä
kääntämisvaihettakin, koska ennen asentamista se varmistaa, että
tarvittavat tiedostot on käännetty. Asennuskohde on käyttäjän
kotihakemistossa polussa `$HOME/texmf`. Kohteeseen asentuu paitsi oppaan
PDF-tiedosto myös Latexin lähdetiedostot ja tämä käsillä oleva
`README.md`. Asentamisen jälkeen esimerkiksi Texliveen sisältyvä komento
`texdoc` osaa löytää ja avata oppaan, kun komennolle antaa argumentiksi
joitakin oppaan nimen kirjaimia, esimerkiksi `texdoc kaytannoll`.

Asennus poistetaan komennolla `make uninstall`. Komento tosin säilyttää
polun `$HOME/texmf`, koska siellä voi edelleen sijaita muita Latexiin
liittyviä tiedostoja.

Kääntämishakemiston voi siivota alla olevilla komennoilla. Ensin
mainittu komento poistaa väliaikaistiedostot mutta säilyttää oppaan
PDF:n. Jälkimmäinen poistaa kaikki syntyneet tiedostot.

    make clean
    make distclean

Mikäli ei pysty käyttämään `make`-komentoa, onnistuu kääntäminen myös
komennoilla `lualatex` (tai `xelatex`) ja `biber`. Komennot täytyy antaa
seuraavassa järjestyksessä:

    lualatex kaytannollista_latexia
    biber kaytannollista_latexia
    lualatex kaytannollista_latexia
    lualatex kaytannollista_latexia


Puutteita ja suunnitelmia
-------------------------

  - Rakenneluku kesken.
  - Matematiikkaluku puuttuu.
  - Esipuhe puuttuu.
  - Muuta tekniikkaa -luku puuttuu.
  - Lähdetiedostojen nimistä pitäisi mainita jossain: ei välilyöntejä.
    Ehkä on muitakin merkistörajoituksia.
  - Moniosaiset lähdedokumentit: \input, \include yms.
  - Makropakettien tekeminen.
  - Dokumenttiluokkien tekeminen.
  - Yhdenmukaista pakettien nimien latominen marginaaleihin.
