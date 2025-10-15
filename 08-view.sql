SELECT uIDX,
    uName,
    joinDate
FROM UserList
WHERE isActivate = 1;
create view safeList as
SELECT uIDX,
    uName,
    joinDate
FROM UserList
WHERE isActivate = 1;
create view boardView as
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
SELECT *
from boardView;
DROP VIEW boardView;