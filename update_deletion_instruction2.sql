update ((produced_indicator natural join test_procedure) inner join indicator on produced_indicator.indicator_name = indicator.name)
set reference_value = reference_value*1.1
where type = 'Blood' 
and units = 'miligrams';