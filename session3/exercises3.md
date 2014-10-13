Exercises - Session III
=======================

### GROUP BY exercises

- Describe the columns and data returned by the following queries:
```sql
SELECT name AS player, count(*) AS count
FROM players
GROUP BY name;

SELECT home_id, count(*) AS num_games
FROM schedule
WHERE week < 7
GROUP BY home_id;

SELECT week,
  sum(rushing_tds) AS total_rushing_tds,
  max(rushing_tds) AS max_rushing_tds,
  sum(receiving_tds) AS titak_receiving_tds,
  max(receiving_tds) AS max_receiving_tds
FROM stats
WHERE points > 0
GROUP BY week;
```
- Now write queries to do the following:
 * Retrieve the number of total projected points by week for all weeks past 11.
 * Retrieve the number of players in our dataset for each team (team_id).

### JOIN exercises
- Describe the columns and data returned by the following queries:
```sql
SELECT p.name AS player_name, t.name AS team_name
FROM players p
JOIN teams t ON p.team_id = t.id

SELECT p.name AS player_name, q.name AS position
FROM players p
JOIN positions q ON p.position_id = q.id
WHERE q.name in ('WR', 'TE');
```
- Now write queries to do the following:
  * Retrieve the name of every home team playing in week 9.
  * Retrieve the name of every away team playing in week 6.

### Subquery exercises

#### IN

TBD

#### JOIN

TBD