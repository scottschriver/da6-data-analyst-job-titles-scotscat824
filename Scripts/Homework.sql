/*1.SELECT count(*) FROM data_analyst_jobs;1793*/

/*2.	Write a query to look at just the first 10 rows.
What company is associated with the job posting on the
10th row?*/
/*SELECT *
FROM data_analyst_jobs
LIMIT 10; Exxon Mobile*/

/*3. How many postings are in Tennessee? How many
are there in either Tennessee or Kentucky?*/
/*SELECT
location, COUNT(location)
FROM data_analyst_jobs
WHERE location = 'KY' OR location = 'TN'
GROUP BY location;TN-21, KY-6*/

/*4.	How many postings in Tennessee have a star
rating above 4?*/
/*SELECT COUNT(*)
FROM data_analyst_jobs
WHERE (star_rating > 4 AND location ='TN');3*/

/*5.	How many postings in the dataset have a review count between 500 and 1000?*/
/*SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count > 500 AND review_count < 1000;150*/

/*6.	Show the average star rating for companies in each state. The output should
show the state as `state` and the average rating for the state as `avg_rating`. 
Which state shows the highest average rating?*/

/*SELECT location AS state,AVG(star_rating) AS average_rating
FROM data_analyst_jobs
GROUP by state
ORDER BY average_rating DESC;NE - 4.199*/

/*7.	Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT count (DISTINCT title)
FROM data_analyst_jobs;881*/

/*8.	How many unique job titles are there for California companies?*/
/*SELECT count (DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';230*/

/*9.	Find the name of each company and its average star rating for all 
companies that have more than 5000 reviews across all locations. How many
companies are there with more that 5000 reviews across all locations?*/
/*SELECT company, avg(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;
list of 41*/

/*10.	Add the code to order the query in #9 from highest to lowest average
star rating. Which company with more than 5000 reviews across all locations 
in the dataset has the highest star rating? What is that rating?*/
/*SELECT company, avg(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC; General Motors, 4.199*/

/*11.	Find all the job titles that contain the word ‘Analyst’.
How many different job titles are there?*/
/*SELECT count (DISTINCT title)
FROM data_analyst_jobs
WHERE lower(title) LIKE '%analyst%';1699*/

/*12.	How many different job titles do not contain either the word
/*‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?*/
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE upper(title) NOT LIKE '%ANALYST%' AND upper(title) NOT LIKE  '%ANALYTICS%';4*/

/*Bonus: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
 - Disregard any postings where the domain is NULL. 
 - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
  - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?*/
SELECT domain, COUNT(domain) AS number_of_domain
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND days_since_posting >21
GROUP BY domain
ORDER BY number_of_domain DESC
LIMIT 4
