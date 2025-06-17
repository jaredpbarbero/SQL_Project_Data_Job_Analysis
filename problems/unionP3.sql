/*
Analyze the monthly demand for skills by counting the number of job postings for each skill in the first quarter (January to March), 
utilizing data from separate tables for each month. 
Ensure to include skills from all job postings across these months. 
The tables for the first quarter job postings were created in Practice Problem 6.
*/
SELECT 
    skills.skills,
    EXTRACT(YEAR FROM quarter1_job_postings.job_posted_date) AS job_posted_year,
    EXTRACT(MONTH FROM quarter1_job_postings.job_posted_date) AS job_posted_month,
    COUNT(job_posted_date) AS job_count
FROM (   
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
GROUP BY
    skills.skills,
    job_posted_year,
    job_posted_month