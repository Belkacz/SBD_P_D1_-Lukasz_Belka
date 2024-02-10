-- Kwerenda do wypisania wszystkich zawodników danego zespołu, jako przykład użyty id „ARK” (Arka Gdynia):
SELECT
    zespol.id_zespolu AS "ID Zespołu",
    sklad.id_skladu AS "Nr. Skłądu",
    uczestnik.id_uczestnika AS "Nr. Pracownika",
    uczestnik.fk_id_rodzaj_roli AS "Rola",
    osoba.imie AS "Imię",
    osoba.nazwisko AS "Nazwisko"
FROM
    t_zespoly zespol,
    t_sklady sklad,
    t_uczestnicy uczestnik,
    t_osoby osoba
WHERE
    zespol.id_zespolu = sklad.fk_id_zespolu AND
    uczestnik.fk_id_sklad = sklad.id_skladu AND
    osoba.id_osoby = uczestnik.fk_id_osoba AND
    zespol.id_zespolu = 'ARK';
SELECT
    zespol.id_zespolu, sklad.id_skladu,
    uczestnik.id_uczestnika,
    uczestnik.fk_id_rodzaj_roli,
    osoba.imie,
    osoba.nazwisko
FROM
    t_zespoly zespol,
    t_sklady sklad,
    t_uczestnicy uczestnik,
    t_osoby osoba
WHERE
    zespol.id_zespolu = sklad.fk_id_zespolu AND
    uczestnik.fk_id_sklad = sklad.id_skladu AND
    osoba.id_osoby = uczestnik.fk_id_osoba AND
    zespol.id_zespolu = 'ARK';