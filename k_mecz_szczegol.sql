-- k_mecze_szczegoly: Kwerenda wybierająca informacje o meczach wraz z ich szczegółami:
SELECT 
    mecz.id_mecz AS `numer meczu`, 
    mecz.fk_id_gospodarz AS `kod Gospodarza`, 
    zespol1.nazwa_zespolu AS `nazwa Gospodarza`, 
    mecz.fk_id_gosc AS `kod Gościa`, 
    zespol2.nazwa_zespolu AS `nazwa Gościa`, 
    mecz.fk_id_kolejka AS `numer kolejki`, 
    stadion.adres AS `adres stadionu`, 
    mecz.frekwencja AS `frekwencja`,
    osoba.nazwisko AS `Nazwisko sedziego`
FROM 
    t_mecze mecz
    JOIN t_zespoly zespol1 ON mecz.fk_id_gospodarz = zespol1.id_zespolu
    JOIN t_zespoly zespol2 ON mecz.fk_id_gosc = zespol2.id_zespolu
    JOIN t_stadiony stadion ON mecz.stadion = stadion.id_stadionu
LEFT JOIN
    t_uczestnicy sedzia ON sedzia.id_uczestnika = mecz.fk_id_sedzia
LEFT JOIN
    t_osoby osoba ON sedzia.fk_id_osoba = osoba.id_osoby;
