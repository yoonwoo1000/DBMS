create TABLE empoloyee(
    eIdx int unsigned auto_increment COMMENT 'Employee number',
    eName varchar(30) not null COMMENT 'employee name',
    department varchar(30) not null COMMENT 'department',
    salary int not null COMMENT 'salary (manwon)',
    hDate date comment 'hire date',
    isRetire boolean default false COMMENT 'Retired?',
    primary key(eIdx)
);
insert into empoloyee (eName, department, salary)
values ('Alice', 'HR', 5000),
    ('Bob', 'Engineering', 7000),
    ('Charlie', 'Marketing', 6000),
    ('David', 'Engineering', 8000),
    ('Eve', 'HR', 5500),
    ('Frank', 'Marketing', 6200),
    ('Grace', 'Engineering', 7200),
    ('Heidi', 'HR', 5300),
    ('Ivan', 'Marketing', 6100),
    ('Judy', 'Engineering', 7500);
UPDATE empoloyee
SET department = 'development'
WHERE department = 'Engineering';
update empoloyee
set department = 'JP'
where eName = 'heidi';
-- select order by asc, desc
SELECT *
from empoloyee
ORDER BY eName;
SELECT *
FROM empoloyee
ORDER BY salary DESC;
-- select where order by
SELECT *
FROM empoloyee
WHERE salary >= 6000
ORDER BY salary DESC;
SELECT *
FROM empoloyee
WHERE department is NOT NULL
ORDER BY department,
    hDate DESC;