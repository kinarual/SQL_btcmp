-- SESSION #1
--start transaction block
BEGIN;
--update rating
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
--check if we can see changes in Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--commit current transaction so it can be visible to others
COMMIT;

-- SESSION #2
--check if we can see changes in Session #1 (before and after commit)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';