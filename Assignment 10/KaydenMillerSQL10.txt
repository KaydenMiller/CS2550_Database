/* 1. */
ROLLBACK;

INSERT INTO Instructor
(Instructor_id, Salutation, First_Name, Last_Name, Street_Address, Zip, Phone,
	Created_by, Created_Date, Modified_By, Modified_Date)
VALUES
(815, 'Mr', 'Hugo', 'Reyes', '2342 Oceanic Way', '07002', Null, 'KMM', Sysdate, 'KMM', Sysdate);

/* 2. */
SAVEPOINT Q01;

INSERT INTO section
(Section_id, Course_no, section_no, start_date_time, location, instructor_id, capacity,
	created_by, created_date, modified_by, modified_date)
VALUES
(48, 142, 4, TO_DATE('22-09-2011', 'DD-MM-YYYY'), 'L211', 815, 15, 'KMM', Sysdate, 'KMM', Sysdate);

/* 3. */
SAVEPOINT Q02;

INSERT INTO Enrollment
(student_id, section_id, final_grade, enroll_date, created_by, created_date, modified_by, modified_date)
SELECT student_id, 48, NULL, Sysdate, 'KMM', Sysdate, 'KMM', Sysdate
FROM student
WHERE student_id IN (375, 137, 266, 382);

/* 4. */
SAVEPOINT Q03;

DELETE FROM Grade
WHERE student_id = 147
	AND section_id = 120;
	
DELETE FROM Enrollment
WHERE student_id = 147
	AND section_id = 120;

/* 5. */
SAVEPOINT Q04;

DELETE FROM Grade
WHERE student_id = 180
	AND section_id = 119;
	
DELETE FROM Enrollment
WHERE student_id = 180
	AND section_id = 119;
	
/* 6. */
SAVEPOINT Q05;

UPDATE Instructor
SET phone = '481-516-2342'
WHERE instructor_id = 815;

/* 7. */
SAVEPOINT Q06;

UPDATE Grade
SET numeric_grade = 100
WHERE grade_type_code = 'HM'
	AND section_id = 119
	AND grade_code_occurrence = 1;
	
/* 8. */
SAVEPOINT Q07;

UPDATE Grade
SET numeric_grade = numeric_grade * 1.1
WHERE section_id = 119
	AND grade_type_code = 'FI';

/* 9. */
SELECT sec.Section_id, Location, COUNT(student_id) AS Enrolleds
FROM Section sec LEFT OUTER JOIN Enrollment e
	ON sec.section_id = e.section_id
JOIN course c
	ON sec.course_no = c.course_no
WHERE c.course_No = 
(
	SELECT course_no
	FROM course
	WHERE description = 'Project Management'
)
GROUP BY sec.section_id, Location
ORDER BY sec.section_id;

/* 10. */
SELECT DISTINCT First_name, Last_Name, Phone
FROM Instructor i JOIN Section sec 
	ON i.instructor_id = sec.instructor_id
JOIN course c
	ON sec.course_no = sec.course_no
WHERE sec.course_no = 
(
	SELECT course_no
	FROM course
	WHERE description = 'Project Management'
)
ORDER BY Last_name, First_Name;

/* 11. */
SELECT s.Student_id, first_name, last_name, ROUND(AVG(numeric_grade), 2) AS Average
FROM student s JOIN Enrollment e
	ON s.student_id = e.student_id
JOIN Grade g
	ON e.student_id = g.student_id
	AND e.section_id = g.section_id
WHERE g.section_id = 119
GROUP BY s.student_id, first_name, last_name
ORDER BY student_id;

/* 12. */

SELECT COUNT(*) AS NumberOfInstructors
FROM
(
	SELECT sec.section_id, instructor_id
	FROM Enrollment e JOIN section sec
		ON e.section_id = sec.section_id
	WHERE sec.location = 'L211'
	HAVING COUNT(*) > 3
	GROUP BY sec.section_id, instructor_id
);

/* 13. Project Mgt course no = 142 */	
SELECT DISTINCT salutation || ' ' || First_Name || ' ' || Last_Name AS Instructor, phone
FROM instructor i JOIN section sec
	ON i.instructor_id = sec.instructor_id
WHERE i.instructor_id IN 
(
	SELECT i.instructor_id
	FROM instructor i JOIN section sec
		ON i.instructor_id = sec.instructor_id
	WHERE sec.course_no = 142
)
AND i.instructor_id NOT IN
(
	SELECT DISTINCT i.instructor_id
	FROM instructor i JOIN section sec
		ON i.instructor_id = sec.instructor_id
	WHERE sec.course_no != 142
);

/* 14. */
SELECT First_Name, Last_Name, e.Section_id, Course_no
FROM Student s JOIN Enrollment e
	ON s.student_id = e.student_id
JOIN Grade g
	ON e.student_id = g.student_id
	AND e.section_id = g.section_id
JOIN Section sec
	ON e.section_id = sec.section_id
WHERE g.numeric_grade = null;

/*
	I just started having an issue with my SQL statements where it hangs up on the instructor id 815 specifically.
	This is the same issue that Jeremy Lawrence had with his. It makes all sql statements unuseable.
*/