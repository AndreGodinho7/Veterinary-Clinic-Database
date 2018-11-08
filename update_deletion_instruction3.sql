delete client
	from client
inner 
	join person
		on person.VAT = client.VAT
	where name = 'John Smith';