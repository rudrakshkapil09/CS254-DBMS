--Q6.
create table Employee (
    empno INTEGER primary key,
    name VARCHAR(10),
    salary NUMBER,
    deptno INT);

	DECLARE 
	  v1 Employee.empno%type:=:v1;
	  v2 Employee.name%type;
	  v3 Employee.salary%type;
	BEGIN
	  Select name, salary 
	  Into v2, v3
	  From EMPLOYEE
	  Where empno = v1;

	  Dbms_output.put_line('Name   => ' || v2);
	  Dbms_output.put_line('Salary => ' || v3);
	End;