-- What are the top 100 paying 'Data Analyst' jobs that allow remote work or are located 'Anywhere'?

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
LIMIT 10;
