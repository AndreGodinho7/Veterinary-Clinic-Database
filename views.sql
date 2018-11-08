CREATE VIEW dim_date AS
SELECT DISTINCT date_timestamp, year(date_timestamp) AS year, month(date_timestamp) AS month, day(date_timestamp) AS day FROM consult

CREATE VIEW dim_animal AS
SELECT name AS animal_name, vat AS animal_vat, species_name, age FROM animal;

CREATE VIEW facts_consults AS
SELECT animal_name, animal_vat, dd.date_timestamp AS timestamp, COUNT(DISTINCT num) AS num_procedures, COUNT(DISTINCT name_med, dosage, lab) AS num_medications
FROM (dim_animal da NATURAL JOIN animal) NATURAL join (dim_date dd natural join consult) NATURAL LEFT OUTER JOIN procedures NATURAL LEFT OUTER JOIN prescription 
GROUP BY timestamp;
