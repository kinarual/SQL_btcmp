CREATE FUNCTION func_minimum(VARIADIC arr NUMERIC[ ])
    RETURNS NUMERIC AS
    $$
    DECLARE
        min_in_arr NUMERIC;
    BEGIN
    SELECT min(num) INTO min_in_arr FROM unnest(arr) arr_table(num);
    RETURN min_in_arr;
    END;
    $$ LANGUAGE plpgsql;

--SQL statement for checking from readme
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);