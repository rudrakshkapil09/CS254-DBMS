--Q8.
DECLARE 
  v1 Employee.empno%type:=:v1;
  v2 Employee.salary%type;
BEGIN
  Select salary 
  into v2
  from Employee
  where empno = v1;
  DBMS_output.put_line('Current Salary => $' || v2);

  if v2 < 5000 then 
    update Employee
    set salary = v2*1.1
    where empno = v1;
    DBMS_output.put_line('Updated!');

    select salary
    into v2
    from Employee
    where empno = v1;

    DBMS_output.put_line('New Salary => $' || v2);

  else 
    delete from Employee
    where empno = v2;
    DBMS_output.put_line('Deleted!');

  end if;
  commit;
End;