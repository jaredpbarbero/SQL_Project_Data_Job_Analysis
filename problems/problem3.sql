/*d
Find companies that offer an average salary 
above the overall average yearly salary of all job postings
 Use subqueries to select companies with an average salary higher
  than the overall average salary (which is another subquery).
*/

SELECT 
  name
FROM 
  company_dim
INNER JOIN (
      SELECT 
        company_id,
        AVG(salary_year_avg) AS avg_salary
      FROM 
        job_postings_fact
      GROUP BY
          company_id
)AS company_avg_salary ON company_dim.company_id = company_avg_salary.company_id

WHERE avg_salary > (
      SELECT 
        AVG(salary_year_avg)
      FROM 
        job_postings_fact
)
