SELECT DISTINCT c.name AS animal_name, owner.name AS owner_name, species_name AS species, age
FROM person owner, person vet, consult c, animal a 
WHERE c.name = a.name
AND owner.VAT = c.VAT_owner
AND vet.VAT = c.VAT_vet 
AND vet.name = 'John Smith'; 