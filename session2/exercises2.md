Exercises - Session II
======================

### LIKE examples
```sql
SELECT * FROM players WHERE name LIKE ‘%John%';
SELECT * FROM players WHERE name LIKE ‘John%';
SELECT * FROM players WHERE name LIKE ‘%John’;
```

### LIKE exercises

- Which players have the last name Johnson?
- Which players have the first name Ryan or Chris?
- How many players have an 'x' in their name?

### IN examples
```sql
SELECT * FROM positions WHERE name IN ('RB', 'WR');
SELECT * FROM stats WHERE week IN (1,3,5,7);
```

### IN exercises

- What's the total number of projected points scored in weeks 2, 4, and 6?
- What's the total number of projected points scored in weeks 1 and 3 by team ids 2 and 4?
- What's the total number of projected touchdown passes thrown in weeks 11 thru 17 by players with the last name Manning?

### GROUP BY examples

```sql
SELECT player_id, sum(points) FROM stats GROUP BY player_id;
SELECT week, count(*) FROM schedule GROUP BY week;
SELECT position_id, count(*) FROM players GROUP BY position_id;
SELECT home_id, away_id, count(*) FROM schedule GROUP BY home_id, away_id;
```

### GROUP BY exercises

- What week has the fewest number of games?
- Which player have duplicate names?
- What's the maximum points scored each week?

### JOIN examples
```sql
SELECT * FROM players JOIN positions ON players.position_id = positions.id;
SELECT p.name, pos.name as position FROM players as p JOIN positions as pos ON p.position_id = pos.id;
```

### JOIN exercises

- What player has the most projected rushing touchdowns in week 15?
- What teams don't have a game week 11?
-