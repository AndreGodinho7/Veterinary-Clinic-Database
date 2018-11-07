SELECT c.name AS Animal_name, p.name AS Owner_name, species_name, age, weight 
FROM person p, consult c, animal a
WHERE a.name = c.name 
AND p.vat =c.vat_owner 
AND weight > 30
AND (o LIKE '%obesity%' OR o LIKE '%obese%');
