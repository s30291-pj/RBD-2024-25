# Kwerenda sprawdzająca spójność danych 
# (dane zostaly specjalnie dodane podczas tworzenia, aby mogly byc wyswietlone jako niespojne)

# Sprawdzenie spojnosci adresow
SELECT COUNT(adr.id) AS nieprzypisane_adresy FROM 
(
	SELECT adres_id FROM lekarz
    UNION
    SELECT adres_id FROM pacjent
) AS p_adr
RIGHT OUTER JOIN adres AS adr
ON p_adr.adres_id = adr.id
WHERE p_adr.adres_id is null
;

# Wyswietelenie niespojnych adresow
SELECT * FROM 
(
	SELECT adres_id FROM lekarz
    UNION
    SELECT adres_id FROM pacjent
) AS p_adr
RIGHT OUTER JOIN adres
ON p_adr.adres_id = adres.id
WHERE p_adr.adres_id is null
;

SELECT * FROM 
(
	SELECT * FROM 
	(
		SELECT adres_id FROM lekarz
		UNION
		SELECT adres_id FROM pacjent
	) AS p_adr
	LEFT JOIN adres
	ON p_adr.adres_id = adres.id
	UNION ALL
	SELECT * FROM 
	(
		SELECT adres_id FROM lekarz
		UNION
		SELECT adres_id FROM pacjent
	) AS p_adr
	RIGHT JOIN adres
	ON p_adr.adres_id = adres.id
) as dane
WHERE dane.adres_id is null OR dane.id is null;


# Sprawdzenie spojnosci diagnoz
SELECT COUNT(dgz.id) AS nieprzypisane_diagnozy FROM diagnoza AS dgz 
LEFT OUTER JOIN wizyta AS wiz 
ON dgz.id = wiz.diagnoza_id 
WHERE wiz.id is null;

# Wyswietelenie niespojnych diagnoz
SELECT * FROM diagnoza AS dgz 
LEFT OUTER JOIN wizyta AS wiz 
ON dgz.id = wiz.diagnoza_id 
WHERE wiz.id is null;

# Sprawdzanie spojnosci leczen
SELECT COUNT(diagnoza_id) AS niespojne_przypisane_leczenia FROM przypisane_leczenie AS p_le 
LEFT OUTER JOIN diagnoza AS dgz ON p_le.diagnoza_id = dgz.id WHERE dgz.id is NULL;



