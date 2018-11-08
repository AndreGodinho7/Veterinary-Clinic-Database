select diagnosis_code.name as possible_diagnosis, count(distinct name_med) as number_of_distinct_medication_name
from (consult_diagnosis natural left outer join prescription) inner join diagnosis_code on (consult_diagnosis.code = diagnosis_code.code)
group by diagnosis_code.name
order by count(distinct name_med);