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