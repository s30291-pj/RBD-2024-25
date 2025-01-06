# Maksymalną, minimalną i średnią liczba leczeń przypisanych do diagnoz.

USE Szpital;

SELECT 
	MAX(ipl.ilosc_leczen) AS maksymalna_ilosc_leczen, MIN(ipl.ilosc_leczen) AS minimalna_ilosc_leczen, AVG(ipl.ilosc_leczen) AS srednia_ilosc_leczen
FROM 
(
	SELECT 
		diagnoza_id, COUNT(leczenie_id) AS ilosc_leczen
	FROM
		przypisane_leczenie AS p_lc
	GROUP BY
		p_lc.diagnoza_id
) AS ipl;

