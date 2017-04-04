-- THINGS TO KNOW ABOUT A UNION
/*
	Columns must match
	Data types must match;
	UNION shows all
	UNION ALL WILL SHOW ALL ITEMS IN TABLE
*/SELECT custFirstName AS First, custLastName AS Last, 'customer' AS title
FROM Customer
UNION
SELECT empFirstName AS First, empLastName AS Last, 'employee' AS title
FROM employee
ORDER BY Last, First, Title;

/*
	SHOW what is in the first table but not the last
*/
SELECT custFirstName AS First, custLastName AS Last
FROM Customer
MINUS
SELECT empFirstName AS First, empLastName AS Last
FROM employee
ORDER BY Last, First;


/*
	SHOW what is in both tables
	same as INNER JOIN is also a JOIN
*/
SELECT custFirstName AS First, custLastName AS Last
FROM Customer
INTERSECT
SELECT empFirstName AS First, empLastName AS Last
FROM employee
ORDER BY Last, First;

/*
	LEFT OUTER JOIN
	will show anything in the left table and only what is the same in the right table
*/
SELECT DISTINCT i.instructor_id, NVL(TO_CHAR(sec.instructor_id), 'No') AS Section_Instructor_id
FROM instructor i LEFT OUTER JOIN Section sec
	ON i.instructor_id = sec.instructor_id;
	
	
-- OTHER EXAMPLES
/* ----------------------------------------------------------------------------- */
SELECT DISTINCT i.instructor_id, NVL(TO_CHAR(sec.instructor_id), 'NA')
FROM instructor i LEFT OUTER JOIN section sec
	ON i.instructor_id = sec.instructor_id;
	
