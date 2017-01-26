SELECT CustFirstName AS "First Name", CustLastName AS "Last Name", CustStreet AS "Street" 
FROM Customer
WHERE (CustFirstName NOT LIKE '%n') 
  AND (CustLastName NOT LIKE '%n')
ORDER BY CustStreet, CustFirstName, CustLastName DESC;