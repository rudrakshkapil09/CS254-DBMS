--Q5.
DECLARE
  v_a NUMBER:=:v_a;
  v_b NUMBER:=:v_b;  
  v_result NUMBER:=1;
  bigger_than_second EXCEPTION;

PROCEDURE Multi_table(X IN NUMBER, Y IN NUMBER) AS 
BEGIN 
  IF X > Y THEN
    RAISE bigger_than_second;
  END IF;
  
  FOR i IN X..Y LOOP
    v_result:=v_result * i;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Result => ' || v_result);
EXCEPTION
  WHEN bigger_than_second THEN 
    DBMS_OUTPUT.PUT_LINE('Second Number Should Be Bigger');
END;

BEGIN
  Multi_table(v_a, v_b);
END;

