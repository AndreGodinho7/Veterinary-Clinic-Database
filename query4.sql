SELECT *
FROM person NATURAL JOIN client
WHERE vat NOT IN (SELECT vat 
                  FROM animal)
