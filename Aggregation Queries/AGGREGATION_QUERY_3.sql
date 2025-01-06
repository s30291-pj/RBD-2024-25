# Średnia liczbę pacjentów przypadająca na jednego lekarza, biorąc pod uwagę przypisane wizyty.

USE Szpital;

SELECT 
	AVG(pacjent_ilosc) AS srednia_ilosc_pacjentow_na_lekarza
FROM (
	SELECT 
		lekarz_id, COUNT(pacjent_id) AS pacjent_ilosc
	FROM
		wizyta
	GROUP BY
		lekarz_id
) AS pacjent_per_lekarz;
