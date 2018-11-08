/********************** 1st SQL INSTRUCTION **********************/

update person
set address_street = 'White Avenue', address_city = 'New York'
where name = 'John Smith';

/********************** 2nd SQL INSTRUCTION **********************/

update ((produced_indicator natural join test_procedure) inner join indicator on produced_indicator.indicator_name = indicator.name)
set reference_value = reference_value*1.1
where type = 'Blood' 
and units = 'miligrams';

/********************** 3rd SQL INSTRUCTION **********************/

delete client
	from client
inner 
	join person
		on person.VAT = client.VAT
	where name = 'John Smith';

/********************** 4th SQL INSTRUCTION **********************/

select code from diagnosis_code where name = 'kidney failure';

insert into diagnosis_code values ('AAHA-15', 'end-stage renal disease');

update consult_diagnosis natural join consult natural join procedures natural join test_procedure natural join produced_indicator
set code = 'AAHA-15'
where 
value > 1.0 and indicator_name = 'creatine level' and type = 'Blood' and code = 'AAHA-04';