#select code from diagnosis_code where name = 'kidney failure';

insert into diagnosis_code values ('AAHA-15', 'end-stage renal disease');

update 
consult_diagnosis cd natural join test_procedure natural join produced_indicator, diagnosis_code dc
set cd.code = dc.code, cd.name = cd.name, cd.VAT_owner = cd.VAT_owner, cd.date_timestamp = cd.date_timestamp
where 
cd.code in (select code from diagnosis_code where name = 'kidney failure') and
dc.name = 'end-stage renal disease' and 
type = 'Blood' and indicator_name = 'creatine level' and value > 1.0;