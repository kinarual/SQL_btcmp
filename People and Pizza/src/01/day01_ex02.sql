SELECT menu.pizza_name FROM menu
INTERSECT
SELECT menu.pizza_name FROM menu
ORDER BY pizza_name DESC