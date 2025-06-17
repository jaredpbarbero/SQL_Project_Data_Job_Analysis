/*
ANSWER: What are the most optimal skills to learn (in high demand and a high-paying skill)?
*/

WITH skills_demand AS (
    SELECT 
        skills.skill_id,
        skills.skills,
        COUNT(job_postings.job_id) AS demand_count
    FROM job_postings_fact AS job_postings
    INNER JOIN skills_job_dim as skills_to_job ON job_postings.job_id = skills_to_job.job_id
    INNER JOIN skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id
    WHERE
        job_postings.job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills.skill_id
),
average_salary AS (
    SELECT 
        skills.skill_id,
        skills.skills,
        ROUND(AVG(salary_year_avg),0) AS salary_avg
    FROM job_postings_fact AS job_postings
    INNER JOIN skills_job_dim as skills_to_job ON job_postings.job_id = skills_to_job.job_id
    INNER JOIN skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id
    WHERE
        job_postings.job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    salary_avg
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    salary_avg DESC,
    demand_count DESC
LIMIT 25;
--
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg),0) AS salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    salary_avg DESC,
    demand_count DESC
LIMIT 25;