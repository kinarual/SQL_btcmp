DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (
    id BIGINT,
    name VARCHAR,
    gender VARCHAR,
    age INTEGER,
    address VARCHAR
) AS $$
    SELECT id, name, gender, age, address FROM person WHERE gender = COALESCE(pgender, 'female')
$$ LANGUAGE SQL;

--SQL statement for checking from readme
--SQL query #1
select *
from fnc_persons(pgender := 'male');

--SQL query #2
select *
from fnc_persons();