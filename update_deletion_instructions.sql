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

delete from person
where name = 'John Smith';

/********************** 4th SQL INSTRUCTION **********************/


