SELECT address,
       formula,
       average,
       formula > average AS comparison
FROM (
    SELECT address,
           ROUND((MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))), 2) AS formula,
           ROUND(AVG(age), 2) AS average
    FROM person
    GROUP BY address
) AS cte
ORDER BY address;