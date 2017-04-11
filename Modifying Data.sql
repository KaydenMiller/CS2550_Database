SAVEPOINT _0;

INSERT INTO Customer
(custno, custFirstName, custLastName, custStreet, custCity, custState, custZip, custBal)
VALUES
('C000999', 'Kayden', 'Miller', '2520 W 1675 S', 'West Haven', 'UT', '8888888', 0.00);

SELECT * FROM customer;

UPDATE customer 
SET custNo = 'C0009999'
WHERE custLastName = 'Miller';

DELETE FROM customer
WHERE custLastName = 'Miller';

SELECT * FROM customer;

SAVEPOINT _1;

INSERT INTO ordLine
(ordno, prodno, qty)
VALUES
('o009909090', 'P8932876', 1);

SAVEPOINT _2;

INSERT INTO ordLine
(ordno, prodno, qty)
VALUES
-- YES THE FIRST CHAR Is an 0 (OH)
('O009909999', 'P8938888', 1);

SAVEPOINT _3;

INSERT INTO Enrollment
(student_id, section_id, final_grade, enroll_date, created_by, created_date, modified_by, modified_date)
SELECT student_id, 48, NULL, Sysdate, 'DAW', Sysdate, 'DAW', Sysdate
FROM student
WHERE Student_id IN (385, 54, 128, 345);

ROLLBACK SAVEPOINT _0;



-- COMMIT; Will make everything save DONT DO IT

/* USE THIS STYLE OF COMMENT INSTEAD OF SINGLE LINE */
