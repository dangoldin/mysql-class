---
layout: default
title: Solutions II | Introduction to MySQL
tagline:
description: "Second set of solutions for Intro to MySQL"
keywords: "mysql, databases"
---

Solutions - Session II
======================

### LIKE exercises
{% highlight sql %}
-- Which players have the last name Johnson?
SELECT * FROM players WHERE name LIKE '% Johnson';

-- Which players have the first name Ryan or Chris?
SELECT * FROM players WHERE name LIKE 'Ryan %' OR name LIKE 'Chris %';

-- How many players have an 'x' in their name?
SELECT * FROM players WHERE name LIKE '%x%';
{% endhighlight %}

### IN exercises
{% highlight sql %}
-- What's the total number of projected points scored in weeks 2, 4, and 6?
SELECT sum(points) FROM stats WHERE week IN (2,4,6);

-- What's the total number of projected points scored in weeks 1 and 3 by team ids 2 and 4?
-- Note: This is a tricky one and asking something we didn't cover. One way to do it is to use IN
-- to find out the players that belong to those teams and filter to those.
SELECT sum(points) FROM stats WHERE week IN (1,3)
  AND player_id IN (SELECT team_id FROM players where team_id IN (2,4));

-- What's the total number of projected touchdown passes thrown in weeks 11 thru 17 by players with the last name Manning?
-- First find players named Manning and then get the points for these two players (Eli and Peyton)
SELECT * FROM players WHERE name LIKE '% Manning';
SELECT sum(passing_tds) FROM stats
  WHERE player_id IN (11,25)
  AND week >= 11 AND week <= 17;
-- Another way which we haven't covered yet using a sub query:
SELECT sum(passing_tds) FROM stats
  WHERE week >= 11 AND week <= 17
  AND player_id IN (
    SELECT id FROM players WHERE name LIKE '% Manning'
  );
{% endhighlight %}

### GROUP BY exercises
{% highlight sql %}
-- What week has the fewest number of games?
SELECT week, count(*) FROM schedule GROUP BY week;

-- Which players have duplicate names?
SELECT name, count(*) AS count FROM players GROUP BY name HAVING count > 1;

-- What's the maximum and minimum projected points scored each week?
SELECT week, min(points), max(points) FROM stats GROUP BY week;
-- We can also filter to points > 0
SELECT week, min(points), max(points) FROM stats WHERE points > 0 GROUP BY week;

-- For how many players do we have less than 5 weeks projected stats for?
SELECT name, count(*) AS count FROM players GROUP BY name HAVING count < 5;
{% endhighlight %}

### JOIN exercises
{% highlight sql %}
-- How many players do we have for each position?
SELECT q.name, count(*) AS count
FROM positions q
JOIN players p ON q.id = p.position_id
GROUP BY q.name;

-- What player has the most projected rushing touchdowns in week 15?
SELECT p.name, rushing_tds
FROM stats s
JOIN players p on s.player_id = p.id
WHERE s.week = 15
ORDER BY rushing_tds desc;

-- What teams don't have a game in week 11?
-- This was a tricky one and it's harder to solve it using a JOIN.
-- In this case we can solve it by using the IN syntax and
-- excluding the home and away teams playing in week 11.
SELECT *
FROM teams
WHERE id NOT IN (SELECT home_id FROM schedule WHERE week = 11)
AND id NOT IN (SELECT away_id FROM schedule WHERE week = 11);

-- How many players do we have for each position in week 12?
SELECT q.name, count(*)
FROM players p
JOIN positions q ON p.position_id = q.id
JOIN stats s ON p.id = s.player_id
WHERE s.week = 12
GROUP BY q.name;

-- What's the total number of projected fantasy points by team?
SELECT t.name, sum(s.points)
FROM stats s
JOIN players p on p.id = s.player_id
JOIN teams t on p.team_id = t.id
GROUP BY t.name;


-- What's the total number of projected fantasy points and projected rushing yards by team in week 10?
SELECT t.name, sum(s.points), sum(s.rushing_yds)
FROM stats s
JOIN players p on p.id = s.player_id
JOIN teams t on p.team_id = t.id
WHERE s.week = 10
GROUP BY t.name;
{% endhighlight %}