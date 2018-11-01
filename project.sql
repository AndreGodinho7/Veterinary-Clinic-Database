drop table if exists animal;
drop table if exists phone_number;
drop table if exists client;
drop table if exists veterinary;
drop table if exists assistant;
drop table if exists person;
drop table if exists generalization_species;
drop table if exists species;

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
