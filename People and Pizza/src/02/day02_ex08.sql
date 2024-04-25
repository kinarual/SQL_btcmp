SELECT person.name AS name
FROM person_order
         INNER JOIN person ON person_order.person_id = person.id
         INNER JOIN menu ON menu.id = person_order.menu_id
WHERE person.address IN ('Moscow', 'Samara')
  AND person.gender = 'male'
  AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC