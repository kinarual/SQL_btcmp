WITH Andrey_visits AS
         (SELECT DISTINCT  p2.name
          FROM person_visits
          JOIN public.person p on person_visits.person_id = p.id
          JOIN public.pizzeria p2 on person_visits.pizzeria_id = p2.id
          WHERE p.name LIKE 'Andrey'),
    Andrey_orders AS
        (SELECT DISTINCT p4.name
         FROM person_order
         JOIN public.person p3 on p3.id = person_order.person_id
         JOIN public.menu m on person_order.menu_id = m.id
         JOIN public.pizzeria p4 on p4.id = m.pizzeria_id
         WHERE p3.name LIKE 'Andrey')
SELECT Andrey_visits.name
FROM Andrey_visits
EXCEPT
(SELECT Andrey_orders.name
 FROM Andrey_orders);