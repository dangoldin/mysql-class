Solutions - Session I
=====================

-- How many teams are in our dataset?
select count(*) from teams;

-- How many players are in our dataset?
select count(*) from players;

-- What is the id for the NY Jets?
select * from teams where name = 'NYJ';
select * from teams;

-- What's the most projected points scored by a player over the course of a season?
select max(points) from stats;
select * from stats where points > 25.78;
select * from players where id = 11;
select * from `schedule` where week = 17 and home_id = 10;

-- What's the most projected points scored by a player in week 10?
select max(points) from stats where week = 10;

-- How many teams are playing in week 8?
select count(*) as num_games, 2*count(*) as num_teams from schedule where week = 8;

-- How many players are projected to score less than 10 points in week 8?
select count(*) from stats where points < 10 and week = 8;

-- How many players are projected to score more than 10 points in week 8?
select count(*) from stats where points > 10 and week = 8;

-- What percentage of players are projected to score more than 10 points in week 8?
select 90/(159+90+1);

-- 159 is < 10
-- 90 is > 10
-- 1 = 10

