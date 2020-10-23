--Q4.
	DECLARE
		v1 NUMBER:=:v1;	--BASIC
		v2 NUMBER;		--HRA
		v3 NUMBER;		--DA
	BEGIN
		if v1 > 15000 then 
			v2 := 0.12 * v1;
			v3 := 0.08 * v1;
		elsif v1 > 12000 then
			v2 := 0.10 * v1;
			v3 := 0.06 * v1;
		elsif v1 > 9000 then
			v2 := 0.07 * v1;
			v3 := 0.04 * v1;
		else
			v2 := 0.05 * v1;
			v3 := 200;
		end if;
		
		dbms_output.put_line('HRA ' || v2);
		dbms_output.put_line('DA' || v3);
		
	end;