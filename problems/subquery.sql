
WITH skills_table AS (
    SELECT
        skills_to_job.skill_id,
        COUNT(*) AS skill_count,
        COUNT(skills_to_job.job_id) AS job_count
        

    FROM skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON skills_to_job.job_id = job_postings.job_id
    WHERE
        job_postings.job_work_from_home = TRUE
    GROUP BY
        skills_to_job.skill_id
    ORDER BY
        skill_count DESC
)
SELECT
    skills.skill_id,
    skills.skills AS skill_name,
    skill_count
FROM skills_table
INNER JOIN skills_dim AS skills ON skills_table.skill_id = skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;