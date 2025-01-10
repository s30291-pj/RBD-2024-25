# Wyswietlenie nieprzypisanych adresow
SELECT CONCAT("NIE PRZYPISANO NIKOMU ADRESU O ID ", id) AS informacja FROM adres adr
LEFT OUTER JOIN (
	SELECT adres_id FROM pacjent
    UNION
    SELECT adres_id FROM lekarz
) AS p_adr 
ON p_adr.adres_id = adr.id
WHERE adres_id IS NULL

UNION

# Wyswietlenie pacjentow lub lekarzy z nieprzypisanym adresem
SELECT CONCAT("NIE PRZYPISANO OSOBIE ", osoba, " O ID ", id_osoby, " ADRESU!") AS informacja FROM adres adr
RIGHT OUTER JOIN (
    SELECT adres_id, id AS id_osoby, osoba FROM (SELECT id, adres_id, "PACJENT" AS osoba FROM pacjent) AS pacjenci
    UNION
    SELECT adres_id, id AS id_osoby, osoba FROM (SELECT id, adres_id, "PACJENT" AS osoba FROM lekarz) AS lekarze
) AS p_adr 
ON p_adr.adres_id = adr.id
WHERE id IS NULL

UNION

# Wyswietlanie diagnozy bez przypisania
SELECT CONCAT("DIAGNOZA O ID ", diagnoza.id, " NIE JEST PRZYPISANA DO ZADNEJ WIZYTY!") AS informacja FROM diagnoza 
LEFT OUTER JOIN wizyta
ON diagnoza.id = wizyta.diagnoza_id
WHERE wizyta.id IS NULL

UNION

# Wyswietlanie niespojnosci w tabeli przypisane_leczenie
SELECT CONCAT("LECZENIE DLA DIAGNOZY O ID ", p_le.diagnoza_id, " NIE ISTNIEJE!") AS informacja 
FROM przypisane_leczenie p_le
LEFT OUTER JOIN leczenie le 
ON p_le.leczenie_id = le.id
WHERE le.id IS NULL

UNION

# Wyswietlanie niespojnosci w tabeli przypisane_specjalizacje
SELECT CONCAT("SPECJALIZACJA DLA LEKARZA O ID ", p_sp.lekarz_id, " NIE ISTNIEJE!") AS informacja 
FROM przypisana_specjalizacja p_sp
LEFT OUTER JOIN specjalizacja sp ON p_sp.specjalizacja_id = sp.id
WHERE sp.id IS NULL

UNION

# Wyswietlanie niespojnosci w tabeli przypisany_oddzial
SELECT CONCAT("ODDZIAL DLA LEKARZA O ID ", p_od.lekarz_id, " NIE ISTNIEJE!") AS informacja 
FROM przypisany_oddzial p_od
LEFT OUTER JOIN oddzial od ON p_od.oddzial_id = od.id
WHERE od.id IS NULL;




