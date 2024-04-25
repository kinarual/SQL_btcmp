WITH Kate_visits AS
         (SELECT person_visits.visit_date, person_visits.pizzeria_id
          FROM person_visits
                   JOIN public.person p ON person_visits.person_id = p.id
          WHERE p.name = 'Kate'),
     pizza_price AS
         (SELECT menu.pizza_name, menu.price, menu.pizzeria_id
          FROM menu
          WHERE price BETWEEN 800 AND 1000)
SELECT pizza_price.pizza_name, pizza_price.price, pizzeria.name AS pizzeria_name, Kate_visits.visit_date
FROM pizza_price
         JOIN Kate_visits ON pizza_price.pizzeria_id = Kate_visits.pizzeria_id
         JOIN pizzeria ON pizzeria.id = Kate_visits.pizzeria_id
ORDER BY 1, 2, 3