SELECT
COUNT(distinct pa.name, pa.VAT_owner, pa.date_timestamp, pa.VAT_assistant)/COUNT(distinct c.name, c.VAT_owner, c.date_timestamp) AS participations_average,
COUNT(distinct p.name, p.VAT_owner, p.date_timestamp, p.num)/COUNT(distinct c.name, c.VAT_owner, c.date_timestamp) AS procedures__average,
COUNT(distinct cd.code, cd.name, cd.VAT_owner, cd.date_timestamp)/COUNT(distinct c.name, c.VAT_owner, c.date_timestamp) AS consult_diagnosis_average,
COUNT(distinct pres.code, pres.name, pres.VAT_owner, pres.date_timestamp, pres.name_med, pres.lab, pres.dosage)/COUNT(distinct c.name, c.VAT_owner, c.date_timestamp) AS prescriptions_average
FROM
consult c NATURAL LEFT OUTER JOIN participation pa NATURAL LEFT OUTER JOIN procedures p
NATURAL LEFT OUTER JOIN consult_diagnosis cd NATURAL LEFT OUTER JOIN prescription pres
WHERE
year(c.date_timestamp) = 2017;


