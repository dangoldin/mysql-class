---
layout: default
title: Solutions IV | Introduction to MySQL
tagline:
description: "Fourth set of solutions for Intro to MySQL"
keywords: "mysql, databases"
---

Solutions - Session IV
======================

# Exercises

{% highlight sql %}
-- Put everyone with the last name Johnson on team_id 10
UPDATE players SET team_id = 10 WHERE name LIKE '% Johnson';

-- Update Eli Manning's record to use
-- his birth name: "Elisha Nelson Manning"
UPDATE players SET name = 'Elisha Nelson Manning'
WHERE name = 'Eli Manning';

-- Create a new NFL team
INSERT INTO teams (name) VALUES ('DAN');

-- Add a week 18 game to the schedule
-- The following two are equivalent
INSERT INTO schedule (week, home_id, away_id) VALUES (18, 1, 2);
INSERT INTO schedule (home_id, away_id, week) VALUES (1, 2, 18);

-- Add a player named after you to the players table
INSERT INTO players (name) VALUES ('Dan Goldin');

-- Delete the player you created
-- Note that you can also do it by id to be safer
DELETE FROM players WHERE name = 'Dan Goldin';

-- Delete all players with the first name 'Ryan'
DELETE FROM players WHERE name LIKE '%Ryan ';

-- Delete all players that average less than 10 points a week
DELETE FROM players
WHERE id IN (
  SELECT player_id
  FROM stats
  GROUP BY player_id
  HAVING AVG(points) < 10
);

-- Add a first name and a last name column to the players table
ALTER TABLE players ADD COLUMN first_name VARCHAR(30);
ALTER TABLE players ADD COLUMN last_name VARCHAR(30);

-- Add a price_per_ticket column to the schedule table
ALTER TABLE schedule ADD COLUMN price_per_ticket float;

-- Think of a useful or interesting table and
-- add it to the database.
CREATE TABLE stadiums (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  team_id int(10) unsigned NOT NULL,
  name varchar(100) NOT NULL
);

{% endhighlight %}