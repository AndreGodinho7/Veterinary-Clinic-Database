select distinct p.name, p.address_street, p.address_city, p.address_zip 
from person p, animal a 
where p.VAT = a.VAT
and p.VAT not in (select p.VAT
			  	  from person p, animal a 
			  	  where p.VAT = a.VAT
			  	  and (species_name not like '%bird%'));