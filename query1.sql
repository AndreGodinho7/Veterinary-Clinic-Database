SELECT owner.name as Owner_name, c.name as Animal_name, species_name, age
FROM person owner, person vet, consult c, animal a 
WHERE c.name = a.name
AND owner.vat = c.vat_owner
AND vet.vat = c.vat_vet 
AND vet.name = 'John Smith';