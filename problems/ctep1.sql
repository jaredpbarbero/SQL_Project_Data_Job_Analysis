/*Identify companies with the most diverse (unique) job titles. 
Use a CTE to count the number of unique job titles per company, 
then select companies with the highest diversity in job titles.
*/

WITH distinct_job_title AS (SELECT
    name,
    COUNT(DISTINCT job_title) AS count_title_job
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY
    name
ORDER BY
    count_title_job DESC
LIMIT 10
)
SELECT *
FROM distinct_job_title