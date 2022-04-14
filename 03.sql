--01
SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia');

--02
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population >
(SELECT gdp/population FROM world
WHERE name = 'United Kingdom');

--03
SELECT name, continent
FROM world
WHERE continent IN
(SELECT continent FROM world
WHERE name IN('Argentina', 'Australia'))
ORDER BY name;

--04
SELECT name, population
FROM world
WHERE population >
(SELECT population FROM world
WHERE name = 'Canada')
AND population <
(SELECT population FROM world
WHERE name = 'Poland');

--05
SELECT name,
CONCAT(ROUND(100*population/(SELECT population
FROM world
WHERE name = 'Germany'),0), '%')
AS percentage
FROM world
WHERE continent = 'Europe';

--06
SELECT name 
FROM world
WHERE gdp > ALL(SELECT gdp
FROM world
WHERE continent = 'Europe'
AND gdp > 0);

--07
SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent
AND area>0);

--08
SELECT continent, name FROM world x
WHERE name = ALL
(SELECT MIN(name) FROM world y
WHERE y.continent=x.continent);

--09
SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL
(SELECT MAX(population) FROM world y
WHERE y.continent=x.continent);

--10
SELECT name, continent FROM world x
WHERE population/3 > ALL
(SELECT population FROM world y
WHERE y.continent=x.continent
AND y.name!=x.name);