SELECT menu.id
FROM menu
EXCEPT
SELECT person_order.menu_id
FROM person_order
ORDER BY 1