CREATE VIEW facts_consults AS
SELECT animal_name, animal_vat, dd.date_timestamp AS timestamp, COUNT(DISTINCT num) AS num_procedures, COUNT(DISTINCT name_med, dosage, lab) AS num_medications
FROM (dim_animal da NATURAL JOIN animal) NATURAL join (dim_date NATURAL JOIN consult) NATURAL LEFT OUTER JOIN procedures NATURAL LEFT OUTER JOIN prescription 
GROUP BY timestamp, animal_name;
