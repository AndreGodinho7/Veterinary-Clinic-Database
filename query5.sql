SELECT diagnosis_code.name AS possible_diagnosis, COUNT(DISTINCT name_med) AS number_of_distinct_medication_name
FROM (consult_diagnosis NATURAL LEFT OUTER JOIN prescription) INNER JOIN diagnosis_code ON (consult_diagnosis.code = diagnosis_code.code)
GROUP BY diagnosis_code.name
ORDER BY COUNT(DISTINCT name_med);