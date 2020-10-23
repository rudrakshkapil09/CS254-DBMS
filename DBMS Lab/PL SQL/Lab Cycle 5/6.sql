--Q6.
DECLARE 
  dept Employee.deptno%type:=:dept;
  op_sum Employee.salary%type:=0;
  v_sum Employee.salary%type:=0;
  CURSOR emp_cursor IS
    SELECT empname, salary, deptno FROM Employee;

PROCEDURE Display_Details (X IN Employee.deptno%type, Y OUT Employee.salary%type) AS
BEGIN
  FOR emp IN emp_cursor LOOP
    IF emp.deptno = X THEN 
      v_sum:= v_sum+emp.salary;
      DBMS_OUTPUT.PUT_LINE('Name   => ' || emp.empname);
      DBMS_OUTPUT.PUT_LINE('Salary => ' || emp.salary);
    END IF;
  END LOOP;
  Y:= v_sum;
END;

BEGIN
  Display_Details(dept, op_sum);
  DBMS_OUTPUT.PUT_LINE('-----------------'); 
  DBMS_OUTPUT.PUT_LINE('SUM => ' || op_sum); 
END;
