--Q2.
DECLARE 
  CURSOR emp_cursor IS
    SELECT empno, salary FROM Employee;
BEGIN
  FOR emp_record IN emp_cursor LOOP
    IF emp_record.salary < 1200 THEN
       UPDATE Employee 
       SET salary = emp_record.salary*1.08
       WHERE empno = emp_record.empno;
    ELSIF emp_record.salary < 2500 THEN
       UPDATE Employee 
       SET salary = emp_record.salary*1.12
       WHERE empno = emp_record.empno;
    ELSIF emp_record.salary < 4500 THEN
       UPDATE Employee 
       SET salary = emp_record.salary*1.15
       WHERE empno = emp_record.empno;
    ELSE 
       UPDATE Employee 
       SET salary = emp_record.salary*1.2
       WHERE empno = emp_record.empno;
    END IF;
  END LOOP;
END;