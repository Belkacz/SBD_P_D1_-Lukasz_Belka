-- kwerenda zliczajaca żółte kartki
SELECT t_uczestnicy.fk_id_osoba AS `kod gracza`, 
COUNT( * ) `liczba zoltych kartek`, t_osoby.imie, t_osoby.nazwisko, t_zespoly.nazwa_zespolu AS `nazwa zespolu gracza` 
FROM t_akcje_meczowe JOIN t_typ_akcji ON t_akcje_meczowe.fk_id_typ_akcji = t_typ_akcji.id_typu_akcji 
JOIN t_uczestnicy ON t_akcje_meczowe.fk_id_osoba = t_uczestnicy.fk_id_osoba 
JOIN t_osoby ON t_uczestnicy.fk_id_osoba = t_osoby.id_osoby 
JOIN t_sklady ON t_uczestnicy.fk_id_sklad = t_sklady.id_skladu 
JOIN t_zespoly ON t_sklady.fk_id_zespolu = t_zespoly.id_zespolu 
WHERE t_typ_akcji.id_typu_akcji = 3 GROUP BY t_uczestnicy.fk_id_osoba, t_zespoly.nazwa_zespolu 
ORDER BY `liczba zoltych kartek` DESC