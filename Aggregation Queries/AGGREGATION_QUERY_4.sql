# Średni rocznikowy wiek pacjentów dla danego lekarza.

USE Szpital;

SELECT 
	lk.imie AS imie_lekarza, 
    lk.nazwisko AS nazwisko_lekarza, 
    ROUND(AVG(wiek_pacjenta)) AS sredni_wiek_pacjentow
FROM
	lekarz AS lk
INNER JOIN
(
	SELECT 
		wz.lekarz_id, YEAR(now()) - YEAR(pc.data_urodzenia) AS wiek_pacjenta
	FROM
		wizyta AS wz
	INNER JOIN
		pacjent AS pc
	ON
		wz.pacjent_id = pc.id
) AS pacjenci_wiek
ON
	lk.id = pacjenci_wiek.lekarz_id
GROUP BY
	lk.id
ORDER BY
	sredni_wiek_pacjentow
DESC;
	
