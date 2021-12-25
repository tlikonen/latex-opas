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
”2022”. Jos samana vuonna julkaistaan oppaasta uusi versio, lisätään
versionumeroon kyseisen kuukauden numero, esimerkiksi versio ”2022.4”
(huhtikuu 2022). Saman kuun aikana toinen julkaisu saa versionumeroonsa
vielä päivänkin numeron, esimerkiksi ”2022.4.15” (15. huhtikuuta 2022).


Saatavuus
---------

Ei saatavilla. Sijaitsee vain tekijän salatulla kiintolevyllä ja
salatuilla varmuuskopioilla.


Tekijänoikeus ja lisenssi
-------------------------

Tekijä: Teemu Likonen <<tlikonen@iki.fi>>

OpenPGP-avain: [6965F03973F0D4CA22B9410F0F2CAE0E07608462][PGP]

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

[PGP]: http://www.iki.fi/tlikonen/pgp-key.asc


Kääntäminen ja asentaminen
--------------------------

Oppaan Latex-lähdetiedostojen kääntäminen eli latominen PDF-dokumentiksi
vaatii useita Latexin makropaketteja ja pari fonttia. Latexin
jakelukokonaisuus [Texlive](https://tug.org/texlive/) sisältää kaiken
tarvittavan. Esimerkiksi [Debian](https://www.debian.org) Linux
-käyttöjärjestelmässä asennuspaketti `texlive-full` asentaa koko
Texliven.

Oppaan voi latoa julkaisupaketin ja asennettujen tiedostojen avulla tai
versionhallinnan tiedostojen pohjalta.


### Julkaisupaketti

Oppaan julkaisupaketin lähdetiedostot voi latoa PDF-tiedostoksi
komennoilla `lualatex` ja `biber`. Komennot täytyy suorittaa seuraavassa
järjestyksessä:

    lualatex -shell-escape kaytannollista_latexia
    biber kaytannollista_latexia
    lualatex -shell-escape kaytannollista_latexia
    lualatex -shell-escape kaytannollista_latexia


### Versionhallinta (Git)

Git-versionhallintajärjestelmässä säilytettävä opas sisältää tiedoston
`Makefile`, joka puolestaan sisältää kääntämisohjeet `make`-komennolle.
PDF-tiedoston saa ladottua yhdellä komennolla:

    make

Kääntämisessä syntyneen PDF-tiedoston voi siirtää haluamaansa paikkaan
käyttöä varten. Oppaan voi myös asentaa Texin standardiin
hakemistorakenteeseen, josta muut ohjelmat voivat sen löytää. Se tehdään
seuraavalla komennolla:

    make install

Edellisen asennuskomennon voi suorittaa ilman erillistä
kääntämisvaihettakin, koska ennen asentamista se varmistaa, että
tarvittavat tiedostot on käännetty. Asennuskohde on käyttäjän
kotihakemistossa eli polussa `$HOME/texmf`. Kohteeseen asentuu paitsi
oppaan PDF-tiedosto myös Latexin lähdetiedostot ja tämä käsillä oleva
`README.md`. Asentamisen jälkeen esimerkiksi Texliveen sisältyvä komento
`texdoc` osaa löytää ja avata oppaan, kun komennolle antaa argumentiksi
joitakin oppaan nimen kirjaimia, esimerkiksi `texdoc kaytannoll`.

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

  - Puuttuvia tai keskeneräisiä lukuja: hauraat ja kestävät komennot,
    sarkaimet, esipuhe.
  - Lisätään Muuta tekniikkaa -luku, jonka sisällöksi esimerkiksi:
    päiväykset ja kellonajat (datetime2), textpos-paketti, omien
    makropakettien ja dokumenttiluokkien tekeminen.
  - Marginaalihuomautusluvussa voisi mainita `\marginpar`-komennon
    puutteet ja vaihtoehdon `marginnote`.
  - Mahdollisesti käsitellään wrapfig-paketti.
  - Uusi `fi-x-school`-tavutuskaava.
  - Mittojen käsittelyn yhteydessä voisi käsitellä calc-paketin.
