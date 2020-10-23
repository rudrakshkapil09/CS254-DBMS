--Q1.
CREATE TABLE Employee (
  empno  NUMERIC(5) PRIMARY KEY,
  empname  VARCHAR(20),
  salary  NUMBER,
  empjob  VARCHAR(20),
  deptno  NUMERIC(5)
);

INSERT INTO Employee VALUES (1, 'John', 2000, 'Manager', 4);
INSERT INTO Employee VALUES (2, 'Jane', 3000, 'Manager', 5);
INSERT INTO Employee VALUES (3, 'Dave', 4000, 'Assistant', 4);
INSERT INTO Employee VALUES (4, 'Hope', 6000, 'Assistant', 5);
INSERT INTO Employee VALUES (5, 'Alex', 5000, 'CEO', 1);

DECLARE 
  CURSOR emp_cursor IS
    SELECT empname, empjob, salary, deptno FROM Employee;
BEGIN
  FOR emp_record IN emp_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('NAME   => ' || emp_record.empname);
    DBMS_OUTPUT.PUT_LINE('JOB    => ' || emp_record.empjob);
    DBMS_OUTPUT.PUT_LINE('SALARY => ' || emp_record.salary);
    DBMS_OUTPUT.PUT_LINE('DEPT   => ' || emp_record.deptno);
    DBMS_OUTPUT.PUT_LINE('---------------------------------');
  END LOOP;
END;



