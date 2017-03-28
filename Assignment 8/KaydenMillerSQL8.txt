-- 1.
SELECT DISTINCT First_name, Last_Name
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
WHERE Enroll_Date = 
(
	SELECT MIN(Enroll_Date)
	FROM Enrollment
)
ORDER BY Last_Name, First_Name;

-- 2.
SELECT Description, Section_no, Cost, Capacity
FROM Course c JOIN Section sec
	ON c.course_no = sec.course_no
WHERE Cost =
(
	SELECT MIN(Cost)
	FROM course
)
	AND Capacity <=
	(
		SELECT AVG(Capacity)
		FROM Section
	);
	
-- 3.
SELECT Course_No, Capacity
FROM 
(
	SELECT c.Course_no, SUM(Capacity) AS TOTAL_CAP, Capacity
	FROM Course c JOIN Section sec
		ON c.course_No = sec.course_no
	GROUP BY c.Course_No, capacity
)
WHERE Total_Cap < 
(
	SELECT AVG(Capacity)
	FROM Section
);

-- 4.
SELECT s.Student_id, COUNT(*) AS Most_Classes
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
GROUP BY s.Student_id
HAVING COUNT(*) = 
(
	SELECT MAX(COUNT(*))
	FROM Student s JOIN Enrollment e
		ON s.student_id = e.student_id
	GROUP BY s.Student_id
);

-- 5.
SELECT s.Student_id, e.Section_id
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
WHERE zip = 11365;

-- 6.
SELECT c.Course_No, c.Description
FROM Course c JOIN Section sec
	ON c.course_no = sec.course_no
JOIN Instructor i
	ON sec.instructor_id = i.instructor_id
WHERE i.First_Name = 'Nina'
	AND i.Last_Name = 'Schorin';
	
-- 7. Gives one less than the reqired 103 why?
SELECT First_Name, Last_Name
FROM Student s
MINUS
SELECT First_Name, Last_Name
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
ORDER BY Last_Name, First_Name;

-- 8. 
SELECT DISTINCT First_Name, Last_Name, Description, e.Section_id
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
JOIN Grade g
	ON e.student_id = g.student_id
	AND e.section_id = g.section_id
JOIN Section sec
	ON e.section_id = sec.section_id
JOIN Course c
	ON sec.course_no = c.course_no
WHERE grade_type_code = 'PA'
	AND numeric_grade =
(
	SELECT MIN(numeric_grade)
	FROM grade
	WHERE grade_type_code = 'PA'
);

-- 9.
SELECT StudentsEnrolled AS ENROLLED, Section_id, Cap
FROM 
(
	SELECT sec.section_id AS Section_id, COUNT(*) AS StudentsEnrolled, sec.capacity AS Cap
	FROM Enrollment e JOIN Section sec
		ON e.section_id = sec.section_id
	GROUP BY sec.section_id, sec.capacity
)
WHERE StudentsEnrolled >= Cap;

-- 10.
SELECT Course_no, Description, Cost
FROM Course c
WHERE cost =
(
	SELECT MIN(cost)
	FROM course
);