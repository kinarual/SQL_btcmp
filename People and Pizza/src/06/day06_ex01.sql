INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT row_number() over () as id,
       person.id            as person_id,
       pizzeria.id          as pizzeria_id,
       CASE
           WHEN COUNT(*) = 1 THEN 10.5
           WHEN COUNT(*) = 2 THEN 22
           ELSE 30
           END              AS discount
FROM person_order
         JOIN public.menu on person_order.menu_id = menu.id
         JOIN public.person on person.id = person_order.person_id
         JOIN public.pizzeria on menu.pizzeria_id = pizzeria.id
GROUP BY person.id, pizzeria.id;