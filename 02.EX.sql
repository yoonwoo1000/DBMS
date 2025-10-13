-- create database
create database ex01;
show databases;
drop database ex01;
use ex01;
--create table
/*
 Constraints : unsigned, not null, primary key, auto_increment
 1. unsigned : only positive number
 2. not null : must have value
 3. primary key : unique + not null
 4. auto_increment : automatically increase number
 */
create TABLE memo(
    mIdx int unsigned auto_increment primary key COMMENT 'memo number',
    mText text not null COMMENT 'memo text'
);
-- desc tableName; : show table structure
-- drop table memo; : delete table
-- alter table memo add isDone boolean; : add column
-- alter table memo modify isDone char(1); : modify column
-- alter table memo change isDone isCompleted boolean; : change column name
-- alter table memo drop isDone; : delete column
-- insert into tableName(coulmnName) value (values);
insert memo (mText, isDone) value ('hello', false);
-- select * from memo; : show all(*) data
insert memo (mText) value ('Third memo');
insert memo (mText, isDone)
values ('Fourth memo', false),
    ('Fifth memo', true),
    ('last memo', false);