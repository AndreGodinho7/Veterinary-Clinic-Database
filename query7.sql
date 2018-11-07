select a.species_name, dc.name
from diagnosis_code dc, consult_diagnosis cd, consult c, animal a, species s, generalization_species gs
where dc.code = cd.code
and cd.name = c.name
and c.name = a.name
and a.species_name = s.name 
and a.species_name = gs.name1
and gs.name2 like '%dog%'
group by a.species_name, dc.code
having count(*) >= all(select count(*)
							 from diagnosis_code dc, consult_diagnosis cd, consult c, animal a, species s, generalization_species gs
							 where dc.code = cd.code
							 and cd.name = c.name
							 and c.name = a.name
							 and a.species_name = s.name 
							 and a.species_name = gs.name1
							 and gs.name2 like '%dog%'
							 group by a.species_name, dc.code);


select a.species_name, dc.name, count(*)
from diagnosis_code dc, consult_diagnosis cd, consult c, animal a, species s, generalization_species gs
where dc.code = cd.code
and cd.name = c.name
and c.name = a.name
and a.species_name = s.name 
and a.species_name = gs.name1
and gs.name2 like '%dog%'
group by a.species_name, dc.code
having count(*) >= 1;
