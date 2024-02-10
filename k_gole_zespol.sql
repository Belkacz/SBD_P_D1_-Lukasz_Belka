-- k_gole_zespolow: Kwerenda zliczająca gole każdego zespołu
SELECT zespol.nazwa_zespolu AS `Zespol`, 
SUM( CASE WHEN typ_akcji.nazwa_akcji = 'Gol' THEN 1 ELSE 0 END ) AS `Liczba Goli` 
FROM t_mecze mecz JOIN t_zespoly zespol ON mecz.fk_id_gospodarz = zespol.id_zespolu OR mecz.fk_id_gosc = zespol.id_zespolu 
JOIN t_akcje_meczowe akcja_meczowa ON mecz.id_mecz = akcja_meczowa.fk_id_mecz JOIN t_typ_akcji typ_akcji ON akcja_meczowa.fk_id_typ_akcji = typ_akcji.id_typu_akcji 
GROUP BY zespol.nazwa_zespolu 
ORDER BY `Liczba Goli` DESC