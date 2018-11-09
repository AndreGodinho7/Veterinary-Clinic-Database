SELECT distinct p.name AS client_name, p.address_street AS street, p.address_city AS city, p.address_zip AS zip 
FROM person p INNER JOIN animal a  on (p.VAT = a.VAT)
WHERE p.VAT NOT IN (SELECT p.VAT
	                FROM person p, animal a 
	                WHERE p.VAT = a.VAT
	                AND (species_name NOT LIKE '%bird%'));