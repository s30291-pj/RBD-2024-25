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
  gabinet_id INT,
  diagnoza_id INT
);

CREATE TABLE przypisana_specjalizacja (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lekarz_id INT NOT NULL,
  specjalizacja_id INT NOT NULL
);

CREATE TABLE przypisana_leczenie (
  id INT AUTO_INCREMENT PRIMARY KEY,
  diagnoza_id INT NOT NULL,
  leczenie_id INT NOT NULL
);

CREATE TABLE przypisany_oddzial (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lekarz_id INT NOT NULL,
  oddzial_id INT NOT NULL
);



INSERT INTO specjalizacja (nazwa) VALUES
('Kardiologia'),
('Neurologia'),
('Chirurgia'),
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
('Hematologia');

INSERT INTO leczenie (nazwa, opis) VALUES
('Farmakoterapia antybiotykowa', 'Leczenie zakażeń bakteryjnych z wykorzystaniem antybiotyków.'),
('Chemioterapia', 'Podawanie cytostatyków w terapii chorób nowotworowych.'),
('Radioterapia', 'Zastosowanie promieniowania jonizującego w leczeniu nowotworów.'),
('Fizjoterapia', 'Ćwiczenia i zabiegi fizykalne wspomagające rehabilitację narządu ruchu.'),
('Rehabilitacja kardiologiczna', 'Proces usprawniania pacjentów po zawale serca lub zabiegach kardiochirurgicznych.'),
('Operacja ortopedyczna stawu kolanowego', 'Chirurgiczne leczenie urazów i schorzeń kolana.'),
('Terapia psychologiczna', 'Wsparcie psychologiczne i psychoterapia dla pacjentów w kryzysie.'),
('Leczenie dietetyczne', 'Wprowadzenie indywidualnie dobranej diety dla poprawy stanu zdrowia.'),
('Terapia insulinowa', 'Podawanie insuliny w leczeniu cukrzycy typu 1 i 2.'),
('Dializa nerkowa', 'Oczyszczanie krwi z toksyn w przypadku niewydolności nerek.'),
('Terapia hormonalna', 'Uzupełnianie lub redukcja poziomu hormonów w organizmie pacjenta.'),
('Endoprotezoplastyka stawu biodrowego', 'Wymiana uszkodzonego stawu biodrowego na protezę.'),
('Laseroterapia dermatologiczna', 'Zabiegi laserowe w leczeniu zmian skórnych, np. trądziku czy blizn.'),
('Leczenie ortodontyczne', 'Korygowanie wad zgryzu za pomocą aparatów i nakładek ortodontycznych.'),
('Porada dietetyczna', 'Profesjonalne doradztwo żywieniowe oparte na analizie stanu zdrowia.'),
('Leczenie kanałowe (endodontyczne)', 'Usunięcie zakażonej miazgi zęba i wypełnienie kanałów korzeniowych.'),
('Terapia tlenowa', 'Wspomaganie oddechu pacjenta poprzez podawanie czystego tlenu.'),
('Leczenie przeciwalergiczne', 'Odczulanie i stosowanie leków antyhistaminowych w alergiach.'),
('Leczenie objawowe przeziębienia', 'Farmakologiczne i niefarmakologiczne metody łagodzenia infekcji.'),
('Terapia manualna kręgosłupa', 'Zabiegi wykonywane ręcznie w celu łagodzenia bólu i poprawy ruchomości kręgosłupa.');


INSERT INTO adres (ulica, nr_domu, nr_mieszkania, miasto, kod_pocztowy, wojewodztwo) VALUES
('Kwiatowa', '10', 1,  'Warszawa',  10001, 'Mazowieckie'),
('Kwiatowa', '10', 2,  'Warszawa',  10001, 'Mazowieckie'),
('Kwiatowa', '10', 3,  'Warszawa',  10001, 'Mazowieckie'),
('Klonowa',  '5',  12, 'Krakow',    30002, 'Malopolskie'),
('Klonowa',  '5',  15, 'Krakow',    30002, 'Malopolskie'),
('Brzozowa', '2',  4,  'Poznan',    60003, 'Wielkopolskie'),
('Brzozowa', '2',  5,  'Poznan',    60003, 'Wielkopolskie'),
('Morska',   '15', NULL,'Gdansk',   80004, 'Pomorskie'),
('Morska',   '15', 3,  'Gdansk',    80004, 'Pomorskie'),
('Słoneczna','1',  1,  'Lodz',      90005, 'Lodzkie'),
('Słoneczna','1',  2,  'Lodz',      90005, 'Lodzkie'),
('Słoneczna','1',  3,  'Lodz',      90005, 'Lodzkie'),
('Polna',    '22', NULL,'Szczecin', 70006, 'Zachodniopom.'),
('Polna',    '22', 2,  'Szczecin',  70006, 'Zachodniopom.'),
('Polna',    '22', 3,  'Szczecin',  70006, 'Zachodniopom.'),
('Lesna',    '3A',  1,  'Warszawa',  10001, 'Mazowieckie'),
('Lesna',    '3A',  2,  'Warszawa',  10001, 'Mazowieckie'),
('Wiosenna', '7',   1,  'Krakow',    30002, 'Malopolskie'),
('Wiosenna', '7',   2,  'Krakow',    30002, 'Malopolskie'),
('Jesienna', '9',   1,  'Poznan',    60003, 'Wielkopolskie'),

('Jesienna', '9',   2,  'Poznan',    60003, 'Wielkopolskie'),
('Zimowa',   '6',  11,  'Gdansk',    80004, 'Pomorskie'),
('Zimowa',   '6',  12,  'Gdansk',    80004, 'Pomorskie'),
('Krotka',   '1',  5,   'Lodz',      90005, 'Lodzkie'),
('Krotka',   '1',  6,   'Lodz',      90005, 'Lodzkie'),
('Zielona',  '4',  NULL,'Szczecin', 70006, 'Zachodniopom.'),
('Zielona',  '4',  7,   'Szczecin', 70006, 'Zachodniopom.'),
('Zielona',  '4',  8,   'Szczecin', 70006, 'Zachodniopom.'),
('Dluga',    '12A', NULL,'Warszawa', 10001, 'Mazowieckie'),
('Dluga',    '12A', 2,  'Warszawa',  10001, 'Mazowieckie'),
('Szkolna',  '2',   9,  'Krakow',    30002, 'Malopolskie'),
('Szkolna',  '2',   10, 'Krakow',    30002, 'Malopolskie'),
('Szkolna',  '2',   11, 'Krakow',    30002, 'Malopolskie'),
('Cicha',    '8',   1,  'Poznan',    60003, 'Wielkopolskie'),
('Cicha',    '8',   2,  'Poznan',    60003, 'Wielkopolskie'),
('Kwiatowa', '11',  3,  'Gdansk',    80004, 'Pomorskie'),
('Kwiatowa', '11',  4,  'Gdansk',    80004, 'Pomorskie'),
('Chmielna', '5',   1,  'Szczecin', 70006, 'Zachodniopom.');


-- -----------------------------------------
INSERT INTO pacjent (pesel, imie, nazwisko, telefon, data_urodzenia, adres_id)
VALUES
('12345678901','Jan','Kowalski',      123456789, '1980-01-01', 1),
('23456789012','Anna','Nowak',        234567890, '1975-02-10', 2),
('34567890123','Piotr','Wiśniewski',  345678901, '1990-03-15', 3),
('45678901234','Kasia','Wójcik',      456789012, '1988-04-20', 4),
('56789012345','Ewa','Kowalczyk',     567890123, '1995-05-25', 5),
('67890123456','Adam','Woźniak',      678901234, '1982-06-30', 6),
('78901234567','Magda','Mazur',       789012345, '1993-07-05', 7),
('89012345678','Tomasz','Krawczyk',   890123456, '1989-08-07', 8),
('90123456789','Paulina','Zielińska', 901234567, '1991-09-09', 9),
('01234567890','Robert','Szymański',  112233445, '1984-10-10',10),
('09876543211','Ola','Lewandowska',   998877665, '1977-11-11',11),
('08765432110','Marek','Dąbrowski',   776655443, '1967-12-12',12),
('07654321109','Dominika','Król',     667788990, '1992-10-14',13),
('06543211098','Artur','Jankowski',   667788991, '1994-03-02',14),
('05432110987','Natalia','Wieczorek', 667788992, '1978-07-21',15),
('04321109876','Grzegorz','Kaczmarek',777888999, '1983-01-13',16),
('03211098765','Mariola','Pawłowska', 445566778, '1990-11-25',17),
('02110987654','Tadeusz','Wróbel',    556677889, '1972-06-07',18),
('01109876543','Izabela','Stępień',   223344556, '1985-02-28',19),
('00123456789','Bartek','Rutkowski',  334455667, '1979-09-30',20);


INSERT INTO lekarz (pesel, imie, nazwisko, telefon, stopien, stanowisko, adres_id)
VALUES
('11111111111','Krzysztof','Lekarski',   700100200, 'dr n. med.',       'Ordynator',       21),
('22222222222','Andrzej','Medyczny',     700200300, 'prof. dr hab.',    'Kierownik',       22),
('33333333333','Rafał','Chirurg',        700300400, 'dr n. med.',       'Chirurg',         23),
('44444444444','Joanna','Kardiolog',     700400500, 'lek. med.',        'Lekarz',          24),
('55555555555','Marta','Neurolog',       700500600, 'lek. med.',        'Lekarz',          25),
('66666666666','Piotr','Onkolog',        700600700, 'dr n. med.',       'Lekarz',          26),
('77777777777','Ewelina','Ortopeda',     700700800, 'lek. med.',        'Lekarz',          27),
('88888888888','Karolina','Internista',  700800900, 'lek. med.',        'Lekarz',          28),
('99999999999','Marek','Dentysta',       700900100, 'lek. stom.',       'Lekarz Stomatolog',29),
('12312312312','Paweł','Radiolog',       700111222, 'dr n. med.',       'Radiolog',        30),
('23423423423','Jan','Anestezjolog',     700222333, 'dr n. med.',       'Anestezjolog',    31),
('34534534534','Zofia','Chirurg',        700333444, 'lek. med.',        'Chirurg',         32),
('45645645645','Tomasz','Urolog',        700444555, 'lek. med.',        'Urolog',          33),
('56756756756','Adam','Dermatolog',      700555666, 'dr n. med.',       'Dermatolog',      34),
('67867867867','Ewa','Pediatra',         700666777, 'lek. med.',        'Pediatra',        35),
('78978978978','Irena','Ginekolog',      700777888, 'lek. med.',        'Ginekolog',       36),
('89089089089','Grzegorz','Laryngolog',  700888999, 'lek. med.',        'Laryngolog',      37),
('90190190190','Dorota','Psychiatra',    700999111, 'dr n. med.',       'Psychiatra',      38),
('01201201201','Basia','Reumatolog',     701111222, 'lek. med.',        'Reumatolog',      39),
('09809809809','Oskar','Stomatolog',     701222333, 'lek. stom.',       'Lekarz Stomatolog',40);

INSERT INTO oddzial (nazwa, budynek)
VALUES
('Oddział Wewnętrzny',        'Budynek A'),
('Oddział Chirurgiczny',      'Budynek A'),
('Oddział Kardiologiczny',    'Budynek A'),
('Oddział Neurologiczny',     'Budynek A'),
('Oddział Ortopedyczny',      'Budynek A'),

('Oddział Pediatryczny',      'Budynek B'),
('Oddział Psychiatryczny',     'Budynek B'),
('Oddział Dermatologiczny',    'Budynek B'),
('Oddział Onkologiczny',       'Budynek B'),
('Oddział Ginekologiczny',     'Budynek B'),

('Oddział Laryngologiczny',    'Budynek C'),
('Oddział Urologiczny',        'Budynek C'),
('Oddział Endokrynologiczny',  'Budynek C'),
('Oddział Reumatologiczny',    'Budynek C'),
('Oddział Intensywnej Terapii','Budynek C'),

('Oddział Chorób Zakaźnych',   'Budynek D'),
('Oddział Nefrologiczny',      'Budynek D'),
('Oddział Pulmonologiczny',    'Budynek D'),
('Oddział Rehabilitacyjny',    'Budynek D'),
('Oddział Radiologiczny',      'Budynek D');


INSERT INTO gabinet (numer, pietro, oddzial_id)
VALUES
(101, 1,  1),
(102, 1,  2),
(103, 1,  3),
(104, 2,  4),
(105, 2,  5),
(106, 2,  6),
(107, 3,  7),
(108, 3,  8),
(109, 3,  9),
(110, 4, 10),
(111, 4, 11),
(112, 4, 12),
(113, 5, 13),
(114, 5, 14),
(115, 5, 15),
(116, 6, 16),
(117, 6, 17),
(118, 6, 18),
(119, 7, 19),
(120, 7, 20);

INSERT INTO diagnoza (opis)
VALUES
('Diagnoza 1'),
('Diagnoza 2'),
('Diagnoza 3'),
('Diagnoza 4'),
('Diagnoza 5'),
('Diagnoza 6'),
('Diagnoza 7'),
('Diagnoza 8'),
('Diagnoza 9'),
('Diagnoza 10'),
('Diagnoza 11'),
('Diagnoza 12'),
('Diagnoza 13'),
('Diagnoza 14'),
('Diagnoza 15'),
('Diagnoza 16'),
('Diagnoza 17'),
('Diagnoza 18'),
('Diagnoza 19'),
('Diagnoza 20');

INSERT INTO wizyta (data, godzina, pacjent_id, lekarz_id, gabinet_id, diagnoza_id)
VALUES
('2024-01-01', '10:00:00', 1,  1,  1,  1),
('2024-01-02', '11:00:00', 2,  2,  2,  2),
('2024-01-03', '12:00:00', 3,  3,  3,  3),
('2024-01-04', '13:00:00', 4,  4,  4,  4),
('2024-01-05', '14:00:00', 5,  5,  5,  5),
('2024-01-06', '15:00:00', 6,  6,  6,  6),
('2024-01-07', '10:30:00', 7,  7,  7,  7),
('2024-01-08', '11:30:00', 8,  8,  8,  8),
('2024-01-09', '12:30:00', 9,  9,  9,  9),
('2024-01-10', '13:30:00',10, 10, 10, 10),
('2024-01-11', '14:30:00',11, 11, 11, 11),
('2024-01-12', '15:30:00',12, 12, 12, 12),
('2024-01-13', '10:00:00',13, 13, 13, 13),
('2024-01-14', '11:00:00',14, 14, 14, 14),
('2024-01-15', '12:00:00',15, 15, 15, 15),
('2024-01-16', '13:00:00',16, 16, 16, 16),
('2024-01-17', '14:00:00',17, 17, 17, 17),
('2024-01-18', '15:00:00',18, 18, 18, 18),
('2024-01-19', '15:30:00',19, 19, 19, 19),
('2024-01-20', '16:00:00',20, 20, 20, 20);

INSERT INTO przypisana_specjalizacja (lekarz_id, specjalizacja_id)
VALUES
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
(20, 20);

INSERT INTO przypisana_leczenie (diagnoza_id, leczenie_id)
VALUES
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
(20, 20);

INSERT INTO przypisany_oddzial (lekarz_id, oddzial_id)
VALUES
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
(20, 20);
                
