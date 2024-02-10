-- Kwerenda pozwalająca sprawdzić wyniki danego zespołu w meczach, id można zamienić tu dal przykładu również ark (Arka Gdynia)

SELECT
    CASE
        WHEN
        Gole_Zespolu > Gole_Przeciwnika
            THEN 'Zwycięstwo'
        WHEN Gole_Zespolu = Gole_Przeciwnika 
            THEN 'Remis'
        ELSE 'Porażka'
        END Wynik,
    Wyniki.fk_id_kolejka `Numer_Kolejki`,
    Wyniki.czas_rozpoczecia `Data_Meczu`,
    nazwa_przeciwnika
FROM
    ( SELECT 
        SUM( 
            CASE 
            WHEN zespol.id_zespolu = 'ARK' AND typ_akcji.nazwa_akcji = 'Gol'
                THEN 1 
                ELSE 0
            END ) Gole_Zespolu,
        SUM( 
            CASE 
            WHEN zespol.id_zespolu != 'ARK' AND typ_akcji.nazwa_akcji = 'Gol' 
                THEN 1
                ELSE 0
            END ) Gole_Przeciwnika, mecz.fk_id_kolejka,
        mecz.czas_rozpoczecia,
            CASE
                WHEN mecz.fk_id_gospodarz = 'ARK' THEN mecz.fk_id_gosc
                ELSE mecz.fk_id_gospodarz
            END AS nazwa_przeciwnika
FROM
    t_mecze mecz
    INNER JOIN t_zespoly zespol ON mecz.fk_id_gospodarz = zespol.id_zespolu OR mecz.fk_id_gosc = zespol.id_zespolu
    INNER JOIN t_akcje_meczowe akcja_meczowa ON mecz.id_mecz = akcja_meczowa.fk_id_mecz
    INNER JOIN t_typ_akcji typ_akcji ON akcja_meczowa.fk_id_typ_akcji = typ_akcji.id_typu_akcji 
WHERE
    zespol.id_zespolu = 'ARK'
GROUP BY mecz.id_mecz ) AS Wyniki
ORDER BY Wyniki.czas_rozpoczecia


