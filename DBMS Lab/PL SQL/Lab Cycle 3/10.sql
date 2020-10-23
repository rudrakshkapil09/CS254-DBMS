--Q10.

DECLARE 
  v1 Employee.empno%type:=:v1;
  v2 Employee.name%type:=:v2;
  v3 Employee.salary%type:=:v3;
  v4 Employee.deptno%type:=:v4;
BEGIN
  Insert into Employee values(v1, v2, v3, v4);
  commit;
END;