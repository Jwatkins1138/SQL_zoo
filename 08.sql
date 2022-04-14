--01
SELECT COUNT(id)
FROM stops;

--02
SELECT id FROM stops
WHERE name = 'Craiglockhart';

--03
SELECT id, name FROM stops
JOIN route ON id = stop
WHERE route.company = 'LRT'
AND route.pos = 4;

--04
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) > 1;

--05
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop=53
AND b.stop=149;

--06
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='London Road';

--07
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop=115
AND b.stop=137;

--08
SELECT a.company, a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='Tollcross';

--09
SELECT DISTINCT stopb.name, a.company, a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND a.company = 'LRT'
ORDER BY stopb.name;

--10
SELECT  a.num, a.company, stopb.name, b.num, b.company
FROM route a 
JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN route c ON
(b.company=c.company AND b.num=c.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
JOIN stops stopc ON (c.stop=stopc.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name LIKE '%'
AND stopc.name='Lochend';


