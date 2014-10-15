---
layout: default
title: Exercises II | Introduction to MySQL
tagline:
description: "Second set of exercies for Intro to MySQL"
keywords: "mysql, databases"
---

Exercises - Session II
======================

### LIKE examples
{% highlight sql %}
SELECT * FROM players WHERE name LIKE '%John%';
SELECT * FROM players WHERE name LIKE 'John%';
SELECT * FROM players WHERE name LIKE '%John';
{% endhighlight %}

### LIKE exercises

- Which players have the last name Johnson?
- Which players have the first name Ryan or Chris?
- How many players have an 'x' in their name?

### IN examples
{% highlight sql %}
SELECT * FROM positions WHERE name IN ('RB', 'WR');
SELECT * FROM stats WHERE week IN (1,3,5,7);
{% endhighlight %}

### IN exercises

- What's the total number of projected points scored in weeks 2, 4, and 6?
- What's the total number of projected points scored in weeks 1 and 3 by team ids 2 and 4?
- What's the total number of projected touchdown passes thrown in weeks 11 thru 17 by players with the last name Manning?

### GROUP BY examples

{% highlight sql %}
SELECT player_id, sum(points) FROM stats GROUP BY player_id;
SELECT week, count(*) FROM schedule GROUP BY week;
SELECT position_id, count(*) FROM players GROUP BY position_id;
SELECT home_id, away_id, count(*) FROM schedule GROUP BY home_id, away_id;
SELECT player_id, sum(points) FROM stats GROUP BY player_id HAVING sum(points) > 250;
{% endhighlight %}

### GROUP BY exercises

- What week has the fewest number of games?
- Which players have duplicate names?
- What's the maximum and minimum projected points scored each week?
- For how many players do we have less than 5 weeks projected stats for?

### JOIN examples
{% highlight sql %}
SELECT * FROM players JOIN positions ON players.position_id = positions.id;
SELECT players.name, positions.name FROM players JOIN positions ON players.position_id = positions.id;
SELECT p.name, pos.name as position FROM players as p JOIN positions as pos ON p.position_id = pos.id;
SELECT p.name, pos.name as position FROM players as p JOIN positions as pos ON p.position_id = pos.id WHERE pos.name in ('RB', 'WR') ORDER BY p.name;
{% endhighlight %}

### JOIN exercises

- How many players do we have for each position?
- What player has the most projected rushing touchdowns in week 15?
- What teams don't have a game in week 11?
- How many players do we have for each position in week 12?
- What's the total number of projected fantasy points by team?
- What's the total number of projected fantasy points and projected rushing yards by team in week 10?