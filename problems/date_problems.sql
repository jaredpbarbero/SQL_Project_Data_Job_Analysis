/*Find companies (include company name) 
 - that have posted jobs offering health insurance,
 - where these postings were made in the second quarter of 2023. (4 , 5 , 6) - april, may, june
 - Use date extraction to filter by quarter.
 - And order by the job postings count from highest to lowest. -- 
*/

SELECT
    company_dim.name AS company_name,
    COUNT(job_postings_fact.job_id) AS job_count,
    job_postings_fact.job_health_insurance = insurance
FROM
    job_postings_fact
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    insurance = TRUE AND
    EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2
GROUP BY
    company_dim.name
HAVING
    COUNT(job_postings_fact.job_id) > 0
ORDER BY 
    job_count DESC;

