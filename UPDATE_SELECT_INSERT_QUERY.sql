UPDATE wizyta AS w
JOIN pacjent AS p ON w.pacjent_id = p.id
SET w.godzina = '10:15:00'
WHERE p.nazwisko = 'Kowalski' AND w.data = "2025-01.01" AND w.godzina = "10:00:00";

SELECT numer, pietro, nazwa, budynek FROM gabinet 
JOIN oddzial ON gabinet.oddzial_id = oddzial.id;

INSERT INTO gabinet (numer, pietro, oddzial_id) VALUES (509, 5, 15);