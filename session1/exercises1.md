Exercises - Session I
=====================

### Basic select queries

- SELECT * FROM teams;
- SELECT * FROM teams WHERE id = 1;
- SELECT * FROM players LIMIT 10;
- SELECT * FROM players ORDER BY name;
- SELECT * FROM players ORDER BY name desc LIMIT 10;
- SELECT count(*) from schedule;
- SELECT avg(points) from stats;

### Exercises

- How many teams are in our dataset?
- How many players are in our dataset?
- What is the id for the NY Jets?
- What's the most projected points scored by a player (in a single week) over the course of a season?
- What's the most projected points scored by a player in week 10?
- How many teams are playing in week 8?
- How many players are projected to score less than 10 points in week 8?
- How many players are projected to score more than 10 points in week 8?
- What percentage of players are projected to score more than 10 points in week 8?