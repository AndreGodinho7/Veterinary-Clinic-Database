SELECT animal_name AS name, animal_vat AS vat, dd.date_timestamp AS timestamp, COUNT(distinct num) AS num_procedures, COUNT(distinct name_med, dosage, lab) AS num_medications
FROM (dim_animal da NATURAL JOIN animal) NATURAL JOIN (dim_date dd NATURAL JOIN consult) NATURAL LEFT OUTER JOIN procedures NATURAL LEFT OUTER JOIN prescription 
GROUP BY timestamp, name
ORDER BY name;