-- inner join : both tables have matching records 
-- left join : all records from the left table and matching records from the right table
-- right join : all records from the right table and matching records from the left table
SELECT b.bIDX,
    b.bTitle,
    b.uIDX,
    u.uIDX,
    u.uName
from board as b
    LEFT JOIN UserList as u ON b.uIDX = u.uIDX
order by b.bIDX
LIMIT 0, 10;
SELECT b.bIDX,
    b.bTitle,
    b.wDate,
    b.hits,
    count(r.rIDX) as replyCount
from board as b
    LEFT JOIN UserList as u ON b.uIDX = u.uIDX
    LEFT JOIN Replys as r ON b.bIDX = r.bIDX
GROUP BY b.bIDX,
    b.bTitle,
    u.uName,
    b.wDate,
    b.hits