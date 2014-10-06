Exercises - Session II
======================

### LIKE examples
{% highlight sql %}
SELECT * FROM players WHERE name LIKE '%John%';
{% endhighlight %}

### GROUP BY examples

{% highlight sql %}
SELECT player_id, sum(points) FROM stats GROUP BY player_id;
SELECT week, count(*) FROM schedule GROUP BY week;
SELECT position_id, count(*) FROM players GROUP BY position_id;
SELECT home_id, away_id, count(*) FROM schedule GROUP BY home_id, away_id;
{% endhighlight %}

### LIKE exercises

- How many players have the last name Johnson?
- How many players have the first name Ryan or Chris?

### GROUP BY exercises

- What week has the fewest number of games?
- Which player have duplicate names?
- What's the maximum points scored each week?
-

### JOIN examples
{% highlight sql %}
SELECT * FROM players JOIN positions ON players.position_id = positions.id;
{% endhighlight %}

### JOIN exercises