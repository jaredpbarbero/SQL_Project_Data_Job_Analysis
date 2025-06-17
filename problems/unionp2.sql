SELECT
    quarter1_job_postings.job_id,
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    skills.skills,
    skills.type
FROM
(
    SELECT *
FROM january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL
SELECT *
FROM march_jobs
) AS quarter1_job_postings
LEFT JOIN skills_job_dim AS skills_to_job ON quarter1_job_postings.job_id = skills_to_job.job_id
LEFT JOIN skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id
WHERE
    quarter1_job_postings.salary_year_avg > 70000
ORDER BY
    quarter1_job_postings.job_id