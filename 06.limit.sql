SELECT *
FROM empoloyee
ORDER BY hDate
LIMIT 3;
SELECT *
FROM empoloyee
ORDER BY hDate DESC
LIMIT 3;
SELECT *
FROM empoloyee
ORDER BY hDate DESC
LIMIT 3, 3;
SELECT *
FROM empoloyee
ORDER BY hDate DESC
LIMIT 6, 3;
SELECT *
FROM empoloyee
ORDER BY hDate DESC
LIMIT 3 offset 6;
SELECT *
FROM empoloyee
ORDER BY salary desc
LIMIT 4;
SELECT *
FROM empoloyee
where department = 'development'
ORDER BY salary desc
LIMIT 1;
update empoloyee
set department = 'JP'
where eIdx = 3;
select count(eName)
from empoloyee;
select count(*)
from empoloyee;