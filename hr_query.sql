-- project status

WITH project_status AS (
SELECT 
project_id,
project_name,
project_budget,
'upcoming' AS status
FROM [upcoming projects]

UNION ALL

SELECT 
project_id,
project_name,
project_budget,
'completed' AS status
FROM completed_projects
)

-- main table
SELECT 
e.employee_id,
e.first_name,
e.last_name,
e.job_title,
e.salary,
d.Department_Name,
pa.project_id,
p.project_name,
p.status
FROM employees e
JOIN departments d 
on e.department_id = d.Department_ID
JOIN project_assignments pa
on e.employee_id = pa.employee_id 
JOIN project_status p 
on p.project_id = pa.project_id
