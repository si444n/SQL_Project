-- What skills are associated with these top paying 'Data Analyst' jobs that allow remote work or are located 'Anywhere'?
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        job_posted_date
    FROM job_postings_fact
    WHERE (job_location = 'Anywhere' OR job_work_from_home = TRUE)
      AND salary_year_avg IS NOT NULL
      AND job_title_short = 'Data Analyst'
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    a.job_title,
    c.skills AS skill_name,
    a.salary_year_avg
FROM top_paying_jobs AS a
INNER JOIN skills_job_dim AS b
ON a.job_id = b.job_id
INNER JOIN skills_dim AS c
ON b.skill_id = c.skill_id
ORDER BY salary_year_avg DESC;

/*

*/