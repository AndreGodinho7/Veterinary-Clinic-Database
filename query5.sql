SELECT code AS possible_diagnosis, COUNT(DISTINCT name_med) AS number_of_distinct_medication_name
FROM prescription
GROUP BY code
ORDER BY COUNT(distinct name_med);
