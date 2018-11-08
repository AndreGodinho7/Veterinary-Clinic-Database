CREATE VIEW dim_date AS
SELECT DISTINCT date_timestamp, year(date_timestamp) AS year, month(date_timestamp) AS month, day(date_timestamp) AS day FROM consult
