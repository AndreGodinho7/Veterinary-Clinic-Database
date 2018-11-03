drop table if exists produced_indicator;
drop table if exists test_procedure;
drop table if exists radiography;
drop table if exists performed;
drop table if exists procedures;
drop table if exists indicator;
drop table if exists prescription;
drop table if exists medication;
drop table if exists consult_diagnosis;
drop table if exists diagnosis_code;
drop table if exists participation;
drop table if exists consult;
drop table if exists animal;
drop table if exists generalization_species;
drop table if exists species;
drop table if exists assistant;
drop table if exists veterinary;
drop table if exists client;
drop table if exists phone_number;
drop table if exists person;

create table person
	(VAT integer,
	 name varchar(255),
	 address_street varchar(255),
	 address_city varchar(255),
	 adress_zip varchar(255),
	 primary key (VAT));

create table phone_number
	(VAT integer,
	 phone integer,
	 primary key (VAT, phone),
	 foreign key (VAT) references person(VAT));

create table client
	(VAT integer,
	 primary key (VAT),
	 foreign key (VAT) references person(VAT));

create table veterinary 
	(VAT integer,
	 specialization varchar(255),
	 bio varchar(255),
	 primary key (VAT),
	 foreign key (VAT) references person(VAT));

create table assistant
	(VAT integer,
	 primary key(VAT),
	 foreign key(VAT) references person(VAT));

create table species
	(name varchar(255),
	 description varchar(255),
	 primary key(name));

create table generalization_species
	(name1 varchar(255),
	 name2 varchar(255),
	 primary key(name1),
	 foreign key(name1) references species(name),
	 foreign key(name2) references species(name));

create table animal
	(name varchar(255),
	 VAT integer,
	 species_name varchar(255),
	 colour varchar(255),
	 gender varchar(255),
	 birth_year timestamp,
	 age integer,
	 primary key(name, VAT),
	 foreign key(VAT) references client(VAT),
	 foreign key(species_name) references species(name));

create table consult
	(name varchar(255),
	 VAT_owner integer,
	 date_timestamp timestamp,
	 s varchar(255),
	 o varchar(255),
	 a varchar(255),
	 p varchar(255),
	 VAT_client integer,
	 VAT_vet integer,
	 weight numeric(20,2),
	 primary key(name, VAT_owner, date_timestamp),
	 foreign key(name, VAT_owner) references animal(name, VAT),
	 foreign key(VAT_client) references client(VAT),
	 foreign key(VAT_vet) references veterinary(VAT),
	 check(weight >= 0));

create table participation
	(name varchar(255),
	 VAT_owner integer,
	 date_timestamp timestamp,
	 VAT_assistant integer,
	 primary key(name, VAT_owner, date_timestamp, VAT_assistant),
	 foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp),
	 foreign key(VAT_assistant) references assistant(VAT));

create table diagnosis_code
	(code varchar(255),
	 name varchar(255),
	 primary key(code));

create table consult_diagnosis
	(code varchar(255),
	 name varchar(255),
	 VAT_owner integer,
	 date_timestamp timestamp,
	 primary key(code, name, VAT_owner, date_timestamp),
	 foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp),
	 foreign key(code) references diagnosis_code(code));

create table medication
	(name varchar(255),
	 lab varchar(255),
	 dosage varchar(255),
	 primary key(name, lab, dosage));

create table prescription
	(code varchar(255),
	 name varchar(255),
	 VAT_owner integer,
	 date_timestamp timestamp,
	 name_med varchar(255),
	 lab varchar(255),
	 dosage varchar(255),
	 regime varchar(255),
	 primary key(code, name, VAT_owner, date_timestamp, name_med, lab, dosage),
	 foreign key(code, name, VAT_owner, date_timestamp) references consult_diagnosis(code, name, VAT_owner, date_timestamp),
	 foreign key(name_med, lab, dosage) references medication(name, lab, dosage));

create table indicator
	(name varchar(255),
	 reference_value numeric(20,2),
	 units varchar(255),
	 description varchar(255),
	 primary key(name));

create table procedures
	(name varchar(255),
	 VAT_owner integer,
	 date_timestamp timestamp,
	 num integer,
	 description varchar(255),
	 primary key(name, VAT_owner, date_timestamp, num),
	 foreign key(name, VAT_owner, date_timestamp) references consult(name, VAT_owner, date_timestamp));

create table performed
	(name varchar(255),
	 VAT_owner integer,
	 date_timestamp timestamp,
	 num integer,
	 VAT_assistant integer,
	 primary key(name, VAT_owner, date_timestamp, num),
	 foreign key(name, VAT_owner, date_timestamp, num) references procedures(name, VAT_owner, date_timestamp, num),
	 foreign key(VAT_assistant) references assistant(VAT));

create table radiography
	(name varchar(255),
	 VAT_owner integer,
	 date_timestamp timestamp,
	 num integer,
	 file varchar(255),
	 primary key(name, VAT_owner, date_timestamp, num),
	 foreign key(name, VAT_owner, date_timestamp, num) references procedures(name, VAT_owner, date_timestamp, num));

create table test_procedure
	(name varchar(255),
	 VAT_owner integer,
	 date_timestamp timestamp,
	 num integer,
	 type char(5),
	 primary key(name, VAT_owner, date_timestamp, num),
	 foreign key(name, VAT_owner, date_timestamp, num) references procedures(name, VAT_owner, date_timestamp, num),
	 check(num >= 1));

create table produced_indicator
	(name varchar(255),
	 VAT_owner integer,
	 date_timestamp timestamp,
	 num integer,
	 indicator_name varchar(255),
	 value numeric(20,2),
	 primary key(name, VAT_owner, date_timestamp, num, indicator_name),
	 foreign key(name, VAT_owner, date_timestamp, num) references test_procedure(name, VAT_owner, date_timestamp, num),
	 foreign key(indicator_name) references indicator(name));

insert into person values (123456001, 'Frank', 'Dark Boulevard', 'Chicago','1111-123');
insert into person values (123456002, 'Charles', 'Arsenal Street', 'London','1100-123');
insert into person values (123456003, 'James', 'Flowers Avenue','San Francisco','3300-123');
insert into person values (123456011, 'Andrew', 'Roses Boulevard', 'Chicago','1111-123');
insert into person values (123456022, 'Peter', 'Central Boulevard', 'London','1100-123');
insert into person values (123456033, 'Ray', 'Second Boulevard','San Francisco','3300-123');
insert into person values (123456004, 'John Smith', 'Central Avenue','Seattle','2200-123');
insert into person values (123456005, 'Jennifer', 'White Avenue','Chicago','1111-124');
insert into person values (123456006, 'Jessica',  'Chelsea Street','London','1100-124');
insert into person values (123456007, 'Caroline', 'Central Street','Seattle','2200-124');
insert into person values (123456008, 'Bernard',  'Central Street','Seattle','2200-125');
insert into person values (123456009, 'Anne',  'Happy Boulevard','Chicago','1111-125');

insert into phone_number values (123456001, 961231231);
insert into phone_number values (123456002, 961231232);
insert into phone_number values (123456003, 961231233);
insert into phone_number values (123456011, 960000001);
insert into phone_number values (123456022, 960000002);
insert into phone_number values (123456033, 960000003);
insert into phone_number values (123456004, 961111114);
insert into phone_number values (123456005, 961111115);
insert into phone_number values (123456006, 961111116);
insert into phone_number values (123456007, 962222227);
insert into phone_number values (123456008, 962222228);
insert into phone_number values (123456009, 962222229);

insert into client values (123456001);
insert into client values (123456002);
insert into client values (123456003);
insert into client values (123456011);
insert into client values (123456022);
insert into client values (123456033);

insert into veterinary values (123456004,'Oncologist','John Smith is a 30 year old specialist in Oncology.'); 
insert into veterinary values (123456005,'Nutrition','Jennifer is a 34 year old specialist in Nutrition.');
insert into veterinary values (123456006,'Orthopedics','Jessica is a 26 year old specialist in Orthopedics.');

insert into assistant values (123456007); 
insert into assistant values (123456008);
insert into assistant values (123456009);

/* FALTA A GENERALIZATION SPECIES
insert into generalization_species values();
insert into generalization_species values();
insert into generalization_species values();
insert into generalization_species values();
insert into generalization_species values();
*/
insert into species values ('dog','abc');
insert into species values ('bird','abc');
insert into species values ('cat','abc');

insert into animal values ('Striker',123456001,'dog','brown','male','2008-11-05',10);
insert into animal values ('Jackson',123456002,'dog','black','female','2009-12-30',9);
insert into animal values ('Bob',123456003,'cat','white','male','2017-01-04',1);
insert into animal values ('Thunder',123456001,'dog','brown','female','2016-04-02',2);
insert into animal values ('Sparky',123456002,'cat','black','female','2014-10-10',4);
insert into animal values ('Max',123456003,'dog','yellow','male','2007-10-15',11);
insert into animal values ('Cookie',123456011,'bird','red','male','2005-10-13',13);
insert into animal values ('Rolls',123456022,'bird','blue','male','2017-05-01',1);
insert into animal values ('Jim',123456033,'bird','green','female','2010-02-05',8);
insert into animal values ('Cooper',123456011,'bird','yellow','female','2016-04-05',2);

insert into consult values ('Striker',123456001,'2018-01-01','Nausea, fever and a black mark on the neck., Cancer','Black Mark.','Cirurgy', 'No sun light.',123456001,123456004,35);
insert into consult values ('Jackson',123456002,'2018-02-01','Nausea, fever and a black mark on the neck., Cancer','Black Mark.','Cirurgy', 'No sun light.',123456002,123456004,20);
insert into consult values ('Bob',123456003,'2018-03-01','Nausea, fever and a black mark on the neck. Cancer','Black Mark.','Cirurgy', 'No sun light.',123456003,123456004,32);
insert into consult values ('Thunder',123456001,'2018-04-01','Overweight.', 'Obesity', 'Urine tests.','Lower caloric consumption and take pills.',123456001,123456005,17);
insert into consult values ('Sparky',123456002,'2018-05-01','Overweight.', 'Obese', 'Urine tests.','Lower caloric consumption and take pills.',123456002,123456005,15);
insert into consult values ('Max',123456003,'2018-06-01','Overweight.', 'Obesity', 'Urine tests.','Lower caloric consumption and take pills.',123456003,123456005,10);
insert into consult values ('Cookie',123456011,'2018-07-01','Dificulties on flying. Borken wing.','Blood analysis and radiography.','No touch.', 'Take pills.',123456011,123456006,1.38);
insert into consult values ('Rolls',123456022,'2018-08-01','Dificulties on flying. Borken wing.','Blood analysis and radiography.','No touch.', 'Take pills.',123456022,123456006,1.11);
insert into consult values ('Jim',123456033,'2018-09-01','Dificulties on flying. Borken wing.','Blood analysis and radiography.','No touch.', 'Take pills.',123456033,123456006,1.42);
insert into consult values ('Cooper',123456011,'2018-10-01','Dificulties on flying. Borken wing.','Blood analysis and radiography.','No touch.', 'Take pills.',123456011,123456006,1.52);

insert into participation values ('Striker',123456001,'2018-01-01', 123456007);
insert into participation values ('Jackson',123456002,'2018-02-01',123456007);
insert into participation values ('Bob',123456003,'2018-03-01',123456007);
insert into participation values ('Thunder',123456001,'2018-04-01',123456008);
insert into participation values ('Sparky',123456002,'2018-05-01',123456008);
insert into participation values ('Max',123456003,'2018-06-01',123456008);
insert into participation values ('Cookie',123456011,'2018-07-01',123456009);
insert into participation values ('Rolls',123456022,'2018-08-01',123456009);
insert into participation values ('Jim',123456033,'2018-09-01',123456009);
insert into participation values ('Cooper',123456011,'2018-10-01',123456009);

insert into diagnosis_code values ('AAHA-01','Striker');
insert into diagnosis_code values ('AAHA-02','Jackson');
insert into diagnosis_code values ('AAHA-03','Bob');
insert into diagnosis_code values ('AAHA-04','Thunder');
insert into diagnosis_code values ('AAHA-05','Sparky');
insert into diagnosis_code values ('AAHA-06','Max');
insert into diagnosis_code values ('AAHA-07','Cookie');
insert into diagnosis_code values ('AAHA-08','Rolls');
insert into diagnosis_code values ('AAHA-09','Jim');
insert into diagnosis_code values ('AAHA-10','Cooper');

insert into consult_diagnosis values ('AAHA-01','Striker',123456001,'2018-01-01');
insert into consult_diagnosis values ('AAHA-02','Jackson',123456002,'2018-02-01');
insert into consult_diagnosis values ('AAHA-03','Bob',123456003,'2018-03-01');
insert into consult_diagnosis values ('AAHA-04','Thunder',123456001,'2018-04-01');
insert into consult_diagnosis values ('AAHA-05','Sparky',123456002,'2018-05-01');
insert into consult_diagnosis values ('AAHA-06','Max',123456003,'2018-06-01');
insert into consult_diagnosis values ('AAHA-07','Cookie',123456011,'2018-07-01');
insert into consult_diagnosis values ('AAHA-08','Rolls',123456022,'2018-08-01');
insert into consult_diagnosis values ('AAHA-09','Jim',123456033,'2018-09-01');
insert into consult_diagnosis values ('AAHA-10','Cooper',123456011,'2018-10-01');

/* As dosages têm 1 de diferença porque no enunciado dosage é primary key */
insert into medication values ('med1','Lab-1','200 mg');
insert into medication values ('med2','Lab-2','500 mg');
insert into medication values ('med3','Lab-3','1 g');

insert into prescription values ('AAHA-01','Striker',123456001,'2018-01-01','med1','Lab-1','200 mg','1 dose after dinnher. 24 hours between doses. 1 month of treatment. Take 200 mg');
insert into prescription values ('AAHA-02','Jackson',123456002,'2018-02-01','med1','Lab-1','200 mg','1 dose after dinnher. 24 hours between doses. 1 month of treatment. Take 200 mg');
insert into prescription values ('AAHA-03','Bob',123456003,'2018-03-01','med1','Lab-1','200 mg','1 dose after dinnher. 24 hours between doses. 1 month of treatment. Take 200 mg');
insert into prescription values ('AAHA-04','Thunder',123456001,'2018-04-01','med2','Lab-2','500 mg','1 dose after lunch. 24 hours between doses. 1 month of treatment. Take 300 mg.');
insert into prescription values ('AAHA-05','Sparky',123456002,'2018-05-01','med2','Lab-2','500 mg','1 dose after lunch. 24 hours between doses. 1 month of treatment. Take 300 mg.');
insert into prescription values ('AAHA-06','Max',123456003,'2018-06-01','med2','Lab-2','500 mg','1 dose after lunch. 24 hours between doses. 1 month of treatment. Take 300 mg.');
insert into prescription values ('AAHA-07','Cookie',123456011,'2018-07-01','med3','Lab-3','1 g','2 doses after dinner. 24 hours between doses. 1 month of treatment. Take 500 mg');
insert into prescription values ('AAHA-08','Rolls',123456022,'2018-08-01','med3','Lab-3','1 g','2 doses after dinner. 24 hours between doses. 1 month of treatment. Take 500 mg');
insert into prescription values ('AAHA-09','Jim',123456033,'2018-09-01','med3','Lab-3','1 g','2 doses after dinner. 24 hours between doses. 1 month of treatment. Take 500 mg');
insert into prescription values ('AAHA-10','Cooper',123456011,'2018-10-01','med3','Lab-3','1 g','2 doses after dinner. 24 hours between doses. 1 month of treatment. Take 500 mg');

insert into indicator values ('Nitrites',100,'miligrams','This reference is the maximum for safety reasons.');
insert into indicator values ('Neurotrophils',300000,'% of the white blood cells present in the sample','This reference is the maximum for safety reasons.');
insert into indicator values ('Lymphocytes',300000,'% of the white blood cells present in the sample','This reference is the maximum for safety reasons.');
insert into indicator values ('Monocytes',400000,'% of the white blood cells present in the sample','This reference is the maximum for safety reasons.');

insert into procedures values ('Striker',123456001,'2018-01-01',2,'Cirurgy');
insert into procedures values ('Jackson',123456002,'2018-02-01',2,'Cirurgy');
insert into procedures values ('Bob',123456003,'2018-03-01',2,'Cirurgy');
insert into procedures values ('Thunder',123456001,'2018-04-01',1,'Blood analysis');
insert into procedures values ('Sparky',123456002,'2018-05-01',1,'Blood analysis');
insert into procedures values ('Max',123456003,'2018-06-01',1,'Blood analysis');
insert into procedures values ('Cookie',123456011,'2018-07-01',2,'Blood analysis and radiography');
insert into procedures values ('Rolls',123456022,'2018-08-01',2,'Blood analysis and radiography');
insert into procedures values ('Jim',123456033,'2018-09-01',2,'Blood analysis and radiography');
insert into procedures values ('Cooper',123456011,'2018-10-01',2,'Blood analysis and radiography');

insert into performed values ('Striker',123456001,'2018-01-01',2,123456007);
insert into performed values ('Jackson',123456002,'2018-02-01',2,123456007);
insert into performed values ('Bob',123456003,'2018-03-01',2,123456007);
insert into performed values ('Thunder',123456001,'2018-04-01',1,123456008);
insert into performed values ('Sparky',123456002,'2018-05-01',1,123456008);
insert into performed values ('Max',123456003,'2018-06-01',1,123456008);
insert into performed values ('Cookie',123456011,'2018-07-01',2,123456009);
insert into performed values ('Rolls',123456022,'2018-08-01',2,123456009);
insert into performed values ('Jim',123456033,'2018-09-01',2,123456009);
insert into performed values ('Cooper',123456011,'2018-10-01',2,123456009);

insert into radiography values ('Cookie',123456011,'2018-07-01',2,'INSERT PATH');
insert into radiography values ('Rolls',123456022,'2018-08-01',2,'INSERT PATH');
insert into radiography values ('Jim',123456033,'2018-09-01',2,'INSERT PATH');
insert into radiography values ('Cooper',123456011,'2018-10-01',2,'INSERT PATH');

insert into test_procedure values ('Thunder',123456001,'2018-04-01',1,'Urine');
insert into test_procedure values ('Sparky',123456002,'2018-05-01',1,'Urine');
insert into test_procedure values ('Max',123456003,'2018-06-01',1,'Urine');
insert into test_procedure values ('Cookie',123456011,'2018-07-01',2,'Blood');
insert into test_procedure values ('Rolls',123456022,'2018-08-01',2,'Blood');
insert into test_procedure values ('Jim',123456033,'2018-09-01',2,'Blood');
insert into test_procedure values ('Cooper',123456011,'2018-10-01',2,'Blood');

insert into produced_indicator values ('Thunder',123456001,'2018-04-01',1,'Nitrites',30);
insert into produced_indicator values ('Sparky',123456002,'2018-05-01',1,'Nitrites',40);
insert into produced_indicator values ('Max',123456003,'2018-06-01',1,'Nitrites',50);
insert into produced_indicator values ('Cookie',123456011,'2018-07-01',2,'Monocytes',100000);
insert into produced_indicator values ('Rolls',123456022,'2018-08-01',2,'Neurotrophils',200000);
insert into produced_indicator values ('Jim',123456033,'2018-09-01',2,'Lymphocytes',2500000);
insert into produced_indicator values ('Cooper',123456011,'2018-10-01',2,'Lymphocytes',50000);
