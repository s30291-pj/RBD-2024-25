# Ilość lekarzy posiadajacych dana specjalizacje

USE Szpital;
 
SELECT 
	nazwa nazwa_specjalizacji, COUNT(lekarz_id) AS ilosc_lekarzy 
FROM 
	specjalizacja AS sp 
INNER JOIN 
	przypisana_specjalizacja AS p_sp 
ON 
	sp.id = p_sp.specjalizacja_id 
GROUP BY 
	sp.id
ORDER BY
	ilosc_lekarzy
DESC;

