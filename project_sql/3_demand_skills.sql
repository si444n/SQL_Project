-- What are the most in demand skills required for 'Data Analyst' jobs?

SELECT
    c.skills AS skill_name,
    COUNT(*) AS posting_count
FROM job_postings_fact as a
INNER JOIN skills_job_dim as b
ON a.job_id = b.job_id
INNER JOIN skills_dim as c
ON b.skill_id = c.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY c.skills
ORDER BY posting_count DESC
LIMIT 5;