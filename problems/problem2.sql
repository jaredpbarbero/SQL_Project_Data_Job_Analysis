SELECT
    name,
    company_id,
    job_count,
    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN (job_count >= 10 AND job_count <= 50) THEN 'Medium'
        WHEN job_count > 50 THEN 'Large'
    END AS size_category
FROM(
    SELECT
        company_dim.name,
        company_dim.company_id,
        COUNT(job_postings_fact.job_id) AS job_count
    FROM
        company_dim
        INNER JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
     GROUP BY
        company_dim.name,
        company_dim.company_id
) AS company_job_count;