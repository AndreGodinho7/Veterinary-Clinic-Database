SELECT c.name AS Animal_name, p.name AS Owner_name, species_name, age, weight, date_timestamp
FROM (consult as c natural join animal as a) inner join person as p on (a.VAT = p.VAT)
WHERE weight > 30
AND (o LIKE '%obesity%' OR o LIKE '%obese%')
group by a.name, a.VAT, date_timestamp
having date_timestamp in (SELECT max(date_timestamp)
						  FROM (consult as c1 natural join animal as a1) inner join person as p1 on (a1.VAT = p1.VAT)
						  WHERE a1.name = a.name
						  and a1.VAT = a.VAT
						  group by a.name, a.VAT);