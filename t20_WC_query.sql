SELECT * 
FROM t20_WC_project..t20_WC_cleaned_data$

-- 1.Top 10 Batter with most runs in last 3 seasons
select top 10 batsman,sum(runs) as Total_runs,team
from t20_WC_project..t20_WC_cleaned_data$
where Season in ('2016','2014','2012')
and Batsman <> 'Total Extras'
group by batsman,team
order by sum(runs) desc

-- 2.Top 10 Batter who faced most balls in 2016

select top 10 batsman,sum(balls) as Total_balls,team
from t20_WC_project..t20_WC_cleaned_data$
where Season = '2016'
group by batsman,team
order by sum(balls) desc

-- 3.Top 10 Batter with most 6s in all seasons

select top 10 Batsman,sum([6s]) as number_of_6s,team
from t20_WC_project..t20_WC_cleaned_data$
group by batsman,team
order by sum([6s]) desc

-- 4.Top 10 Batter with most 4s in all seasons

select top 10 Batsman,sum([4s]) as number_of_4s,team
from t20_WC_project..t20_WC_cleaned_data$
--where Season in ('2016','2014','2012')
group by batsman,team
order by sum([4s]) desc

--------------------------------------------------------------------------------------

-- 5. Top 5 Batter with most runs in final match
select top 5 Batsman,sum(Runs) as Runs,Team, Season
from t20_WC_project..t20_WC_cleaned_data$
where Match in (' Final - Live Cricket Score')
group by batsman,team,season
order by sum(runs) desc

--6.Batter with Best Strike Rate(Min 100 runs) in all time 
select top 5 Batsman, (Runs/Balls)*100 as Strike_rate
from t20_WC_project..t20_WC_cleaned_data$
where Runs > 100
order by (Runs/Balls)*100 desc

--7.Top 5 Batters with most no of 50s in Knockout matches
select top 5 Batsman,count(Runs) as No_of_50s
from t20_WC_project..t20_WC_cleaned_data$
where Runs > 49
and Match in (' 1st Semi-Final - Live Cricket Score',' 1st Semi-final - Live Cricket Score',
                    ' 2nd Semi-Final - Live Cricket Score',' 1st Semi Final - Live Cricket Score',
                    ' 2nd Semi-final - Live Cricket Score',' 2nd Semi Final - Live Cricket Score',
                    ' Final - Live Cricket Score')
group by Batsman
order by count(Runs) desc

-- 8.Champions in all seasons
select top 5 season, [Won by] as Champion,COUNT(distinct([Won by]))
from t20_WC_project..t20_WC_cleaned_data$
where Match in (' Final - Live Cricket Score')
group by Season,Matchid,[Won by]
order by COUNT([Won by])  desc

-----------------------------------------------------------------------------------------------
-- 9. Players with most catches in all seasons

select top 5 [Catched by] as Player,COUNT([Catched by]) as number_of_catches
from t20_WC_project..t20_WC_cleaned_data$
where  [Catched by] <> '-'
group by [Catched by]
order by COUNT([catched by])  desc

-- 10. Top 5 team score in all time
select top 5 season,Innings,team,sum(Runs) as Total_runs,match
from t20_WC_project..t20_WC_cleaned_data$
group by season,Innings,team,Matchid,match
order by sum(runs) desc

