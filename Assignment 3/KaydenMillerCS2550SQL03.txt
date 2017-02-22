-- 1.
SELECT First_Name, Last_Name, Phone
FROM Student
WHERE Registration_Date = To_Date('02/13/2007', 'MM/DD/YYYY')
ORDER BY Last_Name, First_Name;

-- 2.
SELECT Course_No, Section_ID, Start_Date_Time
FROM Section
WHERE Location = 'L509'
ORDER BY Start_Date_Time;

-- 3.
SELECT Course_No, Section_ID, Start_Date_Time, Instructor_ID, Capacity
FROM Section
WHERE Start_Date_Time >= To_Date('01 July 2007', 'DD Month YYYY') AND Start_Date_Time < To_Date('August 2007', 'Month YYYY')
ORDER BY Start_Date_Time, Course_No;

-- 4.
SELECT Student_ID, Section_ID, Final_Grade
FROM Enrollment
WHERE Final_Grade IS NOT NULL AND TO_CHAR(Enroll_Date, 'Mon YYYY') = 'Jan 2007';

-- 5.
SELECT (TO_DATE('January 11, 2016', 'Month DD, YYYY') + 109) AS "End of Semester"
FROM dual;

-- 6.
SELECT Course_No, Location
FROM Section
WHERE Location LIKE 'L%' AND MOD(CAST(SUBSTR(Location, -1, 1) AS INT), 2) = 0;

-- 7.
SELECT Last_Name, First_Name
FROM Student
WHERE ZIP = 11368 AND registration_date = created_date + 3;

-- 8.
SELECT First_Name, Last_Name, TO_CHAR(MONTHS_BETWEEN(SYSDATE, Registration_Date) / 12, '999.99') AS "Years Enrolled"
FROM Student
WHERE SUBSTR(Phone, 1, 3) LIKE '212'
ORDER BY MONTHS_BETWEEN(SYSDATE, Registration_Date) DESC;

-- 9.
SELECT DISTINCT TO_CHAR(Start_Date_Time, 'HH:MI')
FROM Section;

-- 10.
SELECT Student_ID, Section_ID, TO_CHAR(Enroll_Date, 'HH:MI AM') AS EnrollTime
FROM Enrollment
WHERE TO_CHAR(Enroll_Date, 'HH:MI AM') = '10:19 AM' 
ORDER BY Student_ID;


