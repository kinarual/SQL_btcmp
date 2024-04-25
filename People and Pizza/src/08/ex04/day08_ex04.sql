-- SESSION #1
--check transaction isolation level
SHOW TRANSACTION ISOLATION LEVEL;
--start session
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--check if transaction isolation level has changed
SHOW TRANSACTION ISOLATION LEVEL;
--check rating for Pizza Hut
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--check rating again for Pizza Hut
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--commit current transaction so it can be visible to others
COMMIT;
--check current rating
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2
--check transaction isolation level
SHOW TRANSACTION ISOLATION LEVEL;
--start session
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--check if transaction isolation level has changed
SHOW TRANSACTION ISOLATION LEVEL;
--update rating
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';
--commit current transaction so it can be visible to others
COMMIT;
--check current rating
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';