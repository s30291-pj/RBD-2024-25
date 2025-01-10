DROP DATABASE IF EXISTS Szpital;
CREATE DATABASE IF NOT EXISTS Szpital;
USE Szpital;

CREATE TABLE specjalizacja (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nazwa VARCHAR(255) NOT NULL
);

CREATE TABLE leczenie (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nazwa VARCHAR(255) NOT NULL,
  opis TEXT
);

CREATE TABLE adres (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ulica VARCHAR(80) NOT NULL,
  nr_domu VARCHAR(7) NOT NULL,
  nr_mieszkania INT,
  miasto VARCHAR(20) NOT NULL,
  kod_pocztowy INT,
  wojewodztwo VARCHAR(45)
);

CREATE TABLE pacjent (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pesel VARCHAR(11) NOT NULL,
  imie VARCHAR(30) NOT NULL,
  nazwisko VARCHAR(30) NOT NULL,
  telefon INT,
  data_urodzenia DATE,
  adres_id INT
);

CREATE TABLE lekarz (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pesel VARCHAR(11) NOT NULL,
  imie VARCHAR(30) NOT NULL,
  nazwisko VARCHAR(30) NOT NULL,
  telefon INT,
  stopien VARCHAR(255),
  stanowisko VARCHAR(255),
  adres_id INT
);

CREATE TABLE oddzial (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nazwa VARCHAR(255) NOT NULL,
  budynek VARCHAR(255)
);

CREATE TABLE gabinet (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numer INT NOT NULL,
  pietro INT NOT NULL,
  oddzial_id INT
);

CREATE TABLE diagnoza (
  id INT AUTO_INCREMENT PRIMARY KEY,
  opis TEXT
);

CREATE TABLE wizyta (
  id INT AUTO_INCREMENT PRIMARY KEY,
  data DATE NOT NULL,
  godzina TIME NOT NULL,
  pacjent_id INT NOT NULL,
  lekarz_id INT NOT NULL,
  gabinet_id INT NOT NULL,
  diagnoza_id INT
);

CREATE TABLE przypisana_specjalizacja (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lekarz_id INT NOT NULL,
  specjalizacja_id INT NOT NULL
);

CREATE TABLE przypisane_leczenie (
  id INT AUTO_INCREMENT PRIMARY KEY,
  diagnoza_id INT NOT NULL,
  leczenie_id INT NOT NULL
);

CREATE TABLE przypisany_oddzial (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lekarz_id INT NOT NULL,
  oddzial_id INT NOT NULL
);

# Do stworzenia zestawu danych wykorzystano dane pozyskane z:
# https://pl.wikipedia.org/wiki/Specjalizacja_lekarska - specjalizacje
# https://generatorliczb.pl/generator-imion-nazwisk - imiona i nazwiska
# https://generatorliczb.pl/generator-pesel - pesel
# https://www.bestrandoms.com/random-address-in-pl - adresy
# https://remedium.md/icd10 - diagnozy, leczenia, terminy medyczne

INSERT INTO 
	specjalizacja (nazwa)
VALUES
	('Chirurgia'),
	('Kardiologia'),
	('Neurologia'),
	('Ortopedia'),
	('Dermatologia'),
	('Pediatria'),
	('Laryngologia'),
	('Onkologia'),
	('Oftalmologia'),
	('Psychiatria'),
	('Ginekologia'),
	('Endokrynologia'),
	('Urologia'),
	('Gastrologia'),
	('Pulmonologia'),
	('Reumatologia'),
	('Stomatologia'),
	('Radiologia'),
	('Anestezjologia'),
	('Hematologia'),
	('Choroby zakaźne'),
	('Immunologia'),
	('Alergologia'),
	('Geriatria'),
	('Medycyna rodzinna');

INSERT INTO 
	leczenie (nazwa, opis)
VALUES
	('Farmakoterapia antybiotykowa', 'Leczenie zakażeń bakteryjnych antybiotykami.'),
	('Chemioterapia', 'Podawanie cytostatyków w terapii nowotworów.'),
	('Radioterapia', 'Zastosowanie promieniowania jonizującego w leczeniu nowotworów.'),
	('Fizjoterapia', 'Ćwiczenia i zabiegi fizykalne wspomagające rehabilitację.'),
	('Rehabilitacja kardiologiczna', 'Usprawnianie pacjentów po zawale lub zabiegach kardiochirurgicznych.'),
	('Operacja ortopedyczna stawu kolanowego', 'Chirurgiczne leczenie urazów i schorzeń kolana.'),
	('Terapia psychologiczna', 'Wsparcie psychologiczne i psychoterapia dla pacjentów.'),
	('Leczenie dietetyczne', 'Indywidualnie dobrana dieta dla poprawy stanu zdrowia.'),
	('Terapia insulinowa', 'Leczenie cukrzycy poprzez podawanie insuliny.'),
	('Dializa nerkowa', 'Oczyszczanie krwi z toksyn przy niewydolności nerek.'),
	('Terapia hormonalna', 'Regulacja zaburzeń hormonalnych w organizmie pacjenta.'),
	('Endoprotezoplastyka stawu biodrowego', 'Wymiana uszkodzonego stawu biodrowego na protezę.'),
	('Laseroterapia dermatologiczna', 'Zabiegi laserowe w leczeniu zmian skórnych.'),
	('Leczenie ortodontyczne', 'Korekta wad zgryzu za pomocą aparatów.'),
	('Porada dietetyczna', 'Profesjonalne doradztwo żywieniowe.'),
	('Leczenie kanałowe (endodontyczne)', 'Usunięcie zakażonej miazgi zęba i wypełnienie kanałów korzeniowych.'),
	('Terapia tlenowa', 'Wspomaganie oddechu pacjenta czystym tlenem.'),
	('Leczenie przeciwalergiczne', 'Odczulanie i stosowanie leków antyhistaminowych.'),
	('Leczenie objawowe przeziębienia', 'Łagodzenie infekcji farmakologicznie i niefarmakologicznie.'),
	('Terapia manualna kręgosłupa', 'Zabiegi manualne łagodzące ból i poprawiające ruchomość kręgosłupa.'),
	('Rehabilitacja neurologiczna', 'Kompleksowa rehabilitacja pacjentów ze schorzeniami neurologicznymi.'),
	('Terapia immunologiczna', 'Wzmacnianie układu odpornościowego odpowiednimi preparatami.'),
	('Operacyjne leczenie przepukliny', 'Chirurgiczna naprawa różnych rodzajów przepuklin.'),
	('Leczenie hormonalne w endometriozie', 'Zastosowanie hormonów w łagodzeniu objawów endometriozy.'),
	('Neurochirurgiczna interwencja', 'Operacyjne leczenie chorób mózgu i rdzenia kręgowego.'),
	('Leczenie odwykowe', 'Terapia uzależnień od substancji psychoaktywnych.'),
	('Krioterapia dermatologiczna', 'Zastosowanie niskich temperatur w leczeniu zmian skórnych.'),
	('Transplantacja nerki', 'Przeszczep nerki u pacjentów z zaawansowaną niewydolnością nerek.'),
	('Operacja kręgosłupa', 'Chirurgiczna korekcja urazów i schorzeń kręgosłupa.'),
	('Balneoterapia', 'Leczenie uzdrowiskowe z wykorzystaniem wód leczniczych.'),
	('Terapia logopedyczna', 'Pomoc w zaburzeniach mowy i komunikacji.'),
	('Leczenie in vitro', 'Zapłodnienie pozaustrojowe w przypadku niepłodności.'),
	('Elektroterapia', 'Leczenie impulsami elektrycznymi wspomagające rehabilitację.'),
	('Kinezyterapia', 'Leczenie ruchem – zestaw ćwiczeń terapeutycznych.'),
	('Leczenie wrzodziejącego zapalenia jelita grubego', 'Farmakologiczne i niefarmakologiczne leczenie WZJG.'),
	('Psychoterapia poznawczo-behawioralna', 'Terapia ukierunkowana na zmianę schematów myślenia i zachowania.'),
	('Leczenie stomatologiczne zachowawcze', 'Plombowanie, usuwanie kamienia nazębnego, skaling.'),
	('Terapia integracji sensorycznej', 'Wsparcie w rozwoju zmysłów i koordynacji ruchowej.'),
	('Leczenie żywieniowe w onkologii', 'Specjalistyczna dieta dla pacjentów onkologicznych.'),
	('Sesje wsparcia psychologicznego', 'Grupowe lub indywidualne spotkania wspomagające zdrowie psychiczne.');

INSERT INTO 
	adres (ulica, nr_domu, nr_mieszkania, miasto, kod_pocztowy, wojewodztwo)
VALUES
	('Kwiatowa', '10', 1, 'Warszawa', 10001, 'Mazowieckie'),
	('Kwiatowa', '10', 2, 'Warszawa', 10001, 'Mazowieckie'),
	('Klonowa', '5', 12, 'Krakow', 30002, 'Malopolskie'),
	('Brzozowa', '2', 4, 'Poznan', 60003, 'Wielkopolskie'),
	('Morska', '15', NULL, 'Gdansk', 80004, 'Pomorskie'),
	('Słoneczna','1',  1, 'Lodz', 90005, 'Lodzkie'),
	('Polna', '22', NULL, 'Szczecin', 70006, 'Zachodniopom.'),
	('Lesna', '3A', 2, 'Warszawa', 10001, 'Mazowieckie'),
	('Wiosenna', '7', 2, 'Krakow', 30002, 'Malopolskie'),
	('Jesienna', '9', 2, 'Poznan', 60003, 'Wielkopolskie'),
	('Zimowa', '6', 11, 'Gdansk', 80004, 'Pomorskie'),
	('Krotka', '1', 5, 'Lodz', 90005, 'Lodzkie'),
	('Zielona', '4', 7, 'Szczecin', 70006, 'Zachodniopom.'),
	('Dluga', '12A', 2, 'Warszawa', 10001, 'Mazowieckie'),
	('Szkolna', '2', 9, 'Krakow', 30002, 'Malopolskie'),
	('Cicha', '8', 2, 'Poznan', 60003, 'Wielkopolskie'),
	('Kwiatowa', '11', 4, 'Gdansk', 80004, 'Pomorskie'),
	('Chmielna', '5', 1, 'Szczecin', 70006, 'Zachodniopom.'),
	('Lipowa', '13', 2, 'Warszawa', 10001, 'Mazowieckie'),
	('Parkowa', '25', 3, 'Krakow', 30002, 'Malopolskie'),
	('Nowa', '45', 1, 'Poznan', 60003, 'Wielkopolskie'),
	('Krótka', '6', 2, 'Gdansk', 80004, 'Pomorskie'),
	('Leśników', '1A', 1, 'Lodz', 90005, 'Lodzkie'),
	('Wierzbowa', '8', 2, 'Szczecin', 70006, 'Zachodniopom.'),
	('Dębowa', '2B', 1, 'Warszawa', 10002, 'Mazowieckie'),
	('Cmentarna', '3', NULL, 'Krakow', 30003, 'Malopolskie'),
	('Sosnowa', '7', 1, 'Poznan', 60005, 'Wielkopolskie'),
	('Topolowa', '11', 1, 'Gdansk', 80006, 'Pomorskie'),
	('Zbożowa', '22', 4, 'Lodz', 90007, 'Lodzkie'),
	('Warszawska', '15', 6, 'Szczecin', 70009, 'Zachodniopom.'),
	('Zakopiańska', '5B', 2, 'Krakow', 30004, 'Malopolskie'),
	('Gdańska', '50', 3, 'Poznan', 60007, 'Wielkopolskie'),
	('Lubelska', '2C', 1, 'Gdansk', 80009, 'Pomorskie'),
	('Wielicka', '100', 1, 'Lodz', 90009, 'Lodzkie'),
	('Mazurska', '4', 2, 'Szczecin', 70010, 'Zachodniopom.'),
	('Pomorska', '12', 3, 'Warszawa', 10003, 'Mazowieckie'),
	('Kielecka', '9A', 5, 'Krakow', 30005, 'Malopolskie'),
	('Tatrzańska', '6', NULL, 'Poznan', 60008, 'Wielkopolskie'),
	('Śląska', '1C', 1, 'Gdansk', 80010, 'Pomorskie'),
	('Piwna', '11', 2, 'Lodz', 90010, 'Lodzkie'),
	('Kręta', '14', 2, 'Szczecin', 70011, 'Zachodniopom.'),
	('Wiślana', '5',  4, 'Warszawa', 10004, 'Mazowieckie'),
	('Wielka', '9',  3, 'Krakow', 30006, 'Malopolskie'),
	('Mała', '1D', 1, 'Poznan', 60009, 'Wielkopolskie'),
	('Wyzwolenia', '11', 2, 'Gdansk', 80011, 'Pomorskie'),
	('Przemysłowa', '2', 2, 'Lodz', 90011, 'Lodzkie'),
	('Robotnicza', '7', 3, 'Szczecin', 70012, 'Zachodniopom.'),
	('Żytnia', '10', 1, 'Warszawa', 10005, 'Mazowieckie'),
	('Mokra', '3A', 2, 'Krakow', 30007, 'Malopolskie'),
	('Spokojna', '6', NULL, 'Poznan', 60010, 'Wielkopolskie'),
	('Promienna', '13', 4, 'Gdansk', 80012, 'Pomorskie'),
	('Szeroka', '2', 1, 'Lodz', 90012, 'Lodzkie'),
	('Czarna', '11', 2, 'Szczecin', 70013, 'Zachodniopom.'),
	('Biała', '8A', NULL, 'Warszawa', 10006, 'Mazowieckie'),
	('Krakowska', '7',  3, 'Krakow', 30008, 'Malopolskie'),
	('Zakątna', '5',  2, 'Poznan', 60011, 'Wielkopolskie'),
	('Kluczborska', '4', 1, 'Gdansk', 80013, 'Pomorskie'),
	('Długa', '12B', NULL, 'Lodz', 90013, 'Lodzkie'),
	('Wąska', '1',  1, 'Szczecin', 70014, 'Zachodniopom.'),
	('Poziomkowa', '2A', 4, 'Warszawa', 10007, 'Mazowieckie'),
	('Truskawkowa', '6', 3, 'Krakow', 30009, 'Malopolskie'),
	('Jagodowa', '17', 2, 'Poznan', 60012, 'Wielkopolskie'),
	('Leśna', '3B', 1, 'Gdansk', 80014, 'Pomorskie'),
	('Miodowa', '18', NULL, 'Lodz', 90014, 'Lodzkie'),
	('Szmaragdowa', '11', 2, 'Szczecin', 70015, 'Zachodniopom.'),
	('Zamkowa', '1', 5, 'Warszawa', 10008, 'Mazowieckie'),
	('Księżycowa', '8', 2, 'Krakow', 30010, 'Malopolskie'),
	('Słoneczna','2', 1, 'Poznan', 60013, 'Wielkopolskie'),
	('Kraina', '21', 2, 'Gdansk', 80015, 'Pomorskie'),
	('Tęczowa', '30', 4, 'Lodz', 90015, 'Lodzkie'),
	('Graniczna', '9', 3, 'Szczecin', 70016, 'Zachodniopom.'),
	('Wapienna', '11', 1, 'Warszawa', 10009, 'Mazowieckie'),
	('Poranna', '2C', 2, 'Krakow', 30011, 'Malopolskie'),
	('Wiejska', '7', NULL, 'Poznan', 60014, 'Wielkopolskie'),
	('Sarnia', '5', 3, 'Gdansk', 80016, 'Pomorskie');

INSERT INTO 
	oddzial (nazwa, budynek)
VALUES
	('Oddział Wewnętrzny', 'Budynek A'),
	('Oddział Chirurgiczny', 'Budynek A'),
	('Oddział Kardiologiczny', 'Budynek A'),
	('Oddział Neurologiczny', 'Budynek A'),
	('Oddział Ortopedyczny', 'Budynek A'),
	('Oddział Pediatryczny', 'Budynek B'),
	('Oddział Psychiatryczny', 'Budynek B'),
	('Oddział Dermatologiczny', 'Budynek B'),
	('Oddział Onkologiczny', 'Budynek B'),
	('Oddział Ginekologiczny', 'Budynek B'),
	('Oddział Laryngologiczny', 'Budynek C'),
	('Oddział Urologiczny', 'Budynek C'),
	('Oddział Endokrynologiczny', 'Budynek C'),
	('Oddział Reumatologiczny', 'Budynek C'),
	('Oddział Intensywnej Terapii', 'Budynek C'),
	('Oddział Chorób Zakaźnych', 'Budynek D'),
	('Oddział Nefrologiczny', 'Budynek D'),
	('Oddział Pulmonologiczny', 'Budynek D'),
	('Oddział Rehabilitacyjny', 'Budynek D'),
	('Oddział Radiologiczny', 'Budynek D'),
	('Oddział Geriatryczny', 'Budynek E'),
	('Oddział Alergologiczny', 'Budynek E'),
	('Oddział Immunologiczny', 'Budynek E'),
	('Oddział Gastrologiczny', 'Budynek E'),
	('Oddział Medycyny Rodzinnej', 'Budynek E');

INSERT INTO 
	gabinet (numer, pietro, oddzial_id)
VALUES
	(101, 1, 1),
	(102, 1, 2),
	(103, 1, 3),
	(104, 1, 4),
	(105, 1, 5),
	(106, 1, 6),
	(107, 1, 7),
	(108, 1, 8),
	(201, 2, 9),
	(202, 2, 10),
	(203, 2, 11),
	(204, 2, 12),
	(205, 2, 13),
	(206, 2, 14),
	(207, 2, 15),
	(208, 2, 16),
	(301, 3, 17),
	(302, 3, 18),
	(303, 3, 19),
	(304, 3, 20),
	(305, 3, 21),
	(306, 3, 22),
	(307, 3, 23),
	(308, 3, 24),
	(401, 4, 25),
	(402, 4, 1),
	(403, 4, 2),
	(404, 4, 3),
	(405, 4, 4),
	(406, 4, 5),
	(407, 4, 6),
	(408, 4, 7),
	(501, 5, 8),
	(502, 5, 9),
	(503, 5, 10),
	(504, 5, 11),
	(505, 5, 12),
	(506, 5, 13),
	(507, 5, 14),
	(508, 5, 15);

INSERT INTO 
	diagnoza (opis)
VALUES
	('Niewydolność serca w początkowym stadium'),
	('Zapalenie płuc bakteryjne'),
	('Przepuklina pachwinowa lewostronna'),
	('Grzybica skóry dłoni'),
	('Złamanie kości udowej'),
	('Nadciśnienie tętnicze lekkie'),
	('Astma oskrzelowa przewlekła'),
	('Alergia sezonowa na pyłki'),
	('Zaćma prawego oka'),
	('Zaburzenia depresyjne nawracające'),
	('Zapalenie wyrostka robaczkowego'),
	('Przewlekłe migreny'),
	('Niedoczynność tarczycy'),
	('Kamica nerkowa'),
	('Wrzody żołądka'),
	('POChP w stopniu umiarkowanym'),
	('Choroba reumatyczna kolan'),
	('Próchnica zębów trzonowych'),
	('Zmiana barwnikowa skóry'),
	('Przerzuty nowotworowe do węzłów chłonnych'),
	('Cukrzyca typu II'),
	('Choroba Alzheimera początkowa'),
	('Nadczynność tarczycy'),
	('Przewlekła niewydolność żylna'),
	('Zapalenie ucha środkowego'),
	('Otyłość stopnia II'),
	('Anemia z niedoboru żelaza'),
	('Zakażenie wirusem grypy'),
	('Zespół jelita drażliwego'),
	('Nawracające zapalenie pęcherza moczowego'),
	('Choroba Leśniowskiego-Crohna'),
	('Przewlekła niewydolność nerek'),
	('Zespół policystycznych jajników'),
	('Zapalenie zatok przynosowych'),
	('Depresja reaktywna'),
	('Złamanie nadgarstka'),
	('Ból kręgosłupa lędźwiowego'),
	('Zapalenie oskrzeli'),
	('Niedobór witaminy D'),
	('Stan po zawale mięśnia sercowego'),
	('Reumatoidalne zapalenie stawów dłoni'),
	('Próchnica z ropniem przywierzchołkowym'),
	('Choroba niedokrwienna serca'),
	('Nerwica lękowa'),
	('Przebyty udar mózgu'),
	('Ostre zapalenie trzustki'),
	('Nadwaga (BMI 28)'),
	('Owrzodzenie podudzi'),
	('Choroba Parkinsona'),
	('Podeszły wiek - schorzenia geriatryczne'),
	('Zapalenie krtani i tchawicy'),
	('Nowotwór piersi - wczesne stadium'),
	('Zapalenie mięśnia sercowego'),
	('Torbiel jajnika'),
	('Okresowa bezsenność'),
	('Stan po operacji tarczycy'),
	('Nawracające ataki kolki nerkowej'),
	('Grypa żołądkowa'),
	('Kontuzja ścięgna Achillesa'),
	('Zapalenie spojówek'),
	('Ból stawu biodrowego'),
	('Hipercholesterolemia'),
	('Złamanie dwóch żeber'),
	('Przewlekłe zapalenie zatok'),
	('Stan przedzawałowy'),
	('Krwawienie z przewodu pokarmowego'),
	('Tętniak aorty brzusznej'),
	('Żylaki kończyn dolnych'),
	('Niedokrwistość megaloblastyczna'),
	('Choroba zwyrodnieniowa stawów biodrowych');

INSERT INTO 
	pacjent (pesel, imie, nazwisko, telefon, data_urodzenia, adres_id)
VALUES
	('85010112345','Jan','Kowalski','601111111','1985-01-01', 26),
	('79021054321','Anna','Nowak','602222222','1979-02-10', 27),
	('91031598765','Piotr','Wiśniewski','603333333','1991-03-15', 28),
	('88042022222','Kasia','Wójcik','604444444','1988-04-20', 29),
	('95052511111','Ewa','Kowalczyk','605555555','1995-05-25', 30),
	('82063077777','Adam','Woźniak','606666666','1982-06-30', 31),
	('93010565432','Magda','Mazur','607777777','1993-01-05', 32),
	('89080733333','Tomasz','Krawczyk','608888888','1989-08-07', 33),
	('91090999999','Paulina','Zielińska','609999999','1991-09-09', 34),
	('84101011223','Robert','Szymański','611111112','1984-10-10', 35),
	('77011199887','Aleksandra','Lewandowska','612222223','1977-01-11', 36),
	('67081288776','Marek','Dąbrowski','613333334','1967-08-12', 37),
	('92031477665','Dominika','Król','614444445','1992-03-14', 38),
	('94030266554','Artur','Jankowski','615555556','1994-03-02', 39),
	('78072111222','Natalia','Wieczorek','616666667','1978-07-21', 40),
	('83011399900','Grzegorz','Kaczmarek','617777778','1983-01-13', 41),
	('90012533344','Mariola','Pawłowska','618888889','1990-01-25', 42),
	('72060755566','Tadeusz','Wróbel','619999990','1972-06-07', 43),
	('85022877788','Izabela','Stępień','622222221','1985-02-28', 44),
	('79093044455','Bartłomiej','Rutkowski','623333332','1979-09-30', 45),
	('91071411999','Urszula','Sawicka','624444443','1991-07-14', 46),
	('85050134567','Karolina','Baran','625555554','1985-05-01', 47),
	('76080988771','Sebastian','Adamski','626666665','1976-08-09', 48),
	('98030177444','Justyna','Szulc','627777776','1998-03-01', 49),
	('97041522233','Krzysztof','Nowicki','628888887','1997-04-15', 50),
	('69072955433','Władysław','Wasilewski','629999998','1969-07-29', 51),
	('86061344566','Agnieszka','Jaworska','631111119','1986-06-13', 52),
	('81022087654','Dariusz','Krause','632222220','1981-02-20', 53),
	('93092233311','Sylwia','Piotrowska','633333331','1993-09-22', 54),
	('72071622200','Paulina','Maciejewska','634444442','1972-07-16', 55),
	('94102155677','Rafał','Pietrzak','635555553','1994-10-21', 56),
	('85010345332','Katarzyna','Zając','636666664','1985-01-03', 57),
	('92060977441','Patryk','Sikora','637777775','1992-06-09', 58),
	('79032166559','Wojciech','Cichy','638888886','1979-03-21', 59),
	('75081555661','Monika','Głowacka','639999997','1975-08-15', 60),
	('99010111110','Elżbieta','Lis','641111110','1999-01-01', 61),
	('87061299887','Damian','Kozłowski','642222221','1987-06-12', 62),
	('95042133444','Beata','Wasilewska','643333332','1995-04-21', 63),
	('79051277744','Krystian','Sadowski','644444443','1979-05-12', 64),
	('98071688855','Michał','Orłowski','645555554','1998-07-16', 65),
	('94080633322','Dawid','Kalinowski','646666665','1994-08-06', 66),
	('73091299900','Julita','Sroka','647777776','1973-09-12', 67),
	('89040155433','Teresa','Maj','648888887','1989-04-01', 68),
	('83061511234','Ewelina','Witkowska','649999998','1983-06-15', 69),
	('96072788776','Olga','Dudek','651111119','1996-07-27', 70),
	('81040633422','Kornelia','Kopeć','652222220','1981-04-06', 71),
	('85011144332','Paweł','Szczepański','653333331','1985-01-11', 72),
	('77061077881','Iwona','Kozioł','654444442','1977-06-10', 73),
	('93081244339','Konrad','Markowski','655555553','1993-08-12', 74),
	('99052933221','Joanna','Wrona','656666664','1999-05-29', 76);

INSERT INTO 
	lekarz (pesel, imie, nazwisko, telefon, stopien, stanowisko, adres_id)
VALUES
	('82010112345','Krzysztof','Kowal','700100200','dr n. med.','Chirurg',1),
	('79022054321','Andrzej','Nowacki','700200300','prof. dr hab.','Kardiolog',2),
	('91031598765','Rafał','Chmielewski','700300400','dr n. med.','Chirurg',3),
	('85042022222','Joanna','Wysocka','700400500','lek. med.','Lekarz Ortopeda',4),
	('88052511111','Marta','Mazurek','700500600','lek. med.','Lekarz Neurolog',5),
	('94063077777','Piotr','Olszewski','700600700','dr n. med.','Onkolog',6),
	('93010565432','Ewelina','Chojnacka','700700800','lek. med.','Ortopeda',7),
	('91080733333','Karolina','Krzyżanowska','700800900','lek. med.','Internista',8),
	('85090999999','Marek','Kowalik','700900100','lek. stom.','Stomatolog',9),
	('86011011223','Paweł','Witkowski','700111222','dr n. med.','Radiolog',10),
	('72011199887','Jan','Anestezja','700222333','dr n. med.','Anestezjolog',11),
	('67091288776','Zofia','Chirurg','700333444','lek. med.','Chirurg',12),
	('92031477665','Tomasz','Urologiczny','700444555','lek. med.','Urolog',13),
	('75030266554','Adam','Jakubiak','700555666','dr n. med.','Dermatolog',14),
	('98072111222','Ewa','Pietrzyk','700666777','lek. med.','Pediatra',15),
	('83011399900','Irena','Polańska','700777888','lek. med.','Ginekolog',16),
	('81012533344','Grzegorz','Lange','700888999','lek. med.','Laryngolog',17),
	('72060755566','Dorota','Sienkiewicz','700999111','dr n. med.','Psychiatra',18),
	('95022877788','Basia','Rumińska','701111222','lek. med.','Reumatolog',19),
	('74093044455','Oskar','Koral','701222333','lek. stom.','Stomatolog',20),
	('93071411999','Marcin','Nowiński','701333444','dr n. med.','Gastrolog',21),
	('85050134567','Roman','Olejniczak','701444555','lek. med.','Alergolog',22),
	('76080988771','Sebastian','Urban','701555666','dr n. med.','Pulmonolog',23),
	('84030177444','Magdalena','Kałużna','701666777','lek. med.','Endokrynolog',24),
	('89041522233','Kamil','Nowaczyk','701777888','lek. med.','Lekarz Rodzinny',25);

INSERT INTO 
	przypisana_specjalizacja (lekarz_id, specjalizacja_id)
VALUES
	(1, 1),
    (4, 98),
	(1, 19),
	(2, 2),
	(2, 25),
	(3, 1),
	(4, 4),
	(5, 3),
	(5, 22),
	(6, 8),
	(7, 4),
	(8, 25),
	(9, 17),
	(10, 18),
	(11, 19),
	(12, 1),
	(13, 13),
	(14, 5),
	(15, 6),
	(16, 11),
	(17, 7),
	(18, 10),
	(19, 16),
	(20, 17),
	(21, 14),
	(22, 23),
	(23, 15),
	(24, 12),
	(25, 25),
	(25, 24),
	(3, 19),
	(4, 1),
	(7, 3),
	(9, 5),
	(10, 20),
	(12, 19),
	(13, 2),
	(14, 8),
	(16, 15),
	(17, 21),
	(18, 10),
	(20, 1),
	(20, 3),
	(21, 23),
	(23, 11),
	(24, 2);

INSERT INTO 
	przypisany_oddzial (lekarz_id, oddzial_id)
VALUES
	(1,  2),
	(3,  2),
	(12, 2),
	(2,  3),
    (6, 29),
    (12, 29),
	(4,  5),
	(7,  5),
	(5,  4),
	(6,  9),
	(8,  1),
	(14, 8),
	(10, 20),
	(11, 15),
	(13, 12),
	(15, 6),
	(16, 10),
	(17, 11),
	(18, 7),
	(19, 14),
	(9,  8),
	(20, 8),
	(21, 24),
	(22, 22),
	(23, 18),
	(24, 13),
	(25, 25),
	(1, 1),
	(1, 16),
	(2, 1),
	(3, 3),
	(4, 4),
	(4, 16),
	(5, 17),
	(6, 9),
	(7, 4),
	(8, 2),
	(8, 16),
	(9, 8),
	(10, 1),
	(10, 20),
	(11, 19),
	(12, 2),
	(12, 16),
	(13, 12),
	(14, 8),
	(14, 7),
	(15, 6),
	(16, 10),
	(17, 11),
	(18, 7),
	(19, 14),
	(19, 2),
	(20, 1),
	(21, 24),
	(21, 13),
	(22, 3),
	(23, 18),
	(23, 4),
	(24, 13),
	(24, 9),
	(25, 11);

INSERT INTO 
	wizyta (data, godzina, pacjent_id, lekarz_id, gabinet_id, diagnoza_id)
VALUES
	('2025-01-01', '10:00:00', 1, 2, 1, 1),
	('2025-01-02', '11:00:00', 2, 1, 2, 3),
	('2025-01-03', '12:00:00', 3, 5, 4, 12),
	('2025-01-04', '13:00:00', 4, 8, 14, 6),
	('2025-01-05', '14:00:00', 10, 6, 9, 20),
	('2025-01-06', '15:00:00', 7, 3, 2, 11),
	('2025-01-07', '10:30:00', 15, 4, 5, 5),
	('2025-01-08', '11:30:00', 5, 14, 8, 4),
	('2025-01-09', '12:30:00', 6, 9, 33, 42),
	('2025-01-10', '13:30:00', 11, 10, 34, 43),
	('2025-01-11', '14:30:00', 12, 11, 35, 65),
	('2025-01-12', '15:30:00', 18, 18, 7, 10),
	('2025-01-13', '10:00:00', 20, 16, 36, 54),
	('2025-01-14', '11:00:00', 25, 15, 6, 25),
	('2025-01-15', '12:00:00', 30, 19, 37, 41),
	('2025-01-16', '13:00:00', 28, 21, 20, 15),
	('2025-01-17', '14:00:00', 35, 22, 22, 8),
	('2025-01-18', '15:00:00', 27, 23, 18, 7),
	('2025-01-19', '15:30:00', 40, 24, 19, 13),
	('2025-01-20', '16:00:00', 45, 25, 25, 50),
	('2025-02-01', '09:00:00', 33, 1, 2, 36),
	('2025-02-02', '10:15:00', 2, 2, 1, 40),
	('2025-02-03', '11:45:00', 16, 4, 5, 37),
	('2025-02-04', '14:10:00', 19, 14, 8, 19),
	('2025-02-05', '15:40:00', 8, 9, 33, 18),
	('2025-02-06', '08:30:00', 45, 3, 2, 11),
	('2025-02-07', '10:00:00', 50, 6, 9, 20),
	('2025-02-08', '11:30:00', 24, 12, 3, 3),
	('2025-02-09', '13:00:00', 26, 22, 22, 8),
	('2025-02-10', '14:30:00', 29, 18, 7, 10),
	('2025-02-11', '09:00:00', 1, 1, 14, 2),
	('2025-02-12', '09:15:00', 2, 4, 5, 5),
	('2025-02-13', '09:30:00', 3, 7, 2, 1),
	('2025-02-14', '09:45:00', 4, 2, 1, 3),
	('2025-02-15', '10:00:00', 5, 8, 14, 28),
	('2025-02-16', '10:30:00', 6, 9, 9, 15),
	('2025-02-17', '11:00:00', 7, 10, 34, 27),
	('2025-02-18', '11:30:00', 8, 6, 33, 33),
	('2025-02-19', '12:00:00', 9, 11, 35, 11),
	('2025-02-20', '12:15:00', 10, 12, 3, 34),
	('2025-02-21', '12:30:00', 11, 16, 36, 39),
	('2025-02-22', '13:00:00', 12, 1, 1, 44),
	('2025-02-23', '13:15:00', 13, 3, 2, 54),
	('2025-02-24', '13:30:00', 14, 7, 14, 51),
	('2025-02-25', '14:00:00', 15, 18, 7, 36),
	('2025-02-26', '14:30:00', 16, 14, 8, 21),
	('2025-02-27', '15:00:00', 17, 9, 9, 70),
	('2025-02-28', '15:30:00', 18, 5, 4, 10),
	('2025-03-01', '09:00:00', 19, 2, 1, 29),
	('2025-03-02', '09:15:00', 20, 3, 2, 49),
	('2025-03-03', '09:30:00', 21, 8, 14, 60),
	('2025-03-04', '09:45:00', 22, 25, 25, 35),
	('2025-03-05', '10:00:00', 23, 13, 12, 31),
	('2025-03-06', '10:30:00', 24, 21, 20, 40),
	('2025-03-07', '11:00:00', 25, 24, 19, 45),
	('2025-03-08', '11:30:00', 26, 22, 22, 4),
	('2025-03-09', '12:00:00', 27, 19, 37, 7),
	('2025-03-10', '12:30:00', 28, 10, 34, 61),
	('2025-03-11', '13:00:00', 29, 15, 6, 55),
	('2025-03-12', '13:30:00', 30, 16, 36, 37),
	('2025-03-13', '14:00:00', 31, 4, 5, 23),
	('2025-03-14', '14:30:00', 32, 1, 14, 22),
	('2025-03-15', '15:00:00', 33, 14, 8, 17),
	('2025-03-16', '15:30:00', 34, 12, 3, 57),
	('2025-03-17', '09:00:00', 35, 9, 9, 59),
	('2025-03-18', '10:00:00', 36, 6, 33, 30),
	('2025-03-19', '11:00:00', 37, 7, 2, 24),
	('2025-03-20', '12:00:00', 38, 3, 1, 14),
	('2025-03-21', '13:00:00', 39, 2, 1, 62),
	('2025-03-22', '14:00:00', 40, 1, 14, 9);

INSERT INTO 
	przypisane_leczenie (diagnoza_id, leczenie_id)
VALUES
	(1,  5),
	(2,  1),
	(3,  4),
    (7, 89),
	(4,  13),
	(5,  6),
	(6,  5),
	(7,  18),
	(8,  18),
	(9,  9),
	(10, 7),
	(11, 6),
	(12, 4),
	(13, 11),
	(14, 9),
	(15, 20),
	(16, 4),
	(17, 7),
	(18, 15),
	(19, 13),
	(20, 2),
	(21, 9),
	(22, 14),
	(23, 11),
	(24, 16),
	(25, 1),
	(26, 8),
	(27, 5),
	(28, 19),
	(29, 14),
	(30, 2),
	(31, 6),
	(32, 10),
	(33, 11),
	(34, 7),
	(35, 1),
	(36, 16),
	(37, 20),
	(38, 3),
	(39, 13),
	(40, 8),
	(41, 17),
	(42, 15),
	(43, 15),
	(44, 2),
	(45, 6),
	(46, 4),
	(47, 1),
	(48, 5),
	(49, 20),
	(50, 7),
	(51, 18),
	(52, 9),
	(53, 10),
	(54, 1),
	(55, 3),
	(56, 16),
	(57, 2),
	(58, 13),
	(59, 12),
	(60, 19),
	(61, 9),
	(62, 11),
	(63, 14),
	(64, 20),
	(65, 7),
	(66, 15),
	(67, 8),
	(68, 3),
	(69, 16),
	(70, 17),
	(1,  1),
	(2,  2),
	(3,  3),
	(4,  4),
	(5,  5),
	(6,  6),
	(7,  7),
	(8,  8),
	(9,  9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 17),
	(18, 18),
	(19, 19),
	(20, 20),
	(21, 21),
	(22, 22),
	(23, 23),
	(24, 24),
	(25, 25),
	(26, 26),
	(27, 27),
	(28, 28),
	(29, 29),
	(30, 30),
	(31, 31),
	(32, 32),
	(33, 33),
	(34, 34),
	(35, 35),
	(36, 36),
	(37, 37),
	(38, 38),
	(39, 39),
	(40, 40),
	(41, 20),
	(42, 19),
	(43, 18),
	(44, 17),
	(45, 16),
	(46, 15),
	(47, 14),
	(48, 13),
	(49, 11),
	(50, 10);
