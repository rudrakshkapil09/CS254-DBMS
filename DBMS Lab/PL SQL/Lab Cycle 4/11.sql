--Q11.
CREATE OR REPLACE TRIGGER Row_Inserted
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Trigger Fired!');
END;

INSERT INTO Employee VALUES (9, 'Adam', 500, 'Mailman', 1, 'MAY-04-2019');
