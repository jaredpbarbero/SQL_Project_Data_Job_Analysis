
SELECT
    job_id,
    job_title,
    'With Salary Info' AS salary_info
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL OR
    salary_hour_avg IS NOT NULL

UNION ALL

SELECT
    job_id, 
    job_title,
    'Without Salary Info' AS salary_info
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL AND
    salary_hour_avg IS NOT NULL
ORDER BY 
    salary_info DESC,
    job_id;
