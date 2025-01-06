# Średnia liczba pacjentów przypadająca na jednego lekarza, biorąc pod uwagę przypisane wizyty.

USE Szpital;

SELECT 
	ROUND(AVG(pacjent_ilosc), 2) AS srednia_ilosc_pacjentow_na_lekarza
FROM (
	SELECT 
		lekarz_id, COUNT(pacjent_id) AS pacjent_ilosc
	FROM
		wizyta
	GROUP BY
		lekarz_id
) AS pacjent_per_lekarz;
