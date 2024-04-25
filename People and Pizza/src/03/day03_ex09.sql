INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits), (SELECT person.id FROM person WHERE person.name LIKE 'Denis'),
        (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name LIKE 'Dominos'), '2022-02-24'),
    ((SELECT MAX(id) + 2 FROM person_visits), (SELECT person.id FROM person WHERE person.name LIKE 'Irina'),
        (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name LIKE 'Dominos'), '2022-02-24');