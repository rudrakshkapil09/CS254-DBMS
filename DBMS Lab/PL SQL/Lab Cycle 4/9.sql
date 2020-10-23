--Q9.
CREATE TABLE Department (
  deptno NUMERIC(5),
  deptname VARCHAR(30),
  PRIMARY KEY (deptno)
);

CREATE TABLE Employee (
  empno NUMERIC(5),
  empname VARCHAR(30),
  salary NUMBER,
  empjob VARCHAR(10),
  deptno NUMERIC(5),
  doj DATE,
  PRIMARY KEY (empno),
  FOREIGN KEY (deptno) REFERENCES Department(deptno)
);

CREATE TABLE Relation (
  empname varchar(30),
  deptname varchar(30)
);

INSERT INTO Department VALUES (1, 'Sales');
INSERT INTO Department VALUES (2, 'HR');
INSERT INTO Department VALUES (3, 'IT');
INSERT INTO Department VALUES (4, 'Management');

INSERT INTO Employee VALUES (1, 'John', 2000, 'Manager', 4, 'MAY-23-2019');
INSERT INTO Employee VALUES (2, 'Jane', 3000, 'Manager', 3, 'JUNE-13-2018');
INSERT INTO Employee VALUES (3, 'Dave', 4000, 'Assistant', 4, 'AUGUST-15-2017');
INSERT INTO Employee VALUES (4, 'Hope', 6000, 'Assistant', 3, 'MARCH-30-2018');
INSERT INTO Employee VALUES (5, 'Alex', 5000, 'CEO', 1, 'FEBRUARY-24-2018');

CREATE OR REPLACE TRIGGER Updater
BEFORE INSERT ON Employee
FOR EACH ROW
DECLARE 
  dname department.deptname%type;
BEGIN
  SELECT deptname into dname
  FROM Department
  WHERE Department.deptno = :NEW.deptno;
  INSERT INTO Relation VALUES (:NEW.empname, dname);
END;

INSERT INTO Employee VALUES (6, 'Cathy', 1000, 'Assistant', 4, '05-24-2018');