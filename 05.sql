--01
SELECT matchid, player FROM goal 
WHERE teamid = 'GER';

--02
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

--03
SELECT player,teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE goal.teamid = 'Ger';

--04
SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE goal.player LIKE 'Mario%';

--05
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam
ON teamid=id
WHERE gtime<=10;

--06
SELECT mdate, eteam.teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE eteam.coach = 'Fernando Santos';

--07
SELECT player FROM goal
JOIN game ON (matchid=game.id)
WHERE game.stadium = 'National Stadium, Warsaw';

--08
SELECT DISTINCT player 
FROM game JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER')
AND goal.teamid != 'GER';

--09
SELECT teamname, COUNT(goal.matchid)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname;

--10
SELECT stadium, COUNT(goal.matchid)
FROM game JOIN goal ON id=matchid
GROUP BY stadium;

--11
SELECT matchid, mdate, COUNT(matchid)
FROM goal JOIN game ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

--12
SELECT matchid, mdate, COUNT(matchid)
FROM goal JOIN game ON matchid=id
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

--13
SELECT mdate,
team1,
COUNT (CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
team2,
COUNT (CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game JOIN goal ON matchid = id
GROUP BY matchid, mdate, team1, team2
ORDER BY mdate, matchid, team1, team2