/*Explore job postings by listing job id, job titles, company names, 
and their average salary rates, 
while categorizing these salaries relative to the average in their respective countries. 
Include the month of the job posted date. 
Use CTEs, conditional logic, and date functions, 
to compare individual salaries with national averages.
*/
WITH country_year_avg AS (
SELECT
    job_country,
    AVG(salary_year_avg) AS country_avg
FROM
    job_postings_fact
GROUP BY
    job_country
)

SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    company.name AS company_name,
    job_postings_fact.salary_year_avg,
    CASE
        WHEN job_postings_fact.salary_year_avg > country_year_avg.country_avg THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_category,
    EXTRACT(MONTH FROM job_postings_fact.job_posted_date) AS job_month
FROM job_postings_fact
INNER JOIN company_dim AS company ON job_postings_fact.company_id = company.company_id
INNER JOIN country_year_avg ON job_postings_fact.job_country = country_year_avg.job_country

ORDER BY
    job_month DESC

