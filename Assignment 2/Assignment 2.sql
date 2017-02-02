-- 1.
SELECT First_Name||' '||Last_Name AS "Student Name", Phone
FROM Student
WHERE Employer = 'New York Culture'
ORDER BY Last_Name, Phone;

-- 2.
SELECT DISTINCT Employer
FROM Student
WHERE Employer LIKE '%Co.%'
ORDER BY Employer;

-- 3.
SELECT Last_Name||', '||SUBSTR(First_Name, 1, 1)||'.' AS "Student Name", phone
FROM Student
WHERE phone LIKE '617%'
ORDER BY Last_Name;

-- 4.
SELECT First_Name||' '||Last_Name AS Instructor, Street_address
FROM Instructor
WHERE zip IS NULL;

-- 5. 
SELECT zip
FROM ZIPCODE
WHERE city = 'Jackson Heights' AND state = 'NY'
ORDER BY zip;

-- 6.
SELECT Course_No, Location
FROM Section
WHERE Location LIKE '%10'
ORDER BY Location;

-- 7.
SELECT
  CASE State
    WHEN 'MA' THEN 'Massachusetts'
    WHEN 'OH' THEN 'Ohio'
    WHEN 'PR' THEN 'Puerto Rico'
    WHEN 'WV' THEN 'West Verginia'
  END "State Name",
  State, City
FROM zipcode
WHERE state IN ('MA', 'OH', 'PR', 'WV')
ORDER BY State;

-- 8.
SELECT Salutation||'. '||First_Name||' '||Last_Name||' '||Street_Address AS "Instructor Address"
FROM Instructor
WHERE zip = '10015'
ORDER BY Last_Name;

-- 9.
SELECT Student_ID, Numeric_Grade
FROM Grade
WHERE Section_ID = 152 AND Grade_Type_Code = 'QZ'
ORDER BY Numeric_Grade DESC;

-- 10.
SELECT Student_ID, Numeric_Grade, 
  CASE 
    WHEN Numeric_Grade >= 85 THEN 'Pass'
    ELSE 'Fail'
  END "Result"
FROM Grade
WHERE Section_ID = 156 AND Grade_Type_Code = 'FI'
ORDER BY student_ID;