SELECT
    (SELECT person.name FROM person WHERE person.id = person_order.person_id ) AS NAME  -- this is an internal query in a main SELECT clause
FROM person_order
WHERE (person_order.menu_id BETWEEN 13 AND 14 OR person_order.menu_id = 18) AND order_date = '2022-01-07'