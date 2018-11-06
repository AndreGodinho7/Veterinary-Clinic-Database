SELECT c.name as Animal_name, p.name as Owner_name, species_name, age, weight 
FROM person p, consult c, animal a
WHERE a.name = c.name 
AND p.vat =c.vat_owner 
AND weight > 30
AND (o like '%obesity%' or o like '%obese%');