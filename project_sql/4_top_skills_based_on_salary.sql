-- What are the top skills based on salary for 'Data Analyst' jobs?

WITH top_paying_skills AS (
    SELECT
        skills_job_dim.job_id,
        skill_id,
        salary_year_avg
    FROM job_postings_fact
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
)

SELECT
    skills_dim.skills AS skill_name,
    ROUND(AVG(top_paying_skills.salary_year_avg), 2) AS average_salary 
FROM skills_dim
INNER JOIN top_paying_skills
ON skills_dim.skill_id = top_paying_skills.skill_id
GROUP BY skills_dim.skills
ORDER BY average_salary DESC
LIMIT 10;