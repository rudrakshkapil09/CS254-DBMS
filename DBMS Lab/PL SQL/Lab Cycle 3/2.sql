--Q2.
DECLARE
	year INTEGER:=:year;
BEGIN
	if mod(year,4)=0 then
		if mod(year,100)=0 then
		if mod(year,400)=0 then
		dbms_output.put_line('Leap Year');
		else 
		dbms_output.put_line('Not Leap Year');
		end if;
		else
		dbms_output.put_line('Leap Year');
		end if;
		else
		dbms_output.put_line('Not leap year');
		end if;		
END;