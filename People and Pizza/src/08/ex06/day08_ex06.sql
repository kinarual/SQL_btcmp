-- SESSION #1
--check transaction isolation level
SHOW TRANSACTION ISOLATION LEVEL;
--start session
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--check if transaction isolation level has changed
SHOW TRANSACTION ISOLATION LEVEL;
--check sum rating
SELECT SUM(rating) FROM pizzeria;
--check sum rating again after commit in Session #2
SELECT SUM(rating) FROM pizzeria;
--commit current transaction so it can be visible to others
COMMIT;
--check current sum rating
SELECT SUM(rating) FROM pizzeria;

-- SESSION #2
--check transaction isolation level
SHOW TRANSACTION ISOLATION LEVEL;
--start session
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--check if transaction isolation level has changed
SHOW TRANSACTION ISOLATION LEVEL;
--update rating
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
--commit current transaction so it can be visible to others
COMMIT;
--check current sum rating
SELECT SUM(rating) FROM pizzeria;