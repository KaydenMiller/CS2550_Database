-- Which instructor teaches the most sections of Java Courses

-- Find those instructors with java in the title of the class
SELECT instructor_id, section_id
FROM section sec JOIN course c
ON sec.course_no = c.course_no
WHERE description LIKE '%Java%';

-- Find out how many sections are taught by those teachers
SELECT instructor_id, count(*)
FROM section sec JOIN course c
ON sec.course_no = c.course_no
WHERE description LIKE '%Java%'
GROUP BY instructor_id;

-- Find out what the teacher with the max amount of sections taught is
SELECT MAX(NumSections)
FROM 
(
	SELECT instructor_id, count(*) AS NumSections
	FROM section sec JOIN course c
	ON sec.course_no = c.course_no
	WHERE description LIKE '%Java%'
	GROUP BY instructor_id
);
	
SELECT instructor_id
FROM section sec JOIN course c
ON sec.course_no = c.course_no
WHERE description LIKE '%Java%'
GROUP BY instructor_id
HAVING COUNT(*) = 
(
	SELECT MAX(NumSections)
	FROM 
	(
		SELECT instructor_id, count(*) AS NumSections
		FROM section sec JOIN course c
		ON sec.course_no = c.course_no
		WHERE description LIKE '%Java%'
		GROUP BY instructor_id
	)
);
	
-- Find the instructor name(s) that match the highest value
SELECT first_name, last_name
FROM instructor
WHERE instructor_id IN
(
	SELECT instructor_id
	FROM section sec JOIN course c
	ON sec.course_no = c.course_no
	WHERE description LIKE '%Java%'
	GROUP BY instructor_id
	HAVING COUNT(*) = 
	(
		SELECT MAX(NumSections)
		FROM 
		(
			SELECT instructor_id, count(*) AS NumSections
			FROM section sec JOIN course c
			ON sec.course_no = c.course_no
			WHERE description LIKE '%Java%'
			GROUP BY instructor_id
		)
	)
);

/* ----------------------------------------------------------------------------
-------------------------------------------------------------------------------
---------------------------------------------------------------------------- */
-- QUESTION: Alphabetical list of students who have taken both Systems Analysis and Project management courses.
-- Write a query that will list the student IDs of those who have taken Systems Analysis.
/*FROM Student
WHERE student_id IN (/* List of project management students) */
/*	AND sutdent_id IN (/* List of Systems Analysis Students) */
-- Write a query that will list the student IDs of those who have taken Project Management courses.

-- List instructors who do not have projects for grading
-- Grade, Grade type weight, Section, GradeTYpe
-- Look for gradetypecode='PJ' or look for description of projects
-- Distinct Instructor_id

-- From instructor those instructors NOT IN  instructor list

/*
SELECT first_name, last_name
FROM instructor
WHERE instructor_id NOT IN (this list of instructors)
*/

-- 2. Find students and their grade on the final in section 86
-- WHERE numeric grade is less than AVG numeric grade for final in section 86
-- Find average via subquery

-- Do a COUNT(*) of the students










SELECT s.student_id, first_name, last_name, COUNT(*)
FROM student s JOIN Enrollment
ON s.student_id = e.student_id
JOIN section sec
ON e.section_id = sec.section_id
GROUP BY s.student_id, first_name, last_name
ORDER BY s.student_id;