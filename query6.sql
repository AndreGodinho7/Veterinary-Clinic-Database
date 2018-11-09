SELECT
count(pa.date_timestamp)/count(c.date_timestamp) AS participations_average,
count(p.date_timestamp)/count(c.date_timestamp) AS procedures__average,
count(cd.date_timestamp)/count(c.date_timestamp) AS consult_diagnosis_average,
count(pres.date_timestamp)/count(c.date_timestamp) AS prescriptions_average
FROM
consult c NATURAL LEFT OUTER JOIN participation pa NATURAL LEFT OUTER JOIN procedures p
NATURAL LEFT OUTER JOIN consult_diagnosis cd NATURAL LEFT OUTER JOIN prescription pres
WHERE
year(c.date_timestamp) = 2017;