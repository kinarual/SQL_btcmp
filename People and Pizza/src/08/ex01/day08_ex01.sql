-- SESSION #1
--check transaction isolation level
SHOW TRANSACTION ISOLATION LEVEL;
--start session
BEGIN;
--check rating for Pizza Hut
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--update rating
UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';
--commit current transaction so it can be visible to others
COMMIT;
--check current rating
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2
--check transaction isolation level
SHOW TRANSACTION ISOLATION LEVEL;
--start session
BEGIN;
--check rating for Pizza Hut
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--update rating
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
--commit current transaction so it can be visible to others
COMMIT;
--check current rating
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';