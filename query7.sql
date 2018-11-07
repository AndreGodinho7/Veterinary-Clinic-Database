select a.species_name, dc.name
from diagnosis_code dc, consult_diagnosis cd, consult c, animal a, species s, generalization_species gs
where dc.code = cd.code
and cd.name = c.name
and c.name = a.name
and a.species_name = s.name 
and a.species_name = gs.name1
and gs.name2 like '%dog%'
group by a.species_name
having count(dc.code) >= all(select count(dc.code)
							 from diagnosis_code dc, consult_diagnosis cd, consult c, animal a, species s, generalization_species gs
							 where dc.code = cd.code
							 and cd.name = c.name
							 and c.name = a.name
							 and a.species_name = s.name 
							 and a.species_name = gs.name1
							 and gs.name2 like '%dog%');







and count(distinct dc.name) >all(select count(distinct dc.name)
								  from diagnosis_code dc, consult_diagnosis cd, consult c, animal a, species s, generalization_species gs
								  where dc.code = cd.code
								  and cd.name = c.name
								  and c.name = a.name
								  and a.species_name = s.name 
								  and a.species_name = gs.name1
								  and gs.name2 like '%dog%');



select a.species_name, dc.code
from diagnosis_code dc, consult_diagnosis cd, consult c, animal a, species s, generalization_species gs
where dc.code = cd.code
and cd.name = c.name
and c.name = a.name
and a.species_name = s.name 
and a.species_name = gs.name1
and gs.name2 like '%dog%';