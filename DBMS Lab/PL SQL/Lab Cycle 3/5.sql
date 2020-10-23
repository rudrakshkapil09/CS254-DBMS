--Q5.
DECLARE
    v1 NUMBER:=:v1;		--amount
    v2 NUMBER:=:v2;		--time
    v3 NUMBER;			--rate
	v4 NUMBER;			--interest
BEGIN
	if v2 > 10 then
		v3 := 0.08;
	else v3 := 0.06;
	end if;
	
	v4 := v1 + v1*v2*v3; 
	 
    dbms_output.put_line('INTEREST => ' || v4);
END;