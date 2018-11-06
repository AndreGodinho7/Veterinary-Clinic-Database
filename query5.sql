select code as possible_diagnosis, count(distinct name_med) as number_of_distinct_medication_name
from prescription
group by code
order by count(distinct name_med);