--Q7.
DECLARE 
  v2 Employee.name%type;
BEGIN
  Select name 
  into v2
  from Employee
  where salary = (select max(salary) from employee);

  Dbms_output.put_line('Highest paid => ' || v2);

  Select name 
  into v2
  from Employee
  where salary = (select min(salary) from employee);

  Dbms_output.put_line('Lowest paid => ' || v2);

End;