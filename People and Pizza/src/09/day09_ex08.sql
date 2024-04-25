CREATE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
    RETURNS TABLE
            (
                num INTEGER
            )
AS
$$
BEGIN
    RETURN QUERY
        WITH RECURSIVE fib_cte AS(
            SELECT 0 AS num1, 1 as num2
            UNION ALL
            SELECT num2 as num1, num1+num2 AS num2
            FROM fib_cte
            WHERE num2 < pstop)
    SELECT num1 FROM fib_cte;
END;
$$
    LANGUAGE plpgsql;

--queries from readme for checking
--query #1
select * from fnc_fibonacci(100);
--query #2
select * from fnc_fibonacci();