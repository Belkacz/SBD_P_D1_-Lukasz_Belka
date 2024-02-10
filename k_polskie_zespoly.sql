-- kwerenda pozwalająca odfiltrować polskie zespoły wyświetlić je i przedstawić ich date założenia:
SELECT
    zespol.id_zespolu AS "skrót",
    zespol.nazwa_zespolu AS "Nazwa zespołu",
    zespol.rok_zalozenia AS "Rok założenia",
    stadion.adres AS "adres"
FROM
    t_zespoly zespol
LEFT JOIN 
    t_stadiony stadion ON stadion.id_stadionu = zespol.fk_id_stadion
WHERE
    fk_id_kraj = 'pol'