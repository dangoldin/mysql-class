create database stats;
use database stats;

create table orig_stats (
  week int,
  name varchar(100),
  position varchar(20),
  opp varchar(50),
  passing_yds float,
  passing_tds float,
  passing_int float,
  rushing_att float,
  rushing_yds float,
  rushing_tds float,
  receiving_tgt float,
  receiving_rec float,
  receiving_yds float,
  receiving_tds float,
  return_tds float,
  twopt float,
  fumbles float,
  points float
);

LOAD DATA INFILE '/tmp/stats-2014.csv'
  INTO TABLE orig_stats
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES  ;

create table teams (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(100),
  PRIMARY KEY (id),
  UNIQUE (name)
);

create table positions (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(10),
  PRIMARY KEY (id),
  UNIQUE (name)
);

create table players (
  id int unsigned NOT NULL AUTO_INCREMENT,
  name varchar(100),
  position_id int,
  team_id int,
  PRIMARY KEY (id)
);

create table schedule (
  week int,
  home_id int,
  away_id int,
  UNIQUE (week, home_id, away_id)
);

create table stats (
  week int,
  player_id int,
  passing_yds float,
  passing_tds float,
  passing_int float,
  rushing_att float,
  rushing_yds float,
  rushing_tds float,
  receiving_tgt float,
  receiving_rec float,
  receiving_yds float,
  receiving_tds float,
  return_tds float,
  twopt float,
  fumbles float,
  points float
);

-- Generate the data
insert into teams
  (name)
  select distinct(substring_index(position, ' - ', 1)) from orig_stats order by position;

insert into positions
  (name)
  select distinct(substring_index(position, ' - ', -1)) as pos from orig_stats order by pos;

-- Figure out the player position and team from the stats table and then find the team id
-- Key assumption here is that there are no two players with the same name, on the same team,
-- with the same position
insert into players
  (name, position_id, team_id)
  select p.name, pos.id, t.id
  from (
    select name, position, substring_index(position, ' - ', -1) as pos, substring_index(position, ' - ', 1) as team
    from orig_stats
    group by name, position, pos, team
  ) p
  join teams t on t.name = p.team
  join positions pos on pos.name = p.pos;

-- Figure out the schedule by looking at the unique matchups in the stats table, since every row is paried with
-- home and away we only need to look at the ones where the player is playing a home game
insert into schedule
  (week, home_id, away_id)
  select s.week, t1.id, t2.id
  from (
    select week, substring_index(position, ' - ', 1) as home_team, substring_index(opp, ' vs ', -1) as away_team
    from orig_stats s
    where opp like '%vs%'
    group by week, home_team, away_team
  ) s
  join teams t1 on t1.name = s.home_team
  join teams t2 on t2.name = s.away_team
  order by s.week, t1.id, t2.id;

-- Now create a properly normalized stats table. We can drop some of the fields since we have that information in the other tables.
-- An issue is that there are two duplicate players (Zach Miller and Alex Smith so we need to correctly identify them)
insert into stats
  (week, player_id,
    passing_yds, passing_tds, passing_int, rushing_att, rushing_yds, rushing_tds,
    receiving_tgt, receiving_rec, receiving_yds, receiving_tds, return_tds,
    twopt, fumbles, points)
  select s.week, p.id,
    passing_yds, passing_tds, passing_int, rushing_att, rushing_yds, rushing_tds,
    receiving_tgt, receiving_rec, receiving_yds, receiving_tds, return_tds,
    twopt, fumbles, points
  from orig_stats s
  join teams t on substring_index(s.position, ' - ', 1) = t.name
  join players p on s.name = p.name and p.team_id = t.id;

-- Some investigation queries
select player_id, p.name, sum(points) as total_points
from stats s
join players p on s.player_id = p.id
group by player_id, p.name
order by total_points desc;

select pos.id, pos.name, avg(points) as avg_points
from stats s
join players p on s.player_id = p.id
join positions pos on pos.id = p.position_id
group by pos.id, pos.name
order by avg_points desc;

-- Interesting due to bye weeks
select week, sum(points) as total_points
from stats
group by week
order by total_points desc;

select week, count(1) as num_matchups, 16 - count(1) as missing_matchups
from schedule
group by week
order by week;