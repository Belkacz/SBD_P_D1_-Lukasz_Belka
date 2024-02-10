# SBD_P_D1_-Łukasz_Belka
Projekt z baz danych

Łukasz Belka

Grupa D1
nr indeksu: 156162
III semestr, 2. rok
rok akademicki 2023/2024
Akademia Humanistyczno-Ekonomiczna w Łodzi

Baza danych „Ekstrawynik Mecze Piłkarskie”


Treści rozpatrywanych zagadnień :
Stworzona przez mnie baza danych to system do przechowania informacji i wyników meczów piłki nożnej. Głównym założeniem jakie mi przyświecało było możliwe dokładne prześledzenie przebiegu spotkania. Nie chciałem spłycać wydarzenia sportowego jakim jest mecz do zaledwie dwóch cyfr wyniku 2:1 albo 0:0. Głównym założeniem było to by przedstawić dane jak najbardziej bazowe czyli w tym przypadku akcje meczowe, np. gole i na podstawie ich przedstawić np. kto wygrał mecz. Bo przecież do określenia wyniku nie potrzebujemy mieć napisanego zwycięzcą jest „XYZ” jesteśmy to w stanie określić na podstawie matematycznego porównania np. 2 > 1. Dlatego też skupiłem się na pojedynczych wydarzeniach mających miejsce w meczu nie zaś na suchych wynikach. 
Owszem projekt można by poszerzyć o te dodatkowe dane jak wynik by były łatwiej dostępne, statystki meczu jak posiadanie piłki, xG, asysty, asysty drugiego poziomu i wiele, wiele innych które możemy znaleźć na profesjonalnych stronach analitycznych takich jak https://ekstrastats.pl/.

Oczywiste jest że takie właśnie strony jak wspomniany już ekstrastats, czy flashscore są moimi inspiracjami zaś ujecie analiza danych footbolowych to obecnie bardzo prężnie rozwijający się i ciekawy rynek. Jak grzyby po deszczu powstają firmy analityczne które po analizie setek tysięcy, jak nie milionów danych przedstawiają najbogatszym klubą różne plany rozwojowe czy pomysły na usprawnienie gry. Bardzo ważne w tej mechanice  jest dostęp do szczegółowych danych właśnie na bardzo drobnym poziomie. Od ilości kontaktów z piłką, przez skoki presingowe skończywszy na strzałach itd. Mój projekt jedynie ślizga się po powierzchni tej tematyki. Głównym ograniczeniem w rozwinięcie go był czas aktualnie posiada on 17 tabel, więc poszerzając go o więcej danych rozrastał by się w niewiarygodne rozmiary. Generalnie sufitu takiego rozwoju prawie nie widać, gdyż tak naprawdę analizujemy tu coś nie zero-jedynkowego, czym jest zachowanie człowieka.
Biorąc pod uwagę te ograniczenia zdecydowałem się przybliżyć projekt bazy danych do znanego serwisu flashcore.pl lub prostu google. Mamy tam zarówno informacje w skali bardziej makro jak to dla jakiego klubu pracuje zawodnik, oraz bardziej mikro jak informacja o nie trafionym karnym w danym meczu. Oczywiście nawet w takiej skali spotkałem się z wieloma problemami w projekcie bazy:
Chodzi o pewną kategoryzacje zachowań. Dla przykładu dość oczywiste wydaje się dołączenie do zespołu osoby trenera lecz po chwili namysłu okażę się, że może on zostać zmieniony w trakcie sezonu, ba w jednym meczu może nie prowadzić zespołu z uwagi na zawieszenie. Pojawia się nam wtedy pewien paradoks który wymaga głębszej analizy, mamy połączenie zespół > trener ale teraz trzeba go zmienić. Ta zamiana musi zostać odnotowana np. w jednym meczu, zaś połączenie trenera z zespołem zmieni całą tabele i wszystkie jej rekordy.  Prowadzi nas to do prostego wniosku ze osoba trenera nie może być na sztywno połączona z zespołem. Podobny problem miałem z osoba zawodnika, najprostszy podział to trener oddzielnie od zawodnika, jednak wystarczy spojrzeć parę lat wstecz (bodaj 1-2 lata) gdzie po zwolnieniu Franciszka Smudy w zespole Wieczysta Kraków, rolę trenera przejął piłkarz esk reprezentant kadry narodowej Sławomir Peszko. Znów dochodzimy do konkluzji, że takie sztywne rozdzielnie jest blednę nawet nie przez to że w realnym życiu pewne rzeczy i granice są dość płynne, ale nawet u tak podstawowego faktu, iż po zakończeniu kariery piłkarskiej ktoś może zostać trenerem. Słabo jakby nasza baza w tym momencie kazała nam tworzyć nowy rekord i nie mielibyśmy dostępu do osiągnięć piłkarskich danego trenera.
Takich problemów i dysonansów w takcie tworzenia bazy miałem naprawdę niezliczone ilości, dlatego też niektóre wyboru w konstrukcji mogą wydawać się na pierwszy rzut oka dziwne, ale jeśli przyjrzymy się im bliżej okaże się że były podstawy ku takiemu działaniu. Więcej szczegółów przedstawię w dalszej części podczas analizy każdej tabeli.
