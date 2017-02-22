SELECT CustFirstName AS "First Name", CustLastName AS "Last Name", CustStreet AS "Street" 
FROM Customer
WHERE (CustFirstName NOT LIKE '%n') 
  AND (CustLastName NOT LIKE '%n')
ORDER BY CustStreet, CustFirstName, CustLastName DESC;

SELECT CustFirstName As "First Name", SUBSTR(CustFirstName, -3, -1) AS "Sub String Test"
FROM Customer;

-- LPAD, RPAD, SUBSTR, LTRIM, RTRIM

SELECT CustFirstName, CustLastName, CustBal,
  CASE CustState
  WHEN 'WA' THEN 'Washington'
  WHEN 'CO' THEN 'Colorado'
  END AS "State Name"
FROM customer;

-- To_Char(DATE, 'FORMAT') To_Date()
-- Pg. 192, 193 has char abreviations
SELECT ProdName, ProdMFG, To_Char(ProdNextShipDate, 'WW W Day Month DD, YYYY HH24:MI:SS AM') AS FULLDATE
FROM Product
WHERE ProdNextShipDate = '01-FEB-07';

-- JANUARY 01 1970 is called the EPIC this is the date where time is positive from midnight on (the beginnning of the day)
SELECT ProdName, ProdMFG, To_Char(ProdNextShipDate, 'WW W Day Month DD, YYYY HH24:MI:SS AM') AS FULLDATE
FROM Product
WHERE ProdNextShipDate < To_Date('Feb 01 2007', 'Mon DD YYYY')
ORDER BY ProdNextShipDate;

-- SYSDATE: pulls from the systems date
-- FROM dual -> dual is a temp table given to us by orical
SELECT TO_CHAR(SYSDATE, 'Mon DD YYYY HH:MI:SS') AS Time
FROM dual;

-- Dates can have mathmatics done to them
SELECT SYSDATE + 1 AS Time
FROM dual;

SELECT TO_CHAR(SYSDATE + 12/24, 'MM-DD-YYYY HH24:MI AM') AS Time
FROM dual;

SELECT EXTRACT(MONTH FROM SYSDATE) + 1 AS Month
FROM dual;

SELECT ADD_MONTHS(SYSDATE, 3) AS Future
FROM dual;

-- SELECT ROUND(MONTHS_BETWEEN(SYSDATE, created_date), 2)
SELECT TO_CHAR(MONTHS_BETWEEN(SYSDATE, registration_date), '999.99')
FROM student;

-- AGGRIGATE FUNCTIONS
SELECT MIN(ProdPrice), MAX(ProdPrice), SUM(ProdPrice), AVG(ProdPrice), MIN(ProdNextShipDate), MAX(ProdNextShipDate)
FROM Product;

SELECT MIN(QTY), MAX(QTY), SUM(QTY), ROUND(AVG(QTY), 2), TO_CHAR(AVG(QTY), '999.99')
FROM ordline;

SELECT TO_CHAR(MAX(ProdPrice), '999.99') AS "Max Product Price", ProdMFG
FROM Product
GROUP BY ProdMFG
ORDER BY Max(ProdPrice) DESC;

SELECT DISTINCT custCity
FROM Customer
ORDER BY custCity;

-- HAVING AND GROUP BY
-- ORDER OF OPERATIONS: FROM WHERE GROUP BY HAVING SELECT ORDER BY
SELECT TO_CHAR(MAX(ProdPrice), '999.99') AS "Max Product Price", ProdMFG
FROM Product
GROUP BY ProdMFG
HAVING MAX(ProdPrice) > 100
ORDER BY Max(ProdPrice) DESC;

-- COUNT does not count anything with a null value thus try to always use *
-- COUNTs the number of rows
SELECT COUNT(*), ProdMFG
FROM Product
HAVING MAX(ProdPrice) > 100
GROUP BY ProdMFG
ORDER BY COUNT(*);

SELECT COUNT(*), ProdMFG, ProdName
FROM Product
GROUP BY ProdMFG, ProdName;

SELECT MAX(custBal) - AVG(CustBal) AS Difference
FROM Customer;

SELECT MIN(OrdDate)
FROM OrderTbl;

SELECT COUNT(*), CustState
FROM Customer
GROUP BY CustState;

-- NVL = Null Value if true fill "whatever was entered"
SELECT COUNT(*), NVL(EmpCommRate, 0.00)
FROM Employee
GROUP BY EmpCommRate;

SELECT SUM(ProdPrice), ProdMFG
FROM Product
GROUP BY ProdMFG;

SELECT COUNT(*), OrdState
FROM OrderTbl
WHERE OrdState = 'WA'
GROUP BY OrdState;

SELECT COUNT(*), CustNo
FROM OrderTbl
GROUP BY CustNo
HAVING Count(*) > 1;

SELECT COUNT(*), NVL(EmpNo, 'OTHER EMP')
FROM OrderTbl
GROUP BY EmpNo;