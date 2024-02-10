# jeden z kodów python do generowania rekordów w bazie w tym przypadku uczestnikow

sql_command = "INSERT INTO `t_uczestnicy` (`fk_id_rodzaj_roli`, `fk_id_osoba`, ` fk_id_skladCounter`)  VALUES",
print(sql_command)

counter = 1
skladCounter = 1
skladId = 1
counterRole = 1
skladCounterOver43 = 1
squadnumber = 1
with open('3_t_osoby.sql', 'r') as file:
    for line in file:
        if line.startswith("INSERT") or "VALUES" or "--" in line:
            continue
        if(counter <= 44):
            fk_id_rodzaj_roli = 'sed'
            fk_id_osoba = counter
            fk_id_skladCounter = None
            if(counter > 7):
                fk_id_rodzaj_roli = 'trn'
                fk_id_skladCounter = skladCounter
                if(counter == 25):
                    skladCounter = 0
                if(counter > 24):
                    fk_id_rodzaj_roli = 'asy'
                skladCounter += 1
        if(counter > 43):
            fk_id_skladCounter = squadnumber
            if(counterRole==1):
                fk_id_rodzaj_roli = 'bra'
            if(counterRole>1 and counterRole <= 5):
                fk_id_rodzaj_roli = 'obr'
            if(counterRole>5 and counterRole <= 9):
                fk_id_rodzaj_roli = 'pom'
            if(counterRole>9 and counterRole <= 11):
                fk_id_rodzaj_roli = 'ata'
            if(counterRole>11 and counterRole <= 25):
                fk_id_rodzaj_roli = 'rez'
            counterRole += 1
            if(counterRole == 25):
                counterRole = 1
            
            skladCounterOver43 +=1
            if(skladCounterOver43 >= 25):
                skladCounterOver43 = 1
                squadnumber += 1

        fk_id_osoba = counter

        counter += 1
        
        sql_command = f"('{fk_id_rodzaj_roli}', '{fk_id_osoba}', '{fk_id_skladCounter}'),"
        print(sql_command)