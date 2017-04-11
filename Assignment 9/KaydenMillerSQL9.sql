-- 1.
SELECT s.student_id, Last_name, First_Name, Employer
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
GROUP BY s.student_id, Last_Name, First_name, Employer
HAVING COUNT(*) >=
(
	SELECT MAX(COUNT(*))
	FROM Student s JOIN Enrollment e
		ON s.student_id = e.student_id
	GROUP BY s.student_id
)
ORDER BY Last_Name, First_Name;

-- 2.
SELECT i.zip, i.first_name, i.last_name, i.phone
FROM 
(
	SELECT student_id, instructor_id
	FROM Section sec JOIN enrollment e
		ON sec.section_id = e.section_id
) taughtBy 
JOIN instructor i
	ON taughtBy.instructor_id = i.instructor_id
JOIN student s
	ON taughtBY.student_id = s.student_id
WHERE s.zip = i.zip
ORDER BY first_name;

-- 3. 
SELECT First_Name, Last_Name, City, 'Student' AS ROLE
FROM Student s JOIN Zipcode zip
	ON s.zip = zip.zip
WHERE s.zip = 10025
UNION
SELECT First_Name, Last_Name, City, 'Instructor' AS ROLE
From Instructor i JOIN Zipcode zip
	ON i.zip = zip.zip
WHERE i.zip = 10025
ORDER BY Role, Last_Name, First_Name;

-- 4.
SELECT sec.location, sec.sections, stud.students
FROM 
(
	SELECT Location, COUNT(*) AS SECTIONS
	FROM Section
	GROUP BY location
) sec JOIN 
(
	SELECT location, COUNT(*) AS STUDENTS
	FROM Section sec JOIN Enrollment e
		ON sec.section_id = e.section_id
	GROUP BY Location
) stud
	ON stud.location = sec.location
ORDER BY sec.location;

-- 5.
SELECT Grade_Type_Code, Numeric_Grade AS GRADE
FROM Section sec JOIN Enrollment e
	ON sec.section_id = e.section_id
JOIN Grade g
	ON e.student_id = g.student_id
	AND e.section_id = g.section_id
WHERE e.section_id = 95
	AND e.student_id = 112
UNION ALL
SELECT 'Average for student 112', ROUND(AVG(Grade), 2)
FROM
(
	SELECT Grade_Type_Code, Numeric_Grade AS GRADE
	FROM Section sec JOIN Enrollment e
		ON sec.section_id = e.section_id
	JOIN Grade g
		ON e.student_id = g.student_id
		AND e.section_id = g.section_id
	WHERE e.section_id = 95
		AND e.student_id = 112
);

-- 6.
SELECT First_Name, Last_Name, NVL(COUNT(sec.section_id), 0) AS Sections
FROM  Instructor i LEFT JOIN Section sec
	ON i.instructor_id = sec.instructor_id
GROUP BY First_Name, Last_Name;

-- 7.
-- OK this is just wacko
SELECT DISTINCT c.Course_No, Description
FROM course c JOIN Section sec
	ON c.course_no = sec.course_no
WHERE sec.section_id IN
(
	SELECT DISTINCT section_id 
	FROM
	(
		SELECT g.student_id, g.section_id, COUNT(*)
		FROM grade g LEFT OUTER JOIN enrollment e
			ON g.section_id = e.section_id
			AND g.student_id = e.student_id
		WHERE grade_type_code IN ('FI', 'QZ', 'HM', 'MT', 'PA', 'PJ')
		HAVING COUNT(*) >= 5
		GROUP BY g.student_id, g.section_id
	)
);

-- 8.
-- Why does this return an extra student?
SELECT zip.zip, zip.city, COUNT(Distinct s.student_id) AS Students
FROM zipcode zip JOIN student s
	ON s.zip = zip.zip
LEFT OUTER JOIN enrollment e
	ON s.student_id = e.student_id	
WHERE zip.city ='Stamford'
GROUP BY zip.zip, zip.city;
	
-- 9.
SELECT c.Course_No, Description, NVL(COUNT(e.student_id), 0) AS Enrollments
FROM Course c LEFT OUTER JOIN Section sec
	ON c.course_no = sec.course_no
LEFT OUTER JOIN Enrollment e
	ON sec.section_id = e.section_id
WHERE Description LIKE '%Programming%'
GROUP BY c.course_no, Description 
ORDER BY Enrollments DESC;

-- 10. 
-- Why is this returning nothing? if there is at least one student in this zipcode this should return that student and it does not.
SELECT student_id, First_Name, Last_Name
FROM student s 
WHERE s.zip = '617'
ORDER BY Last_Name, First_Name;

