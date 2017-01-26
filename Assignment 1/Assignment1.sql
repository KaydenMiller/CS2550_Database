SELECT Salutation, First_Name, Last_Name
FROM Instructor
ORDER BY Last_Name, First_Name;

SELECT DISTINCT Location
FROM Section
ORDER BY location;

SELECT First_Name, Last_Name
FROM Instructor
WHERE First_Name LIKE 'T%'
ORDER BY Last_Name ASC;

SELECT Phone, First_Name||' '||Last_Name AS FULLNAME, Employer
FROM Student
WHERE Last_Name = 'Torres'
ORDER BY Employer;

SELECT Course_No, Description
FROM Course
WHERE Course.Prerequisite IN
  (SELECT Course_No FROM Course WHERE Course_No = 350)
ORDER BY Course_No;

SELECT Course_No, Description, Cost
FROM Course
WHERE Cost < 1100 AND Course_No >= 200 AND Course_No <= 299
ORDER BY Course_No;

SELECT Course_No, Section_ID, Location
FROM Section
WHERE (Course_No >= 100 AND Course_No <= 199) AND (Location = 'L214' OR Location = 'L509')
ORDER BY Location, Course_No;

SELECT Course_No, Section_ID, Capacity
FROM Section
WHERE Capacity IN (12, 15)
ORDER BY Course_No, Section_ID;

SELECT Student_ID, Numeric_Grade
FROM Grade
WHERE Section_ID = 141 AND Grade_Type_Code = 'MT'
ORDER BY Student_ID, Numeric_Grade;

SELECT Course_No, Description
FROM Course
WHERE (Course_No >= 300 AND Course_No <= 399) AND course.prerequisite IS NOT NULL
ORDER BY Description;