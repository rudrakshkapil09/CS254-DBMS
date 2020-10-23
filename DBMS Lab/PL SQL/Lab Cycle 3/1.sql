--Q1.
DECLARE
    v1 INTEGER:=:v1;
    v2 INTEGER:=:v2;
    v3 INTEGER;
BEGIN
    v3 := v1+v2;
    dbms_output.put_line('SUM => ' || v3);
    v3 := v3/2;
    dbms_output.put_line('AVG => ' || v3);
END;