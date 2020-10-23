--Q3.
DECLARE
    v1 NUMBER:=:v1;
    v2 NUMBER:=:v2;
    v3 NUMBER;
BEGIN

v3 := v1*(0.1);
if v2 > 10 then
v3 := v3+500;
end if;

dbms_output.put_line('Bonus => ' || v3);


END;