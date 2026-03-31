use world;
-- Question 1 : Count how many cities are there in each country?

select * from city;
select *from country;

select c.name as country, count(ci.Id) as citycount
from country c
join city ci
on c.code = ci.Countrycode
Group by C.Name
order by citycount desc;

-- Question 2 : Display all continents having more than 30 countries.

SELECT Continent, COUNT(Code) AS CountryCount
FROM Country
GROUP BY Continent
HAVING COUNT(Code) > 30
ORDER BY CountryCount DESC;

-- Question 3 : List regions whose total population exceeds 200 million.

select Region ,sum(population) as totalPopulation
from country 
group by region
having sum(population) > 200000000
order by totalPopulation desc;

-- Question 4 : Find the top 5 continents by average GNP per country.

select continent, avg(GNP) as averageGNP
from country
group by continent
order by averageGNP desc limit 5;

-- Question 5 : Find the total number of official languages spoken in each continent.
 
 select * from countrylanguage;
 
 select c.continent, count(distinct CL.language) as OfficialLanguages
 from country c
 join countrylanguage CL
 on c.code = cl.countrycode
 where cl.IsOfficial = 'T'
 group by c.continent
 order by OfficialLanguages desc;
 
 -- Question 6 : Find the maximum and minimum GNP for each continent.
 
SELECT Continent, 
       MAX(GNP) AS MaxGNP, 
       MIN(GNP) AS MinGNP
FROM Country
GROUP BY Continent
ORDER BY MaxGNP DESC;

-- Question 7 : Find the country with the highest average city population.

SELECT c.Name AS Country, AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;

-- Question 8 : List continents where the average city population is greater than 200,000.

SELECT c.continent , AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci ON c.Code = ci.CountryCode
GROUP BY c.continent
having avg(ci.Population) > 200000
ORDER BY AvgCityPopulation DESC;

/* Question 9 : Find the total population and average life expectancy for each continent,
 ordered by average life expectancy descending.*/
 
SELECT Continent, 
       SUM(Population) AS TotalPopulation, 
       AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM Country
GROUP BY Continent
ORDER BY AvgLifeExpectancy DESC;

/* Question 10 : Find the top 3 continents with the highest average life expectancy,
 but only include those where the total population is over 200 million*/
 
 select continent, avg(LifeExpectancy) as AvgLife, sum(Population) as totalPopulation
 from country 
 group by continent
 having sum(population) > 200000000
 order by AvgLife desc limit 3;
































