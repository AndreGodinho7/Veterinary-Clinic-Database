/********************** QUERY 1 **********************/

CREATE INDEX name_index ON 
person(name);

DROP INDEX name_index ON 
person;


CREATE INDEX VAT_owner_index ON
consult(VAT_owner);

DROP INDEX VAT_owner_index ON
consult;


CREATE INDEX VAT_vet_index ON
consult(VAT_vet);

DROP INDEX VAT_vet_index ON
consult;


/********************** QUERY 2 **********************/

CREATE INDEX reference_value_index ON
indicator(reference_value);

DROP INDEX reference_value_index ON
indicator;