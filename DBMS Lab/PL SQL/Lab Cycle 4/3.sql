--Q3.
DECLARE 
  dept  Employee.deptno%type:=:dept;
  CURSOR emp_cursor IS
    SELECT empname, empjob, salary, deptno FROM Employee;
BEGIN
  FOR emp_record IN emp_cursor LOOP 
    IF emp_record.deptno = dept THEN
      DBMS_OUTPUT.PUT_LINE('NAME   => ' || emp_record.empname);
      DBMS_OUTPUT.PUT_LINE('JOB    => ' || emp_record.empjob);
      DBMS_OUTPUT.PUT_LINE('SALARY => ' || emp_record.salary);
      DBMS_OUTPUT.PUT_LINE('---------------------------------');
    END IF;
  END LOOP;
END; 