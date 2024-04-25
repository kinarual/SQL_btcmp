-- SESSION #1
--check transaction isolation level
SHOW TRANSACTION ISOLATION LEVEL;
--start session
BEGIN;
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
BEGIN;
--update rating
UPDATE pizzeria
SET rating = 1
WHERE name = 'Pizza Hut';
--commit current transaction so it can be visible to others
COMMIT;
--check current sum rating
SELECT SUM(rating) FROM pizzeria;