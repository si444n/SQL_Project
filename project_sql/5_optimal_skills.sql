-- What are the most optimal skills to learn for 'Data Analyst' jobs based on demand and salary?

WITH demand_and_salary AS ( 
    SELECT
        skills_job_dim.skill_id,
        COUNT(*) AS posting_count,
        AVG(job_postings_fact.salary_year_avg) AS avg_salary_for_skill
    FROM job_postings_fact
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id
    LIMIT 10
)

SELECT
    skills_dim.skills AS skill_name,
    demand_and_salary.posting_count,
    ROUND(demand_and_salary.avg_salary_for_skill, 2) AS average_salary
FROM skills_dim
INNER JOIN demand_and_salary
ON skills_dim.skill_id = demand_and_salary.skill_id
ORDER BY (posting_count * avg_salary_for_skill) DESC;