--01
SELECT id, title
FROM movie
WHERE yr=1962;

--02
SELECT yr FROM movie
WHERE title = 'Citizen Kane';

--03
SELECT id, title, yr
FROM movie
WHERE title LIKE '%star trek%';

--04
SELECT id FROM actor
WHERE name = 'Glenn Close';

--05
SELECT id FROM movie
WHERE title = 'Casablanca';

--06
SELECT name FROM actor
JOIN casting ON id = actorid
WHERE casting.movieid = 27;

--07
SELECT name FROM actor
JOIN casting ON id = actorid
WHERE casting.movieid = (SELECT id FROM movie
WHERE title = 'Alien');

--08
SELECT title FROM movie
JOIN casting ON id = movieid 
WHERE casting.actorid = (SELECT id FROM actor
WHERE name = 'Harrison Ford');

--09
SELECT title FROM movie
JOIN casting ON id = movieid 
WHERE casting.actorid = (SELECT id FROM actor
WHERE name = 'Harrison Ford')
AND casting.ord !=1;

--10
SELECT title, actor.name
FROM movie JOIN casting
ON movie.id = movieid
JOIN actor on actorid = actor.id
WHERE yr = 1962
AND ord = 1;

--11
SELECT yr,COUNT(title) FROM
movie JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1;

--12
SELECT movie.title, actor.name FROM movie
JOIN casting ON movieid = movie.id AND ord = 1
JOIN actor ON actorid = actor.id
WHERE movie.id IN (SELECT movieid FROM
casting WHERE actorid IN (
SELECT id FROM actor
WHERE name='Julie Andrews'));

--13
SELECT DISTINCT name FROM actor
JOIN casting ON id = actorid
WHERE 15 <= (SELECT COUNT(ord)
FROM casting
WHERE actorid = id
AND ord = 1);

--14
SELECT title, COUNT(actorid) FROM movie
JOIN casting ON id=movieid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title;

--15
SELECT name FROM actor
JOIN casting ON id = actorid
WHERE movieid IN (
SELECT movieid FROM casting
WHERE actorid = (
SELECT id FROM actor
WHERE name = 'Art Garfunkel'))
AND name != 'Art Garfunkel';