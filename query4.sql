SELECT *
FROM person natural join client
WHERE vat not in (SELECT vat FROM animal)
