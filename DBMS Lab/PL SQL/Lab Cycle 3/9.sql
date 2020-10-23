--Q9.
Declare
  v1 = Employee.deptno%type:=:v1;
Begin
  Delete from Employee where deptno = 1;
  commit;
End;