WITH missed_pizzas AS
         (SELECT menu.id
          FROM menu
          EXCEPT
          SELECT person_order.menu_id
          FROM person_order
          ORDER BY 1)
SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
RIGHT JOIN missed_pizzas ON missed_pizzas.id = menu.id
ORDER BY 1,2