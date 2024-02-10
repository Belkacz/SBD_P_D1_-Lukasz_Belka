-- k_akcje_w_meczu_id_4: kwerenda pozwalając nam sprawdzić wszystkie akcje w danym meczu oraz ich autorów dla przykładu wybrałem id 4 bo było tam kilka rekordów

SELECT
t_akcje_meczowe.fk_id_mecz AS 'nr meczu',
t_mecze.fk_id_kolejka AS 'nr kolejki',
t_akcje_meczowe.minuta AS `czas akcji`,
t_typ_akcji.nazwa_akcji `rodzaj akcji`,
t_osoby.imie `imie osoby`,
t_osoby.nazwisko `nazwisko osoby`,
t_zespoly.nazwa_zespolu `nazwa zespolu`
FROM
t_akcje_meczowe JOIN t_typ_akcji ON t_akcje_meczowe.fk_id_typ_akcji = t_typ_akcji.id_typu_akcji 
JOIN t_uczestnicy ON t_akcje_meczowe.fk_id_osoba = t_uczestnicy.id_uczestnika 
JOIN t_osoby ON t_uczestnicy.fk_id_osoba = t_osoby.id_osoby 
JOIN t_sklady ON t_uczestnicy.fk_id_sklad = t_sklady.id_skladu JOIN t_zespoly ON t_sklady.fk_id_zespolu = t_zespoly.id_zespolu 
WHERE
t_akcje_meczowe.fk_id_mecz = '4'
WHERE t_mecze.id_mecz = '4'
ORDER BY
t_akcje_meczowe.minuta