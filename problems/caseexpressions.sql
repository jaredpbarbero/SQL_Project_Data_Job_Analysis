/*SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;*/


/*
PROBLEM 1
From the job_postings_fact table, 
categorize the salaries from job postings that are data analyst jobs, 
and that have yearly salary information. 
Put salary into 3 different categories:
If the salary_year_avg is greater than or equal to $100,000, then return ‘high salary’.
If the salary_year_avg is greater than or equal to $60,000 but less than $100,000, then return ‘Standard salary.’
If the salary_year_avg is below $60,000 return ‘Low salary’.
Also, order from the highest to the lowest salaries.*/

SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 100000 THEN 'high salary'
        WHEN salary_year_avg >= 60000 THEN 'Standard Salary'
        WHEN salary_year_avg < 60000 THEN 'Low salary'
    END AS salary_category
FROM job_postings_fact
WHERE
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC;

/*
Count the number of unique companies that offer work from home (WFH) 
versus those requiring work to be on-site.
 Use the job_postings_fact table to count and 
 compare the distinct companies based on their WFH policy (job_work_from_home).
*/

SELECT
   COUNT(DISTINCT company_id),
   CASE 
        WHEN job_work_from_home = TRUE THEN 'Remote'
        WHEN job_work_from_home = FALSE THEN 'On-site'
    END AS company_category
FROM job_postings_fact
GROUP BY company_category;

/*
Write a SQL query using the job_postings_fact table that returns the following columns:

job_id

salary_year_avg

experience_level (derived using a CASE WHEN)

remote_option (derived using a CASE WHEN)

Only include rows where salary_year_avg is not null.

Instructions
Experience Level
Create a new column called experience_level based on keywords in the job_title column:

Contains "Senior" → 'Senior'

Contains "Manager" or "Lead" → 'Lead/Manager'

Contains "Junior" or "Entry" → 'Junior/Entry'

Otherwise → 'Not Specified'

Use ILIKE instead of LIKE to perform case-insensitive matching (PostgreSQL-specific).

Remote Option
Create a new column called remote_option:

If job_work_from_home is true → 'Yes'

Otherwise → 'No'

Filter and Order

Filter out rows where salary_year_avg is NULL

Order the results by job_id
*/

SELECT
    job_id,
    salary_year_avg,
    CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Manager%' OR job_title ILIKE '%Lead%' THEN 'Lead/Manager'
        WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,
    CASE
        WHEN job_work_from_home = TRUE THEN 'Yes'
        ELSE 'No'
    END AS remote_option
FROM job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
ORDER BY job_id;