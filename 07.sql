--01
SELECT name FROM teacher
WHERE dept IS null;

--02
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id);

--03
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id);

--04
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id);

--05
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

--06
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id);

--07
SELECT COUNT(name), COUNT(mobile)
FROM teacher;

--08
SELECT dept.name, COUNT(teacher.dept)
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id)
GROUP BY dept.name;

--09
SELECT name, 
CASE WHEN dept = 1 THEN 'Sci'
WHEN dept = 2 THEN 'Sci'
ELSE 'Art' END
FROM teacher;

--10
SELECT name, 
CASE WHEN dept = 1 THEN 'Sci'
WHEN dept = 2 THEN 'Sci'
WHEN dept = 3 THEN 'Art' 
ELSE 'none' END
FROM teacher;

