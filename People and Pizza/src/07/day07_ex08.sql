SELECT person.address,
       pizzeria.name,
       COUNT(*) AS count_of_orders
FROM person_order
         JOIN person ON person.id = person_order.person_id
         JOIN menu ON person_order.menu_id = menu.id
         JOIN pizzeria on pizzeria.id = menu.pizzeria_id
GROUP BY person.address, pizzeria.name
ORDER BY 1, 2;