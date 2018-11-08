select
count(pa.date_timestamp)/count(c.date_timestamp) as participations_average,
count(p.date_timestamp)/count(c.date_timestamp) as procedures__average,
count(cd.date_timestamp)/count(c.date_timestamp) as consult_diagnosis_average,
count(pres.date_timestamp)/count(c.date_timestamp) as prescriptions_average
from
consult c natural left outer join participation pa natural left outer join procedures p
natural left outer join consult_diagnosis cd natural left outer join prescription pres
where
year(c.date_timestamp) = 2017;