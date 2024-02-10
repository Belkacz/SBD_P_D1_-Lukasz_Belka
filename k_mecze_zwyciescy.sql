SELECT 
    t_mecze.id_mecz AS `ID Meczu`, 
    z_gosp.nazwa_zespolu AS `Gospodarz`, 
    z_gosc.nazwa_zespolu AS `Gość`, 
    SUM(
        CASE 
            WHEN t_akcje_meczowe.fk_id_typ_akcji = (SELECT id_typu_akcji FROM t_typ_akcji WHERE nazwa_akcji = 'Gol') 
            AND t_uczestnicy.fk_id_sklad = t_mecze.fk_id_sklad_gospodarz 
            THEN 1 
            ELSE 0 
        END
    ) AS `Gole Gospodarza`, 
    SUM(
        CASE 
            WHEN t_akcje_meczowe.fk_id_typ_akcji = (SELECT id_typu_akcji FROM t_typ_akcji WHERE nazwa_akcji = 'Gol') 
            AND t_uczestnicy.fk_id_sklad = t_mecze.fk_id_sklad_gosc 
            THEN 1 
            ELSE 0 
        END
    ) AS `Gole Gościa`, 
    CASE 
        WHEN 
            SUM(
                CASE 
                    WHEN t_akcje_meczowe.fk_id_typ_akcji = (SELECT id_typu_akcji FROM t_typ_akcji WHERE nazwa_akcji = 'Gol') 
                    AND t_uczestnicy.fk_id_sklad = t_mecze.fk_id_sklad_gospodarz 
                    THEN 1 
                    ELSE 0 
                END
            ) > SUM(
                CASE 
                    WHEN t_akcje_meczowe.fk_id_typ_akcji = (SELECT id_typu_akcji FROM t_typ_akcji WHERE nazwa_akcji = 'Gol') 
                    AND t_uczestnicy.fk_id_sklad = t_mecze.fk_id_sklad_gosc 
                    THEN 1 
                    ELSE 0 
                END
            ) 
            THEN 'Zwycięstwo Gospodarza' 
        WHEN 
            SUM(
                CASE 
                    WHEN t_akcje_meczowe.fk_id_typ_akcji = (SELECT id_typu_akcji FROM t_typ_akcji WHERE nazwa_akcji = 'Gol') 
                    AND t_uczestnicy.fk_id_sklad = t_mecze.fk_id_sklad_gospodarz 
                    THEN 1 
                    ELSE 0 
                END
            ) = SUM(
                CASE 
                    WHEN t_akcje_meczowe.fk_id_typ_akcji = (SELECT id_typu_akcji FROM t_typ_akcji WHERE nazwa_akcji = 'Gol') 
                    AND t_uczestnicy.fk_id_sklad = t_mecze.fk_id_sklad_gosc 
                    THEN 1 
                    ELSE 0 
                END
            ) 
            THEN 'Remis' 
        ELSE 'Zwycięstwo Gościa' 
    END AS `Wynik` 
FROM 
    t_mecze 
    LEFT JOIN t_zespoly z_gosp ON t_mecze.fk_id_gospodarz = z_gosp.id_zespolu 
    LEFT JOIN t_zespoly z_gosc ON t_mecze.fk_id_gosc = z_gosc.id_zespolu 
    LEFT JOIN t_uczestnicy ON t_uczestnicy.fk_id_sklad = t_mecze.fk_id_sklad_gospodarz OR t_uczestnicy.fk_id_sklad = t_mecze.fk_id_sklad_gosc 
    LEFT JOIN t_akcje_meczowe ON t_akcje_meczowe.fk_id_osoba = t_uczestnicy.fk_id_osoba AND t_akcje_meczowe.fk_id_mecz = t_mecze.id_mecz 
-- WHERE 
--    z_gosp.id_zespolu = "ARK" OR z_gosc.id_zespolu = "ARK"
GROUP BY 
    t_mecze.id_mecz, 
    z_gosp.nazwa_zespolu, 
    z_gosc.nazwa_zespolu;
