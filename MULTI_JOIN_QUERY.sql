# Wyświetlanie pacjentow z przypisanymi wizytami i powiazanymi danymi

SELECT CONCAT(pacjent.imie, " ", pacjent.nazwisko) pacjent,  CONCAT(wizyta.data, " ", wizyta.godzina) wizyta, CONCAT(lekarz.imie, " ", lekarz.nazwisko) lekarz, gabinet.numer gabinet, oddzial.budynek FROM pacjent 
INNER JOIN wizyta ON pacjent.id = wizyta.pacjent_id
INNER JOIN lekarz ON lekarz.id = wizyta.lekarz_id
INNER JOIN gabinet ON gabinet.id = wizyta.gabinet_id
INNER JOIN oddzial ON oddzial.id = gabinet.oddzial_id

