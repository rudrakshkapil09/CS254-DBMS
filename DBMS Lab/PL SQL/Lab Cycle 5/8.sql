--Q8.
DECLARE 
  v_a NUMBER:=:v_a;
  v_b NUMBER:=:v_b;
  v_c NUMBER;

FUNCTION raise_to_second (X IN NUMBER, Y IN NUMBER) RETURN NUMBER IS
BEGIN
  RETURN X**Y;
END;

BEGIN
  v_c:=raise_to_second(v_a, v_b);
  DBMS_OUTPUT.PUT_LINE('ANSWER => ' || v_c);
END;
