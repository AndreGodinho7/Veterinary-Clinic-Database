select a.species_name, dc.name
from ((((diagnosis_code as dc inner join 
	consult_diagnosis as cd on (dc.code = cd.code)) inner join 
	animal as a on (cd.name = a.name and cd.VAT_owner = a.VAT)) inner join 
	species as s on (a.species_name = s.name)) inner join 
	generalization_species gs on (s.name = gs.name1))
where gs.name2 = 'dog'
group by a.species_name, dc.name
having count(*) >= all(select count(*)
					   from ((((diagnosis_code as dc1 inner join 
					   			consult_diagnosis as cd1 on (dc1.code = cd1.code)) inner join 
					   			animal as a1 on (cd1.name = a1.name and cd1.VAT_owner = a1.VAT)) inner join 
					   			species as s1 on (a1.species_name = s1.name)) inner join 
					   			generalization_species as gs1 on (s1.name = gs1.name1)) 
					   where a.species_name = a1.species_name
					   group by dc1.name);


/*PÔR MAIS FUNCIONAL*/

select *
from (consult_diagnosis natural join animal) inner join species on (a.species_name = s.name)) inner join