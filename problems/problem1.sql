    
SELECT
    skills_dim.skills
FROM
    skills_dim
INNER JOIN (
    SELECT
        skill_id,
        COUNT(job_id) AS job_count 
    FROM 
        skills_job_dim
    GROUP BY
        skill_id
    ORDER BY
        job_count DESC
    LIMIT 5
) AS top_skills ON skills_dim.skill_id = top_skills.skill_id
ORDER BY top_skills.job_count DESC;