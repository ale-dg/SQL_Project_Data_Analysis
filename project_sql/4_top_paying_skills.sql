/*
 What are the top skills based on salary?
 - Look at the average salary associated with each skill for Data Analyst position
 - Focuses on roles with specified salaries, regardles of location
 */
SELECT ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary,
    skills_dim.skills AS skills
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25