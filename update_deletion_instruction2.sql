UPDATE ((produced_indicator NATURAL JOIN test_procedure) INNER JOIN indicator ON produced_indicator.indicator_name = indicator.name)
SET reference_value = reference_value*1.1
WHERE type = 'Blood' 
AND units = 'miligrams';