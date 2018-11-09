SELECT a.species_name AS sub_species, dc.name AS most_common_disease
FROM ((((consult_diagnosis cd NATURAL JOIN animal AS a) INNER JOIN species s ON (a.species_name = s.name)) INNER JOIN generalization_species gs ON (s.name = gs.name1)) INNER JOIN diagnosis_code dc ON (cd.code = dc.code))
WHERE gs.name2 = 'dog'
GROUP BY a.species_name, dc.name
HAVING COUNT(*) >= ALL(SELECT count(*)
	                   FROM ((((consult_diagnosis cd1 NATURAL JOIN animal AS a1) INNER JOIN species s1 ON (a1.species_name = s1.name)) INNER JOIN generalization_species gs1 ON (s1.name = gs1.name1)) INNER JOIN diagnosis_code dc1 ON (cd1.code = dc1.code))
	                   WHERE a.species_name = a1.species_name
	                   GROUP BY dc1.name);