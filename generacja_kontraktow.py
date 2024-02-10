# jeden z kodów python do generowania rekordów w bazie w tym przypadku kontrakty

sql_command = "INSERT INTO `t_kontrakty` (`id_kontraktu`, `fk_id_zespolu`, `fk_id_osoba`, `data_podpisania`, `data_konca`, `fk_id_typ_kontraktu`)  VALUES"
print(sql_command)

lista_stringow = [
    "ARK", "CHO", "CRZ", "GKS", "JAG", "LEC", "LEG", "LPO", "MIE", "PAK", "PZN", "RKP", "SLZ", "GZB", "SLP", "WDZ", "WLO", "WRK"]

counter = 8
band_counter = 0
band_for_player = 0
player = 0

for i in range(8, 500):
    data_podpisania = "2022-06-15"
    data_konca = "2024-06-15"

    if counter % 2 == 0:
        data_podpisania = "2023-06-15"
        data_konca = "2025-06-15"

    if counter <= 44:
        if band_counter > 17:
            band_counter = 0
        fk_id_typ_kontraktu = 1
        fk_id_zespolu = lista_stringow[band_counter]
        if counter > 24:
            fk_id_typ_kontraktu = 2

    if counter > 44:
        fk_id_typ_kontraktu = 3
        fk_id_zespolu = lista_stringow[band_for_player]
        
        if player < 20:
            fk_id_typ_kontraktu = 3
        else:
            fk_id_typ_kontraktu = 4
        
        player += 1
        
        if player > 25:
            band_for_player += 1
            player = 1

    id_kontraktu = counter - 8
    fk_id_osoba = counter
    band_counter += 1
    counter += 1

    sql_command = f"({id_kontraktu}, '{fk_id_zespolu}', {fk_id_osoba}, '{data_podpisania}', '{data_konca}', {fk_id_typ_kontraktu}),"
    print(sql_command)