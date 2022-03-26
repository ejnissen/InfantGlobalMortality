--This data is for deaths of children under the age of 5.
--selecting the data we will be working with

select *
from PortfolioProjects..child_deaths
order by 1

--showing deaths by location in continents and incomes

select location, year, deaths
from PortfolioProjects..child_deaths
where code is null
order by 1

--filtering out and showing only continent's deaths by year

select location, year, deaths
from PortfolioProjects..child_deaths
where code is null
and location not in ('World', 'Middle income', 'High income', 'Euro area', 'Caribbean Small States', 'Arab World', 
'Low & middle income', 'Low income', 'Lower middle income', 'Middle income', 'Other small states', 'Pacific island small states', 
'small states', 'Sub-Saharan Africa', 'Upper middle income')
order by 1

-- showing yearly break down of deaths by continent

select 
	Location,
	year,
	SUM(deaths) as total_deaths 
	from PortfolioProjects..child_deaths
	where code is null
	and location not in ('World', 'Middle income', 'High income', 'Euro area', 'Caribbean Small States', 'Arab World', 
	'Low & middle income', 'Low income', 'Lower middle income', 'Middle income', 'Other small states', 'Pacific island small states', 
	'small states', 'Sub-Saharan Africa', 'Upper middle income')
group by Location, year
order by 1

--showing average deaths by continent per year, as well as total deaths for each continent. 
-- **this table will be used for a visual later.** 
select 
	Location,
	SUM(deaths) as total_deaths,
	AVG(deaths) as avg_deaths
	from PortfolioProjects..child_deaths
	where code is null
	and location not in ('World', 'Middle income', 'High income', 'Euro area', 'Caribbean Small States', 'Arab World', 
	'Low & middle income', 'Low income', 'Lower middle income', 'Middle income', 'Other small states', 'Pacific island small states', 
	'small states', 'Sub-Saharan Africa', 'Upper middle income')
group by Location

--selecting deaths by year for each country 

select
	Location,
	year,
	deaths
from PortfolioProjects..child_deaths
where code is not null
	and Location not in ('World')
order by 1, 2

--This shows total deaths by country for all years.
-- **this table will be used for a visual later**
select
	Location,
	SUM(deaths) as total_deaths
from PortfolioProjects..child_deaths
where code is not null
	and Location not in ('World')
group by location
order by 1

--Here we can see a yearly average of deaths by country
--**table will be used for a visual**
select 
	Location,
	SUM(deaths) as total_deaths,
	AVG(deaths) as avg_deaths
	from PortfolioProjects..child_deaths
	where code is not null
	and Location not in ('World')
group by Location
order by 1

--We can show the total deaths by income level as well shown below. 
--**used for a visual later**

select
	Location, 
	Sum(deaths) as total_deaths
From PortfolioProjects..child_deaths
where code is null
and Location not in ('Africa Eastern and Southern', 'Africa Western and Central', 'Arab World', 'Caribbean Small States',
'East Asia & Pacific', 'Euro area', 'Europe & Central Asia', 'Latin America & Caribbean', 'Middle East & North Africa',
'North America', 'Other small states', 'Pacific island small states', 'Small states', 'South Asia', 'Sub-Saharan Africa')
group by Location
order by 2

--showing the average deaths per income with the total deaths. 

select
	Location, 
	Sum(deaths) as total_deaths,
	avg(deaths) as avg_deaths
From PortfolioProjects..child_deaths
where code is null
and Location not in ('Africa Eastern and Southern', 'Africa Western and Central', 'Arab World', 'Caribbean Small States',
'East Asia & Pacific', 'Euro area', 'Europe & Central Asia', 'Latin America & Caribbean', 'Middle East & North Africa',
'North America', 'Other small states', 'Pacific island small states', 'Small states', 'South Asia', 'Sub-Saharan Africa')
group by Location
order by 2