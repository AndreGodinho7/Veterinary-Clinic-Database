#select code from diagnosis_code where name = 'kidney failure';

INSERT INTO diagnosis_code VALUES ('AAHA-15', 'end-stage renal disease');

UPDATE
consult_diagnosis cd NATURAL JOIN test_procedure NATURAL JOIN produced_indicator, diagnosis_code dc
SET cd.code = dc.code, cd.name = cd.name, cd.VAT_owner = cd.VAT_owner, cd.date_timestamp = cd.date_timestamp
WHERE 
cd.code IN (SELECT code FROM diagnosis_code WHERE name = 'kidney failure') AND
dc.name = 'end-stage renal disease' AND
type = 'Blood' AND indicator_name = 'creatine level' AND value > 1.0;