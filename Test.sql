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





