select a.species_name as specific_species_name, dc.name
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
					   and s.name = specific_species_name
					   and gs.name1 = specific_species_name
					   and gs.name2 like '%dog%'
					   group by specific_species_name, dc.code);


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

---------------

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
					   and a.species_name in(select a.species_name
											 from diagnosis_code dc, consult_diagnosis cd, consult c, animal a, species s, generalization_species gs
											 where dc.code = cd.code
											 and cd.name = c.name
											 and c.name = a.name
											 and a.species_name = s.name 
											 and a.species_name = gs.name1
											 and gs.name2 like '%dog%'
											 group by species_name)
					   group by a.species_name, dc.code);

---------------

select a.species_name, dc.name, count(*)
from diagnosis_code dc, consult_diagnosis cd, consult c, animal as a, species s, generalization_species gs
where dc.code = cd.code
and cd.name = c.name
and c.name = a.name
and a.species_name = s.name 
and a.species_name = gs.name1
and gs.name2 like '%dog%'
group by a.species_name, dc.code













select a.species_name
from diagnosis_code dc, consult_diagnosis cd, consult c, animal a, species s, generalization_species gs
where dc.code = cd.code
and cd.name = c.name
and c.name = a.name
and a.species_name = s.name 
and a.species_name = gs.name1
and gs.name2 like '%dog%'
group by species_name;











select a.species_name as specific_species_name, dc.name
from (((diagnosis_code dc natural join consult_diagnosis cd) natural join consult) inner join animal a), species s, generalization_species gs
where a.species_name = s.name 
and a.species_name = gs.name1
and gs.name2 like '%dog%'
group by a.species_name, dc.code
having count(*) >= 1;

select *
from ((consult_diagnosis cd inner join diagnosis_code dc on (cd.code = dc.code)) inner join consult c on (cd.name = c.name)) natural join animal a;
