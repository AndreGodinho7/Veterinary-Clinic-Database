DELETE client 
FROM client 
INNER JOIN person ON person.VAT = client.VAT
WHERE name = 'John Smith';