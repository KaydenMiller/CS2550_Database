-- 1.
SELECT TO_CHAR(AVG(Cost), '9999.99')
FROM Course;

-- 2.
SELECT SUM(COUNT(*))
FROM Student
GROUP BY Registration_Date
HAVING TO_CHAR(Registration_Date, 'Mon YYYY') = 'Feb 2007';

-- 3. 
SELECT TO_CHAR(AVG(Numeric_Grade), '99.99') AS Average, MAX(Numeric_Grade) AS Highest, MIN(Numeric_Grade) AS Lowest
FROM Grade
WHERE Section_ID = 147;

-- 4.
SELECT City, State, COUNT(*) AS ZIPCODES
FROM Zipcode
GROUP BY City, State
HAVING COUNT(*) > 2
ORDER BY State, City;

-- 5.
SELECT Section_ID, COUNT(*) AS Enrolled
FROM Enrollment
WHERE TO_CHAR(Enroll_Date, 'MM/DD/YYYY') = '02/21/2007'
GROUP BY Section_ID
ORDER BY Enrolled DESC;

-- 6.
SELECT Student_ID, Section_ID, TO_CHAR(AVG(Numeric_Grade), '99.9999') AS AverageGrade
FROM Grade
WHERE Section_ID = 86
GROUP BY Student_ID, Section_ID
ORDER BY Student_ID;

-- 7.
SELECT Student_ID, COUNT(*) AS Sections
FROM Enrollment
GROUP BY Student_ID
HAVING Student_ID = 250;

-- 8.
SELECT Section_ID, MIN(Numeric_Grade) AS Lowscore
FROM Grade
WHERE Grade_Type_Code = 'QZ'
GROUP BY Section_ID
HAVING MIN(Numeric_Grade) > 80
ORDER BY Section_ID;


-- 9.
SELECT Employer, COUNT(*)
FROM Student
GROUP BY Employer
HAVING COUNT(*) > 5
ORDER BY COUNT(*);

-- 10.
SELECT Section_ID, COUNT(*), MIN(Numeric_Grade)
FROM Grade
WHERE Grade_Type_Code = 'PA'
GROUP BY Section_ID
HAVING COUNT(*) > 15
ORDER BY Section_ID;
