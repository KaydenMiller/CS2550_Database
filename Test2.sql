SELECT CustFirstName, CustLastName, EmpFirstName, EmpLastName
FROM Customer, Employee;

SELECT CustFirstName, CustLastName, EmpFirstName, EmpLastName
FROM Customer JOIN OrderTbl
ON customer.custno = ordertbl.custno
JOIN Employee
ON ordertbl.empno = employee.empno;

SELECT CustFirstName, CustLastName, EmpFirstName, EmpLastName
FROM Customer c JOIN OrderTbl o
ON c.custno = o.custno
JOIN Employee e
ON o.empno = e.empno;

-- ANSI Standard
SELECT CustFirstName, CustLastName, ProdName
FROM Customer c JOIN OrderTbl o
ON c.custno = o.custno
JOIN ordline ol
ON o.ordno = ol.ordno
JOIN Product p
ON ol.prodno = p.prodno
WHERE custState = 'WA'
ORDER BY CustLastName, CustFirstName;

-- USING reqires that the id be the same accross both tables
SELECT CustFirstName, CustLastName, ProdName
FROM Customer c JOIN Ordertbl o
USING (custno)
JOIN Ordline ol
USING (ordno)
JOIN Product
USING (prodno)
WHERE custState = 'WA'
ORDER BY CustLastName, CustFirstName;

-- ORACLE ONLY
SELECT CustFirstName, CustLastName, ProdName
FROM Customer c, Ordertbl o, OrdLine ol, Product p 
WHERE c.custno = o.custno
AND o.ordno = ol.ordno
AND ol.prodno = p.prodno
AND custState = 'WA'
ORDER BY CustLastName, CustFirstName;

--/////////////////////////////////////////////////////////////////////////////
SELECT EmpFirstName, EmpLastName, EmpPhone
FROM Employee e JOIN ordertbl o
ON e.empno = o.empno
JOIN customer c
ON o.custno = c.custno
WHERE custCity = 'Seattle';

SELECT o.OrdNo, o.OrdDate, c.custno, c.custstate, o.ordstate
FROM Customer c JOIN OrderTbl o
ON c.custno = o.custno
WHERE custState != ordState;

SELECT c.custNo, c.custLastName, count(*) AS Num_Orders
FROM Customer c JOIN OrderTbl o
ON c.custno = o.custno
WHERE custState = 'CO'
AND ordDate >= TO_DATE('01-JAN-2007', 'DD-MON-YYYY')
AND ordDate < TO_DATE('01-FEB-2007', 'DD-MON-YYYY')
GROUP BY c.custNo, c.custLastName;

SELECT ProdMfg, ProdName, COUNT(*)
FROM Product p JOIN Ordline ol
ON p.prodno = ol.prodno
GROUP BY ProdMfg, ProdName
HAVING COUNT(*) >= 5;

SELECT e.empFirstName, e.empLastName, s.empFirstName AS supfirst, s.empLastName as SUPFirst
FROM Employee e JOIN Employee s
ON e.supempno = s.empno;

SELECT custCity, custState, COUNT(*)
FROM Customer
GROUP BY custcity, custstate
ORDER BY COUNT(*) DESC;
--/////////////////////////////////////////////////////////////////////////////
-- SUBQUERYS / Aggrigate Functions / JOINS

-- IN keyword is used when it is possable to return multiple value
SELECT EmpFirstName, EmpLastName, CustFirstName, CustLastName
FROM Employee e JOIN OrderTbl o
ON e.empno = o.empno
JOIN Customer c
ON o.custno = c.custno
WHERE c.custbal IN (SELECT MIN(CustBal) FROM customer);

SELECT custLastName
FROM
  (SELECT EmpFirstName, EmpLastName, CustFirstName, CustLastName, custbal
  FROM Employee e JOIN OrderTbl o
  ON e.empno = o.empno
  JOIN Customer c
  ON o.custno = c.custno)
WHERE custBal = (SELECT MIN(CustBal) FROM Customer);
