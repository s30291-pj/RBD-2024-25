DROP TRIGGER IF EXISTS UsunAdresPoUsunieciuPacjenta;

DELIMITER //

CREATE TRIGGER UsunAdresPoUsunieciuPacjenta
AFTER DELETE ON pacjent
FOR EACH ROW
BEGIN
  DELETE FROM adres WHERE id = OLD.adres_id;
END //

DELIMITER ;