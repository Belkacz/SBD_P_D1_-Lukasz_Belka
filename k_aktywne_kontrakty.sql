-- k_aktywne_kontakty: Kwerenda sprawdzająca jakie są obecnie aktywne kontakty opiera si.e o porównanie dat końca i początku z wprowadzoną datą:

SELECT t_kontrakty.*, t_typy_kontraktow.nazwa_typu_kontraktu 
FROM t_kontrakty t_kontrakty, t_typy_kontraktow t_typy_kontraktow 
WHERE 
t_kontrakty.fk_id_typ_kontraktu = t_typy_kontraktow.id_typ_kontraktu 
AND t_kontrakty.data_podpisania < '2024-01-05' 
AND t_kontrakty.data_konca > '2024-01-05'
