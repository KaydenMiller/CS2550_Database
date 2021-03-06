-- 1.
SELECT First_Name ||' '|| Last_Name AS "FULL NAME"
FROM Student s JOIN Zipcode zip
ON s.zip = zip.zip
WHERE zip.city = 'Newark'
AND zip.state = 'NJ'
ORDER BY Last_Name, First_Name;

-- 2.
SELECT c.Course_NO, prereq.Course_NO AS "Prereqisite Course Number", prereq.Description AS "Prereqisite Course Description"
FROM Course c JOIN Course prereq
ON prereq.course_no = c.prerequisite
WHERE c.course_no >= 300
AND c.course_no < 400;

-- 3.
SELECT s.Course_NO, c.Description
FROM Course c JOIN Section s 
ON c.course_no = s.course_no
JOIN Instructor i
ON s.Instructor_ID = i.Instructor_ID
WHERE i.first_name = 'Charles'
  AND i.last_name = 'Lowry'
  AND c.course_no >= 100
  AND c.course_no < 200
ORDER BY c.course_no;

-- 4.
SELECT gtw.grade_type_code, 
  CASE gtw.grade_type_code
    WHEN 'FI' THEN 'Final'
    WHEN 'HM' THEN 'Homework'
    WHEN 'MT' THEN 'Midterm'
    WHEN 'PA' THEN 'Participation'
    WHEN 'QZ' THEN 'Quiz'
  END Description, number_per_section
FROM Section s JOIN Grade_Type_Weight gtw
ON s.section_id = gtw.section_id
WHERE course_no = 144;

-- 5.
SELECT Last_Name||', '||First_Name AS "Student Name"
FROM Student s JOIN Enrollment e
ON s.student_id = e.student_id
JOIN Grade g
ON e.student_id = g.student_id
GROUP BY Last_Name, First_Name
HAVING AVG(numeric_grade) >= 93
ORDER BY Last_Name;

-- 6.
SELECT i.First_Name, i.Last_Name, i.Street_address, zip.city, zip.state, zip.zip
FROM Instructor i JOIN Zipcode zip
ON i.zip = zip.zip
JOIN Section s
ON i.instructor_id = s.instructor_id
GROUP BY i.First_Name, i.Last_Name, i.Street_address, zip.city, zip.state, zip.zip
HAVING count(*) < 10;

-- 7.
SELECT c.course_no, count(*) AS Enrolled
FROM Course c JOIN Section s
ON c.course_no = s.course_no
JOIN Enrollment e
ON s.section_id = e.section_id
WHERE c.prerequisite IS NULL
GROUP BY c.course_no
ORDER BY Enrolled DESC;

-- 8.
SELECT s.First_Name, s.Last_Name, s.Phone, e.enroll_date, TO_CHAR(e.enroll_date, 'HH:MI AM')
FROM Student s JOIN Zipcode zip
ON s.zip = zip.zip
JOIN Enrollment e
ON s.student_id = e.student_id
WHERE zip.city = 'Flushing'
  AND zip.state = 'NY'
  AND e.enroll_date <= TO_DATE('02-02-2007 10:19 AM', 'MM-DD-YYYY HH:MI AM');
  --AND e.enroll_date = TO_DATE('02-02-07', 'MM-DD-YY');

-- 9.
SELECT Course_no
FROM Section s JOIN Grade_Type_Weight gtw
ON s.section_id = gtw.section_id
WHERE gtw.grade_type_code = 'PJ'
ORDER BY course_no;

-- 10. FI, HM, MT, PA, PJ, QZ 
SELECT MAX(Numeric_Grade) AS HIGHEST_FINAL_GRADE
FROM Section s JOIN Enrollment e
ON s.section_id = e.section_id
JOIN Grade g
ON e.student_id = g.student_id AND e.section_id = g.section_id
WHERE s.course_no = 145
  AND g.grade_type_code = 'FI';

