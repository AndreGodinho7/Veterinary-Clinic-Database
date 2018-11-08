CREATE VIEW dim_date AS
SELECT DISTINCT date_timestamp, year(date_timestamp) AS year, month(date_timestamp) AS month, day(date_timestamp) AS day FROM consult

CREATE VIEW dim_animal AS
SELECT name AS animal_name, vat AS animal_vat, species_name, age FROM animal;


