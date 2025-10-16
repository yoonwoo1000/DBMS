start transaction;
delete from Replys
WHERE rIDX = 1;
SELECT *
FROM Replys;
commit;
start transaction;
delete from Replys
WHERE rIDX = 3;
SELECT *
FROM Replys;
rollback;
SELECT *
FROM Replys;