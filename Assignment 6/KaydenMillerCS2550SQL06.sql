-- 1.
SELECT student_id
FROM enrollment e
JOIN section s ON e.section_id = s.section_id
WHERE Course_no BETWEEN 100 AND 199
GROUP BY student_id
HAVING COUNT( *) =
	(
		SELECT MAX(Number_Sections)
		FROM
			(
				SELECT student_id, COUNT( *) AS Number_Sections
				FROM enrollment e
				JOIN section s ON e.section_id = s.section_id
				WHERE Course_no BETWEEN 100 AND 199
				GROUP BY student_id
			)
	) ;
-- 2.
SELECT Student_ID, Last_Name, First_Name
FROM student s
JOIN enrollment e 
	ON s.student_id = e.student_id
JOIN grade g      
	ON e.section_id = g.section_id 
	AND e.student_id = g.student_id
JOIN section sec  
	ON sec.section_id = e.section_id
WHERE sec.course_no = 230
	AND sec.section_id = 100
	AND g.grade_type_code = 'FI'
	AND numeric_grade =
	(
		SELECT MAX(numeric_grade)
		FROM
			(
				SELECT First_Name, Last_Name, Numeric_Grade
				FROM student s
				JOIN enrollment e ON s.student_id = e.student_id
				JOIN grade g      ON e.section_id = g.section_id AND e.student_id = g.student_id
				JOIN section sec  ON sec.section_id = e.section_id
				WHERE sec.course_no = 230
					AND sec.section_id = 100
					AND g.grade_type_code = 'FI'
			)
	) ;
	
-- 3.

-- All of the instructors who teach
SELECT s.Instructor_ID
FROM Section s JOIN Instructor i
ON s.instructor_id = i.instructor_id;
-- All of the instructors who dont teach
SELECT Instructor_ID
FROM Instructor
WHERE Instructor_ID NOT IN
(
	SELECT s.Instructor_ID
	FROM Section s JOIN Instructor i
	ON s.instructor_id = i.instructor_id
);
-- Answer
SELECT Salutation, First_Name, Last_Name, Zip
FROM Instructor
WHERE Instructor_ID NOT IN
(
	SELECT s.Instructor_ID
	FROM Section s JOIN Instructor i
	ON s.instructor_id = i.instructor_id
);

-- 4.
-- Average of all section 90 final exams
SELECT AVG(Numeric_Grade) AS AVG_GRADE
FROM Section s JOIN Enrollment e
ON s.section_id = e.section_id
JOIN Grade g
ON e.section_id = g.section_id AND e.student_id = g.student_id
WHERE s.section_id = 90
	AND grade_type_code = 'FI';
-- ANSWER
SELECT Last_Name, Numeric_Grade
FROM Student s JOIN Enrollment e
ON s.student_id = e.student_id
JOIN Grade g
ON e.student_id = g.student_id AND e.section_id = g.section_id
WHERE numeric_grade > 
(
	SELECT AVG(Numeric_Grade) AS AVG_GRADE
	FROM Section s JOIN Enrollment e
	ON s.section_id = e.section_id
	JOIN Grade g
	ON e.section_id = g.section_id AND e.student_id = g.student_id
	WHERE s.section_id = 90
		AND grade_type_code = 'FI'
)
	AND e.section_id = '90'
	AND g.grade_type_code = 'FI'
ORDER BY Last_Name;

--5.
-- Find courses with lowest number of students
SELECT c.course_no, COUNT(*) AS StudentsInCourse
FROM Course c JOIN Section s
ON c.course_no = s.course_no
JOIN Enrollment e
ON s.section_id = e.section_id
GROUP BY c.course_no;

SELECT MIN(StudentsInCourse) AS LowestNumberOfStudents
FROM 
(
	SELECT c.course_no AS MinStudentCourseNo, COUNT(*) AS StudentsInCourse
	FROM Course c JOIN Section s
	ON c.course_no = s.course_no
	JOIN Enrollment e
	ON s.section_id = e.section_id
	GROUP BY c.course_no
);

SELECT c.course_no
FROM 
(
	SELECT c.course_no, COUNT(*) AS StudentsInCourse
	FROM Course c JOIN Section s
	ON c.course_no = s.course_no
	JOIN Enrollment e
	ON s.section_id = e.section_id
	GROUP BY c.course_no
)
WHERE StudentsInCourse = (
	SELECT MIN(StudentsInCourse) AS LowestNumberOfStudents
	FROM (
		SELECT c.course_no AS MinStudentCourseNo, COUNT(*) AS StudentsInCourse
		FROM Course c JOIN Section s
		ON c.course_no = s.course_no
		JOIN Enrollment e
		ON s.section_id = e.section_id
		GROUP BY c.course_no
	)
);