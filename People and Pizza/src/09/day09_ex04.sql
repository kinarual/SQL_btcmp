CREATE FUNCTION fnc_persons_female()
RETURNS TABLE (
    id BIGINT,
    name VARCHAR,
    gender VARCHAR,
    age INTEGER,
    address VARCHAR
) AS $$
    SELECT id, name, gender, age, address FROM person WHERE gender = 'female'
$$ LANGUAGE SQL;

--SQL statement for female fnc for checking from readme
SELECT *
FROM fnc_persons_female();

CREATE FUNCTION fnc_persons_male()
RETURNS TABLE (
    id BIGINT,
    name VARCHAR,
    gender VARCHAR,
    age INTEGER,
    address VARCHAR
) AS $$
    SELECT id, name, gender, age, address FROM person WHERE gender = 'male'
$$ LANGUAGE SQL;

--SQL statement for male fnc for checking from readme
SELECT *
FROM fnc_persons_male();