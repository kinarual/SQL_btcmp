-- SESSION #1
--check transaction isolation level
SHOW TRANSACTION ISOLATION LEVEL;
--start session
BEGIN;
--update rating for id = 1
UPDATE pizzeria
SET rating = 3.7
WHERE id = 1;
--update rating for id = 2
UPDATE pizzeria
SET rating = 3.33
WHERE id = 2;
--commit current transaction so it can be visible to others
COMMIT;

-- SESSION #2
--check transaction isolation level
SHOW TRANSACTION ISOLATION LEVEL;
--start session
BEGIN;
--update rating for id = 2
UPDATE pizzeria
SET rating = 2.3
WHERE id = 2;
--update rating for id = 1
UPDATE pizzeria
SET rating = 4.7
WHERE id = 1;
--commit current transaction so it can be visible to others
COMMIT;