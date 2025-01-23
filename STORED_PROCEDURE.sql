DROP PROCEDURE IF EXISTS DodajPacjentaZAdresem;

DELIMITER //

CREATE PROCEDURE DodajPacjentaZAdresem (
  IN p_imie VARCHAR(30),
  IN p_nazwisko VARCHAR(30),
  IN p_pesel VARCHAR(11),
  IN p_telefon INT,
  IN p_data_urodzenia DATE,
  IN p_ulica VARCHAR(80),
  IN p_nr_domu VARCHAR(7),
  IN p_nr_mieszkania INT,
  IN p_miasto VARCHAR(20),
  IN p_kod_pocztowy INT,
  IN p_wojewodztwo VARCHAR(45)
)
BEGIN
  DECLARE new_adres_id INT;

  INSERT INTO adres (ulica, nr_domu, nr_mieszkania, miasto, kod_pocztowy, wojewodztwo)
  VALUES (p_ulica, p_nr_domu, p_nr_mieszkania, p_miasto, p_kod_pocztowy, p_wojewodztwo);

  SET new_adres_id = LAST_INSERT_ID();

  INSERT INTO pacjent (pesel, imie, nazwisko, telefon, data_urodzenia, adres_id)
  VALUES (p_pesel, p_imie, p_nazwisko, p_telefon, p_data_urodzenia, new_adres_id);
END //

DELIMITER ;

CALL DodajPacjentaZAdresem(
  'Jan', 'Kowalski', '12345678901', 123456789, '1990-01-01',
  'Warszawska', '15A', 12, 'Warszawa', 12345, 'Mazowieckie'
);

SELECT * FROM pacjent JOIN adres ON pacjent.adres_id = adres.id WHERE pacjent.pesel = '12345678901';