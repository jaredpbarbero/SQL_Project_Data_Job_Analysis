/*
What are the top skills based on salary?
 - Look at the average salary associated with each skill for Data Analyst postiions
 - Focuses on roles with specified salaries, regardless of location
 - Why? It reveals how different skills impact salary levels for Data Analysts
    and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills.skills,
    ROUND(AVG(salary_year_avg),2) AS salary_avg
FROM job_postings_fact AS job_postings
INNER JOIN skills_job_dim as skills_to_job ON job_postings.job_id = skills_to_job.job_id
INNER JOIN skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id
WHERE
    job_postings.job_title_short = 'Data Analyst'
    --AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills.skills
ORDER BY
    salary_avg DESC
LIMIT 25

/*
Insights/trends
AI, ML, and Emerging Technologies Dominate: Skills in AI frameworks like PyTorch and TensorFlow, as well as blockchain-related tools like Solidity, command high salaries due to their growing relevance in advanced analytics and emerging industries.

Infrastructure and Automation Are Critical: Tools like Terraform, Airflow, and Kafka highlight the demand for hybrid data roles that combine analytics with DevOps and scalable data engineering.

Specialized and Niche Tools Stand Out: High salaries for legacy systems (SVN, Perl) and specialized platforms (DataRobot, Couchbase) reflect the value of expertise in unique or less mainstream technologies.
[
  {
    "skills": "svn",
    "salary_avg": "400000.00"
  },
  {
    "skills": "solidity",
    "salary_avg": "179000.00"
  },
  {
    "skills": "couchbase",
    "salary_avg": "160515.00"
  },
  {
    "skills": "datarobot",
    "salary_avg": "155485.50"
  },
  {
    "skills": "golang",
    "salary_avg": "155000.00"
  },
  {
    "skills": "mxnet",
    "salary_avg": "149000.00"
  },
  {
    "skills": "dplyr",
    "salary_avg": "147633.33"
  },
  {
    "skills": "vmware",
    "salary_avg": "147500.00"
  },
  {
    "skills": "terraform",
    "salary_avg": "146733.83"
  },
  {
    "skills": "twilio",
    "salary_avg": "138500.00"
  },
  {
    "skills": "gitlab",
    "salary_avg": "134126.00"
  },
  {
    "skills": "kafka",
    "salary_avg": "129999.16"
  },
  {
    "skills": "puppet",
    "salary_avg": "129820.00"
  },
  {
    "skills": "keras",
    "salary_avg": "127013.33"
  },
  {
    "skills": "pytorch",
    "salary_avg": "125226.20"
  },
  {
    "skills": "perl",
    "salary_avg": "124685.75"
  },
  {
    "skills": "ansible",
    "salary_avg": "124370.00"
  },
  {
    "skills": "hugging face",
    "salary_avg": "123950.00"
  },
  {
    "skills": "tensorflow",
    "salary_avg": "120646.83"
  },
  {
    "skills": "cassandra",
    "salary_avg": "118406.68"
  },
  {
    "skills": "notion",
    "salary_avg": "118091.67"
  },
  {
    "skills": "atlassian",
    "salary_avg": "117965.60"
  },
  {
    "skills": "bitbucket",
    "salary_avg": "116711.75"
  },
  {
    "skills": "airflow",
    "salary_avg": "116387.26"
  },
  {
    "skills": "scala",
    "salary_avg": "115479.53"
  }
]
*/