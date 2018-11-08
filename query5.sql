<<<<<<< HEAD
select diagnosis_code.name as possible_diagnosis, count(distinct name_med) as number_of_distinct_medication_name
from (consult_diagnosis natural left outer join prescription) inner join diagnosis_code on (consult_diagnosis.code = diagnosis_code.code)
group by diagnosis_code.name
order by count(distinct name_med);
=======
SELECT code AS possible_diagnosis, COUNT(DISTINCT name_med) AS number_of_distinct_medication_name
FROM prescription
GROUP BY code
ORDER BY COUNT(distinct name_med);
>>>>>>> 227f0408b728fc8283fca354e75c206eb09fa513
