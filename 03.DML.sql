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
SELECT mIdx as 'memo number',
    mText as 'memo text',
    isDone as 'is it done?',
    wDate as 'write date'
from memo;
-- update tableName set columnName = 'value' [, columnName = 'value', ...] where condition;
update memo
set isDone = true
where mIdx = 3;
--delete from tableName where condition; : delete data
delete from memo
where mIdx = 5;
update memo
set wDate = now()
where mIdx = 1;
-- mysqldump -u root -p databaseName > backupFileName.sql : backup
-- mysqldump -u root -p ex01 > ex01.sql : backup
-- mysql -u root -p databaseName < backupFileName.sql : restore
-- mysql -u root -p ex01 < ex01.sql : restore