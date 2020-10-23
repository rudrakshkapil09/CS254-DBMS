--Q1.

CREATE TABLE Student (
  student_id INTEGER ,
  fname VARCHAR(10),
  lname VARCHAR(10),
  street VARCHAR(10),
  city VARCHAR(10),
  state VARCHAR(10),
  zip NUMERIC(6),
  PRIMARY KEY (student_id)
);

CREATE TABLE Instructor (
  instructor_id INTEGER,
  instructor_name VARCHAR(20),
  PRIMARY KEY (instructor_id)
);

CREATE TABLE Relation (
  instructor_id INTEGER,
  student_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id),
  PRIMARY KEY (student_id, instructor_id)
);

INSERT INTO Student VALUES (1, 'John', 'Doe', 'ABC', 'Hyderabad', 'Indias', 700705);
INSERT INTO Student VALUES (2, 'Jane', 'Doe', 'ABC', 'Hyderabad', 'Indias', 700705);
INSERT INTO Student VALUES (3, 'Stev', 'Rog', '123', 'Atlantiss', 'USofAM', 100102);
INSERT INTO Student VALUES (4, 'Jake', 'Dog', 'QWE', 'Frankfurt', 'German', 500000);
INSERT INTO Student VALUES (5, 'Finn', 'Hum', 'TYU', 'Warsawwww', 'Poland', 500600);

INSERT INTO Instructor VALUES (1, 'Steve Madden');
INSERT INTO Instructor VALUES (2, 'The Who');
INSERT INTO Instructor VALUES (3, 'The Kink');
INSERT INTO Instructor VALUES (4, 'The Kooks');

INSERT INTO Relation VALUES (1, 1);
INSERT INTO Relation VALUES (1, 2);
INSERT INTO Relation VALUES (1, 3);
INSERT INTO Relation VALUES (1, 4);
INSERT INTO Relation VALUES (2, 2);
INSERT INTO Relation VALUES (2, 3);
INSERT INTO Relation VALUES (2, 4);
INSERT INTO Relation VALUES (3, 3);
INSERT INTO Relation VALUES (3, 4);
INSERT INTO Relation VALUES (4, 4);
INSERT INTO Relation VALUES (4, 5);


CREATE OR REPLACE PACKAGE School_api AS
  SUBTYPE message IS VARCHAR(30);
  PROCEDURE Get_name_address(stud_id IN INTEGER, 
                             f OUT student.fname%type,
                             l OUT student.lname%type,
                             s OUT student.street%type,
                             ci OUT student.city%type,
                             st OUT student.state%type,
                             z OUT student.zip%type);
  FUNCTION Instructor_stat(inst_ID INTEGER) RETURN message;
  PROCEDURE Remove_student1 (stud_id INTEGER);
  PROCEDURE Remove_student2 (stud_id INTEGER, p_ri VARCHAR2 DEFAULT 'R');
END School_api;


CREATE OR REPLACE PACKAGE BODY School_api AS 
  PROCEDURE Get_name_address(stud_id IN INTEGER, 
                             f OUT student.fname%type,
                             l OUT student.lname%type,
                             s OUT student.street%type,
                             ci OUT student.city%type,
                             st OUT student.state%type,
                             z OUT student.zip%type) AS
    BEGIN
      SELECT fname, lname, street, city, state, zip
      INTO f, l, s, ci, st, z
      FROM Student
      WHERE student_id = stud_id;
    END Get_name_address;

  FUNCTION Instructor_stat (inst_id INTEGER) RETURN message AS
    class_count NUMBER;
    BEGIN 
      SELECT num
      INTO class_count
      FROM (SELECT COUNT(*) AS num
            FROM Relation
            GROUP BY instructor_id
            HAVING instructor_id = inst_id);

      IF class_count < 3 THEN
        RETURN ('Classes => ' || class_count);
      ELSE 
        RETURN ('Need a vacation!');
      END IF;
    END Instructor_stat;

  PROCEDURE Remove_Student1 (stud_id INTEGER) AS
  BEGIN
    DELETE FROM Relation 
    WHERE student_id = stud_id;
    DELETE FROM Student 
    WHERE student_id = stud_id;
  END Remove_Student1;

  PROCEDURE Remove_Student2 (stud_id INTEGER, p_ri IN VARCHAR2 DEFAULT 'R') AS
    flag NUMBER;
  BEGIN
    SELECT num
    INTO flag 
    FROM (SELECT COUNT(*) as num
          FROM RELATION
          GROUP BY student_id
          HAVING student_id = stud_id);

    IF flag > 0 THEN 
      IF p_ri = 'R' THEN
        DBMS_OUTPUT.PUT_LINE('Cannot delete. Dependencies violated.');
      ELSIF p_ri = 'C' THEN
       DBMS_OUTPUT.PUT_LINE('Deleting...');
        DELETE FROM Relation 
        WHERE student_id = stud_id;
        DELETE FROM Student WHERE student_id = stud_id;
     ELSE 
      DBMS_OUTPUT.PUT_LINE('Invalid Option.');
     END IF;
    ELSE 
      DBMS_OUTPUT.PUT_LINE('Deleting...');
      DELETE FROM Student 
      WHERE student_id = stud_id;
    END IF;
  END Remove_Student2;
END School_api;



--PART 1
DECLARE 
  v_id Student.student_id%type:=:v_id;
  f student.fname%type;
  l student.lname%type;
  s student.street%type;
  ci student.city%type;
  st student.state%type;
  z student.zip%type;
BEGIN
  School_api.Get_name_address(v_id, f, l, s, ci, st, z);
  DBMS_OUTPUT.PUT_LINE('ID         => ' || v_id);
  DBMS_OUTPUT.PUT_LINE('First Name => ' || f);
  DBMS_OUTPUT.PUT_LINE('Last Name  => ' || l);
  DBMS_OUTPUT.PUT_LINE('Street     => ' || s);
  DBMS_OUTPUT.PUT_LINE('City       => ' || ci);
  DBMS_OUTPUT.PUT_LINE('State      => ' || st);
  DBMS_OUTPUT.PUT_LINE('Zip        => ' || z);
END;

--PART 2
DECLARE 
  message VARCHAR(30);
  v_id Instructor.instructor_id%type:=:v_id;
BEGIN
  message := School_api.Instructor_stat(v_id);
  DBMS_OUTPUT.PUT_LINE(message);
END;  


--PART 3
DECLARE 
  v_id Student.student_id%type:=:v_id;
BEGIN
  School_api.Remove_student1(v_id);
END;

--PART 4
DECLARE 
  stud_id INTEGER:=:stud_id;
BEGIN
  School_api.Remove_Student2(stud_id, 'C');
END;



