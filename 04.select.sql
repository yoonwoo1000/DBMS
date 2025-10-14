create TABLE memo(
    mIdx int unsigned auto_increment COMMENT 'memo number',
    mText text not null COMMENT 'memo text',
    isDone boolean default false COMMENT 'is it done?',
    wDate datetime default now() comment 'write date',
    primary key(mIdx)
);
insert into memo (mText) value ('First memo'),
    ('Second memo'),
    ('Third memo'),
    ('Fourth memo'),
    ('Fifth memo');
SELECT mText as 'Message',
    wDate as 'Date',
    mIDX as ' ID '
from memo;
UPDATE memo
SET isDone = true
WHERE mIdx IN (2, 4, 6);
UPDATE memo
SET isDone = null
WHERE mIdx in (1, 3, 5);
-- where condition
select *
from memo
WHERE mIDX <= 1;
-- AND, OR, NOT 
SELECT *
from memo
WHERE mIDX BETWEEN 5 AND 7;
-- IN
SELECT *
from memo
WHERE mIDX IN (5, 7, 9);
-- LIKE (%, _)  % : any number of characters, _ : single character
SELECT *
FROM memo
WHERE mText LIKE '%th%';
-- where boolean 
SELECT *
FROM memo
WHERE isDone = true;
SELECT *
FROM memo
WHERE isDone = FALSE;
-- wherer is null, is not null
SELECT *
FROM memo
WHERE isDone IS NULL;
SELECT *
FROM memo
WHERE isDone IS NOT NULL;
SELECT *
FROM memo
WHERE mIdx in (1, 3, 4, 5, 6, 7, 8, 9)
    or mText like "%fi%"
    and isDone is not null;
SELECT *
FROM memo
WHERE (
        mIdx in (1, 3, 4, 5, 6, 7, 8, 9)
        or mText like "%fi%"
    )
    and isDone is not null;