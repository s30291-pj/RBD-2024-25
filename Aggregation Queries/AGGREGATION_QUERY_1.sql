# Ilość lekarzy posiadajacych dana specjalizacje

USE Szpital;
 
SELECT 
	nazwa nazwa_specjalizacji, COUNT(lekarz_id) ilosc_lekarzy 
FROM 
	specjalizacja sp 
INNER JOIN 
	przypisana_specjalizacja p_sp 
ON 
	sp.id = p_sp.specjalizacja_id 
GROUP BY 
	sp.id
ORDER BY
	ilosc_lekarzy
DESC;

