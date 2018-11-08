select code from diagnosis_code where name = 'kidney failure';

insert into diagnosis_code values ('AAHA-15', 'end-stage renal disease');

update consult_diagnosis natural join consult natural join procedures natural join test_procedure natural join produced_indicator
set code = 'AAHA-15'
where 
value > 1.0 and indicator_name = 'creatine level' and type = 'Blood' and code = 'AAHA-04';