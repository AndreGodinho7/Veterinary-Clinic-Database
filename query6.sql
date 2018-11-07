select
count(pa.date_timestamp)/count(c.date_timestamp),
count(p.date_timestamp)/count(c.date_timestamp),
count(cd.date_timestamp)/count(c.date_timestamp),
count(pres.date_timestamp)/count(c.date_timestamp)
from
consult c natural left outer join participation pa natural left outer join procedures p
natural left outer join consult_diagnosis cd natural left outer join prescription pres
where
c.date_timestamp >= '20170101 00:00' and c.date_timestamp < '20180101 00:00';