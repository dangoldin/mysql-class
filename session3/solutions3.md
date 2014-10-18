---
layout: default
title: Solutions III | Introduction to MySQL
tagline:
description: "Third set of solutions for Intro to MySQL"
keywords: "mysql, databases"
---

Solutions - Session III
=======================

# GROUP BY exercises

- Describe the columns and data returned by the following queries:

{% highlight sql %}
SELECT name AS player, count(*) AS count
FROM players
GROUP BY name;
-- This returns two columns, name and count, that counts the
-- number of times each name appears in the players table.

SELECT week, count(*) AS num_games
FROM schedule
WHERE home_id IN (1,2,3,4,5,6)
GROUP BY week;
-- This returns two columns, week and num_games, that contains
-- the number of games played each week where the home team id
is >= 1 and <= 6.

SELECT week,
  sum(rushing_tds) AS total_rushing_tds,
  max(rushing_tds) AS max_rushing_tds,
  sum(receiving_tds) AS total_receiving_tds,
  max(receiving_tds) AS max_receiving_tds
FROM stats
WHERE points > 0
GROUP BY week;
-- This returns 5 columns (week, total_rushing_tds, max_rushing_tds,
-- total_receiving_tds, max_receiving_tds) that are those stats by
-- week for players that scored more than 0 points during that week.
)
{% endhighlight %}

- Now write queries to do the following
  * Retrieve the number of total projected points by week for all weeks past 11.
  {% highlight sql %}
    SELECT week, SUM(points) AS total_points
    FROM stats
    WHERE week > 11
    GROUP BY week;
  {% endhighlight %}
  * Retrieve the number of players in our dataset for each team (team_id).
  {% highlight sql %}
    SELECT team_id, COUNT(*) AS num_players
    FROM players
    GROUP BY team_id;
  {% endhighlight %}

# JOIN exercises

- Describe the columns and data returned by the following queries:

{% highlight sql %}
SELECT
  p.name AS player_name,
  t.name AS team_name
FROM players p
JOIN teams t ON p.team_id = t.id
-- Columns are player_name and team_name and list the player names
-- and their teams.

SELECT
  p.name AS player_name,
  q.name AS position
FROM players p
JOIN positions q ON p.position_id = q.id
WHERE q.name in ('WR', 'TE');
-- Columns are player_name and position and list the player names
-- along with the position they play.

SELECT t.name AS team_name,
  count(*) as num_players
FROM teams t
JOIN players p ON t.id = p.team_id
GROUP BY t.name
ORDER BY num_players DESC;
-- Columns are team_name and num_players and contain the number
-- of players for each team in our dataset.

SELECT t.name, sum(s.points) AS points
FROM stats s
JOIN players p on p.id = s.player_id
JOIN teams t on p.team_id = t.id
GROUP BY t.name;
-- Columns are name and points and contain the total number
-- of points scored by each over the season.
{% endhighlight %}

- Now write queries to do the following:
{% highlight sql %}
-- Retrieve the name of every home team playing in week 9.
SELECT t.name AS team_name
FROM teams t
JOIN schedule s ON t.id = s.home_id
WHERE s.week = 9;

-- Retrieve the name of every away team playing in week 6.
SELECT t.name AS team_name
FROM teams t
JOIN schedule s ON t.id = s.away_id
WHERE s.week = 6;
{% endhighlight %}

# Subquery exercises

- Which is the inner query? What does it do?
- Describe the columns and data returned by the following queries:

{% highlight sql %}
SELECT name
FROM players WHERE team_id IN (
  SELECT id
  FROM teams
  WHERE name in ('NYJ', 'NYG')
);
-- Inner query is "SELECT id FROM teams WHERE name in ('NYJ', 'NYG')"
-- The column returned is just name and lists the players that
-- are members of the NYJ or NYG.

SELECT sum(points)
FROM stats
WHERE week IN (
  SELECT week
  FROM schedule
  GROUP BY week
  HAVING count(*) < 16
);
-- Inner query is "SELECT week FROM schedule GROUP BY week
-- HAVING count(*) < 16"
-- The column returned is just sum(points) and contains the total
-- points scored in weeks where there were fewer than 16 games.

SELECT p.name, s.total_points
FROM players AS p
JOIN (
  SELECT player_id, SUM(points) as total_points
  FROM stats
  GROUP BY player_id
  HAVING total_points > 100
) AS s on p.id = s.player_id;
-- Inner query is "SELECT player_id, SUM(points) as total_points
-- FROM stats GROUP BY player_id HAVING total_points > 100"
-- The columns returned are name and total_points and list the
-- players and the number of points they're projected to score
-- for all players that are projected to score more than 100
-- points.

SELECT t.name as team_name
FROM teams AS t
JOIN (
  SELECT team_id, count(1) as num_players
  FROM players
  GROUP BY team_id
  HAVING num_players > 10
) AS p on p.team_id = t.id;
-- Inner query is "SELECT team_id, count(1) as num_players
-- FROM players GROUP BY team_id HAVING num_players > 10"
-- The column returned is team_name and lists all teams that
-- have more than 10 players in our dataset.
{% endhighlight %}

- Write queries (any way you want) to do the following:
{% highlight sql %}
-- Find the total projected points scored by each position.
SELECT q.name AS position, SUM(s.points) AS total_points
FROM stats s
JOIN players p ON s.player_id = p.id
JOIN positions q ON p.position_id = q.id
GROUP BY q.name;

-- Find the total projected points scored by each position by week.
SELECT s.week, q.name AS position, SUM(s.points) AS total_points
FROM stats s
JOIN players p ON s.player_id = p.id
JOIN positions q ON p.position_id = q.id
GROUP BY s.week, q.name;

-- Find the total projected points scored by each position by week
-- for weeks > 10.
SELECT s.week, q.name AS position, SUM(s.points) AS total_points
FROM stats s
JOIN players p ON s.player_id = p.id
JOIN positions q ON p.position_id = q.id
WHERE s.week > 10
GROUP BY s.week, q.name;
{% endhighlight %}