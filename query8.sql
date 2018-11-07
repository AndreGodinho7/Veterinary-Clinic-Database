/* Query 8 */ 
(SELECT person.name FROM person NATURAL JOIN client NATURAL JOIN veterinary)
UNION 
(SELECT person.name FROM person NATURAL JOIN client NATURAL JOIN assistant)