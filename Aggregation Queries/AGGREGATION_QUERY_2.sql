# Średnia liczba specjalizacji przypadających na lekarza

USE Szpital;

SELECT 
	AVG(sp_ilosc) srednia_ilosc_specjalizacji_na_lekarza
FROM (
	SELECT
		lekarz_id, COUNT(lekarz_id) AS sp_ilosc
	FROM
		przypisana_specjalizacja
	GROUP BY
		lekarz_id
) AS lekarze_ilosc;

