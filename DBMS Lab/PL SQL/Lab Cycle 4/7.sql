--Q7.
DECLARE 
  v_emp Employee.empno%type:=:v_emp;
  v_amt Employee.salary%type:=:v_amt;

PROCEDURE update_Sal (X IN Employee.empno%type, Y IN NUMBER) AS
BEGIN
  UPDATE Employee
  SET salary = salary + Y
  WHERE empno = X;
END;

BEGIN
  update_Sal(v_emp, v_amt);
END;
