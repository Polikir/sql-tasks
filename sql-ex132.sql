

create or replace function transfeer1(
	num int
)
returns bigint
language plpgsql as $$

DECLARE
   num1    INTEGER ;
   var1 VARCHAR;
   
begin
	num1 := num;
 
	while num1 > 0 loop
    	var1 := concat(cast(mod(num1,2) as char(1)) , var1);
    	num1 := (num1 / 2);
	end loop;
	return cast(var1 as bigint);

end;$$;

select transfeer1(trip_no) from Trip
