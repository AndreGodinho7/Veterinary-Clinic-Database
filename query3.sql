SELECT c.name AS animal_name, p.name AS owner_name, species_name AS species, age, weight
FROM (consult c natural join animal AS a) inner join person p on (a.VAT = p.VAT)
WHERE weight > 30
AND (o like '%obesity%' OR o like '%obese%')
GROUP by a.name, a.VAT, date_timestamp
HAVING date_timestamp IN (select max(date_timestamp)
                          FROM (consult c1 natural join animal AS a1) INNER JOIN person p1 ON (a1.VAT = p1.VAT)
                          WHERE a1.name = a.name
                          AND a1.VAT = a.VAT
                          GROUP BY a.name, a.VAT);