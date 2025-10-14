select department,
    count(*) as 'Number of Employees'
from empoloyee
WHERE isRetire = false
GROUP BY department;
-- if data are number, you can use sum, avg, max, min
select department,
    sum(salary) as 'Total Salary',
    avg(salary) as 'Average Salary',
    max(salary) as 'Max Salary',
    min(salary) as 'Min Salary',
    count(*) as 'Number of Employees'
from empoloyee
WHERE isRetire = false
GROUP BY department;