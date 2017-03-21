-- 1. List the names of instructors who have not used projects (PJ) as a basis for grading in their courses. Arrange by last name.
SELECT Last_Name, First_name 
FROM Instructor
WHERE instructor_id NOT IN 
(
	SELECT i.instructor_id
	FROM Instructor i JOIN Section sec
		ON i.instructor_id = sec.instructor_id
	JOIN Grade_type_weight gtw
		ON sec.section_id = gtw.section_id
	WHERE gtw.grade_type_code = 'PJ'
)
ORDER BY Last_Name;

-- 2. Determine the number of students who received a below average grade on the final exam (FI) in section 86
SELECT COUNT(*) AS Below_Average
FROM Grade
WHERE Numeric_Grade < 
(
	SELECT AVG(Numeric_Grade)
	FROM grade
	WHERE section_id = '86'
		AND grade_type_code = 'FI'
)
	AND Section_id = '86'
	AND grade_type_code = 'FI';
	
-- 3. List the city and state that have the highest number of students enrolled.
SELECT City, State
FROM Zipcode zip JOIN Student s
	ON zip.zip = s.zip
JOIN Enrollment e
	ON s.student_id = e.student_id
GROUP BY City, State
HAVING COUNT(*) =
(
	SELECT MAX(StudentsInCity)
	FROM 
	(
		SELECT COUNT(*) AS StudentsInCity
		FROM Zipcode zip JOIN Student s
			ON zip.zip = s.zip
		JOIN Enrollment e
			ON s.student_id = e.student_id
		GROUP BY City, State
	) 
);

-- 4. Provide the student_id, name and final exam grade of the student(s) that received the 
--    lowest score on the final exam (FI) in course section 81.
SELECT s.student_id, First_Name, Last_Name, g.numeric_grade
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
JOIN Grade g
	ON e.student_id = g.student_id
	AND e.section_id = g.section_id
WHERE g.section_id = 81
	AND grade_type_code = 'FI'
	AND Numeric_grade = 
	(
		SELECT MIN(Numeric_Grade)
		FROM Grade
		WHERE section_id = 81
			AND grade_type_code = 'FI'
	);
	
-- 5. List the student id and name of students who have taken the same course more than once. Arrange by last name then first name.
SELECT s.student_id, s.Last_Name, s.First_Name
FROM Student s
WHERE s.student_id IN
(
	SELECT s.student_id
	FROM student s JOIN Enrollment e
		ON s.student_id = e.student_id
	JOIN section sec
		ON e.section_id = sec.section_id
	JOIN course c
		ON sec.course_no = c.course_no
	GROUP BY s.student_id, c.course_no
	HAVING COUNT(*) IN
	(
		SELECT COUNT(*) as SameCoursesTaken
		FROM student s JOIN enrollment e
			ON s.student_id = e.student_id
		JOIN section sec
			ON e.section_id = sec.section_id
		JOIN course c
			ON sec.course_no = c.course_no
		GROUP BY s.student_id, c.course_no
		HAVING COUNT(*) >= 2
	)
)
ORDER BY s.Last_Name, s.First_Name;

-- 6. List the first and last names of the students who have enrolled in the
--    fewest Sophomore (200 level) classes. Order by last name of the student
SELECT First_Name, Last_Name
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
JOIN Section sec
	ON e.section_id = sec.section_id
WHERE sec.course_no >= 200
	AND sec.course_no < 300
GROUP BY First_Name, Last_Name
HAVING COUNT(*) = 
(
	SELECT MIN(COUNT(*))
	FROM Student s JOIN Enrollment e
		ON s.student_id = e.student_id
	JOIN Section sec
		ON e.section_id = sec.section_id
	WHERE sec.course_no >= 200
		AND sec.course_no < 300
	GROUP BY s.student_id
)
ORDER BY Last_Name;

-- 7. List the course number and course description of the courses with the highest number of enrolled students. Arrange the list on course description.
SELECT Course_no, Description
FROM Course
WHERE course_no = 
(
	SELECT s.course_no
	FROM Section s JOIN Enrollment e
		ON s.section_id = e.section_id
	GROUP BY course_no
	HAVING COUNT(*) IN 
	(
		SELECT Max(COUNT(*)) AS MaxEnrollmentsInCourse
		FROM Section s JOIN Enrollment e
			ON s.section_id = e.section_id
		GROUP BY course_no
	)
);

-- 8. List the names of the students who are taking a course that begins at 10:30 AM. Sort by last name.
SELECT DISTINCT s.first_name, s.last_name
FROM student s JOIN Enrollment e
	ON s.student_id = e.student_id
JOIN section sec
	ON e.section_id = sec.section_id
WHERE sec.course_no IN 
(
	-- All of the course_no that have a section that starts at 10:30
	SELECT course_no
	FROM Section
	WHERE TO_CHAR(start_date_time, 'HH:MI AM') = '10:30 AM'
);

-- 9. List the first and last names of students are in trouble of failing section 87 because they received
--    a score on the final exam that was below the average of the rest of the class for that final exam. Order the list by last name
SELECT First_Name, Last_Name
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
JOIN grade g
	ON e.student_id = g.student_id
	AND e.section_id = g.section_id
WHERE g.Numeric_Grade < 
(
	SELECT AVG(Numeric_Grade)
	FROM grade
	WHERE section_id = '87'
		AND grade_type_code = 'FI'
)
	AND e.Section_id = '87'
	AND g.grade_type_code = 'FI'
ORDER BY Last_Name;
	
-- 10. Provide an alphabetic list containing the full names of students (order by
--     last name) and phone number who are the smartest students because they 
--     have taken at least one of the database courses. (Intro to SQL, Oracle
--	   Tools, PL/SQL Programming, Database Design, Database System Principles,
-- 	   DB Programming with Java). Your query must call the class by the description.
SELECT First_Name, Last_Name, Phone
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
JOIN Section sec
	ON e.section_id = sec.section_id
JOIN Course c
	ON sec.course_no = c.course_no
WHERE c.description = 'Intro to SQL'
	OR c.description = 'Oracle Tools'
	OR c.description = 'PL/SQL Programming'
	OR c.description = 'Database Design'
	OR c.description = 'Database System Principles'
	OR c.description = 'DB Programming with Java'
ORDER BY Last_Name;
