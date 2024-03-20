create database project_sql5;
use project_sql;
create table olympics8

(ID int,
Name varchar(400) ,
Sex varchar(50) ,
Age int,
Height  int,
Weight int ,
Team varchar(300),
NOC varchar(300),
Games varchar(200),
Year int,
Season varchar(200),
City varchar(100),
Sport varchar (100),
Event varchar (100),
Medal varchar(100)
);

SHOW VARIABLES LIKE "secure_file_priv";

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/Athletes_Cleaned.csv'
into table olympics8
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympics8;

-- 1. Show how many medal counts present for entire data

select medal,  count(medal) as medal_count
from olympics8
group by medal
order by medal_count asc;


-- 2. Show count of unique sports present in Olympics

select count(distinct sport) as uniq_sports_count
from olympics8;

-- 3. Show how many different medals won by team India

select medal, count(medal) as medal_count
from olympics8
where team = 'india'
group by medal
order by medal_count asc;

-- 4. Show event wise medals won by India show from highest to lowest medals won in order

select event, count(medal) as medal_count
from olympics8
where team='india' and medal<>'NonMedal'
group by event
order by medal_count desc;

-- 5. Show event wise medals won by India in order of year

select event, year, count(medal) as medal_count
from olympics8
where team='india' and medal<>'Nonmedal'
group by event, year
order by year desc;


-- 6. show country who won maximum medals.
select team, count(medal) as medal_count
from olympics8
where medal<>'NonMedal'
group by team 
order by medal_count desc
limit 1;

-- 7.show top 10 countries whowon gold
select team, count(medal) as gold_medal_count
from olympics8
where medal='gold'
group by team
order by gold_medal_count desc
limit 10;


--  8. show in which year did United states won most gold medal
select year, count(medal) as medal_count from olympics8
where medal<> 'NoMedal' and team = 'United States'
group by year
order by medal_count desc
limit 1;



-- 9. In which sports United States has most medals.
select sport, count(medal) as medal_count from olympics8
where team = 'United States' and medal<>'NoMedal'
group by sport
order by medal_count desc
limit 1;


-- 10. Find top three players who won most medals along with their sports and country

select name, sport, team, count(medal) as medal_count
from olympics8
where medal<>'NoMedal'
group by name, sport, team
order by medal_count desc
limit 3;



-- 11. Find player with most gold medals in cycling along with his country.
select name, sport, team, count(medal) as gold_medal_count
from olympics8
where sport = 'Cycling' and medal='gold'
group by name, sport, team
order by gold_medal_count desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select name, sport, team, count(medal) as medal_count
from olympics8
where sport='basketball' and medal<>'Nomedal'
group by name, sport, team
order by medal_count  desc
limit 1;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select name, medal, count(medal) as medal_count
from olympics8
where name='Teresa Edwards' and medal<>'NoMedal'
group by medal
order by medal_count desc;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select year, sex, count(medal) as medal_count
from olympics8
where medal<>'NoMedal'
group by year, sex
order by year asc;

