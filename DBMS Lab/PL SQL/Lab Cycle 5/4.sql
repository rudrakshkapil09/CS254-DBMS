--Q4.
DECLARE 
  CURSOR emp_cursor IS
    SELECT empname, salary FROM Employee;
BEGIN
  FOR emp_record IN emp_cursor LOOP 
    DBMS_OUTPUT.PUT_LINE('NAME   => ' || emp_record.empname);
    DBMS_OUTPUT.PUT_LINE('SALARY => ' || emp_record.salary);
    DBMS_OUTPUT.PUT_LINE('BONUS  => ' || emp_record.salary*0.12);
    DBMS_OUTPUT.PUT_LINE('---------------------------------');
  END LOOP;
END; 