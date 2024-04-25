WITH pizzeria_menu AS
    (SELECT menu.pizza_name, menu.pizzeria_id, p.name, menu.price
     FROM menu
     JOIN public.pizzeria p on p.id = menu.pizzeria_id)
SELECT pn1.pizza_name, pn1.name AS pizzeria_name_1, pn2.name AS pizzeria_name_2, pn1.price
FROM pizzeria_menu AS pn1
JOIN pizzeria_menu pn2 ON pn1.pizza_name = pn2.pizza_name AND pn1.pizzeria_id > pn2.pizzeria_id AND pn1.price = pn2.price
ORDER BY 1;