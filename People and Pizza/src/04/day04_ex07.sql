INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits), (SELECT person.id FROM person WHERE person.name = 'Dmitriy'),
        (SELECT pizzeria.id
         FROM pizzeria
                  JOIN public.menu m on pizzeria.id = m.pizzeria_id
         WHERE pizzeria.name <> 'Papa Johns'
           AND m.price < 800
         LIMIT 1), '2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;