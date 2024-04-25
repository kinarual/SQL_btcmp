(SELECT person.name AS name
    FROM person
        INNER JOIN person_order on person.id = person_order.person_id
        INNER JOIN menu on menu.id = person_order.menu_id
WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza')
INTERSECT
(SELECT person.name AS name
    FROM person
        INNER JOIN person_order on person.id = person_order.person_id
        INNER JOIN menu on menu.id = person_order.menu_id
WHERE person.gender = 'female' AND menu.pizza_name = 'cheese pizza')
ORDER BY name