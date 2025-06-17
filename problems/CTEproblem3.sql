/*Calculate the number of unique skills required by each company.
 Aim to quantify the unique skills required per company 
 and identify which of these companies offer the highest average salary for positions necessitating at least one skill. 
 For entities without skill-related job postings, 
 list it as a zero skill requirement and a null salary. 
 Use CTEs to separately assess the unique skill count and 
 the maximum average salary offered by these companies.*/
WITH company_skills AS (
    SELECT
        company.company_id,
        COUNT(DISTINCT skill_id) AS skill_count
    FROM company_dim AS company
    LEFT JOIN job_postings_fact AS job_postings ON company.company_id = job_postings.company_id
    LEFT JOIN skills_job_dim AS skills_to_job ON job_postings.job_id = skills_to_job.job_id 
    GROUP BY
        company.company_id
),
avg_salary_skill AS (
    SELECT
        job_postings.company_id,
        MAX(salary_year_avg) AS salary_avg
    FROM 
        job_postings_fact AS job_postings
    WHERE
        job_postings.job_id IN (SELECT job_id FROM skills_job_dim)
    GROUP BY
        job_postings.company_id
)

SELECT 
    company_dim.name AS company_name,
    company_skills.skill_count,
    avg_salary_skill.salary_avg
FROM company_dim
LEFT JOIN company_skills ON company_dim.company_id = company_skills.company_id
LEFT JOIN avg_salary_skill ON company_dim.company_id = avg_salary_skill.company_id
ORDER BY
    company_name

    --
