--Q12.
DECLARE 
  v1 NUMBER:=:v1;
  v2 NUMBER:=:v2;
  v3 NUMBER;
  bigger_than_first EXCEPTION;
BEGIN
  if v2 > v1 then raise bigger_than_first;
  end if;

  v3 := v1/v2;
  dbms_output.put_line('Quotient = ' || v3);

EXCEPTION
  WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Dividing by 0');
  WHEN BIGGER_THAN_FIRST THEN
    DBMS_OUTPUT.PUT_LINE('First should be bigger');
END;