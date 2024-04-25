INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(id) + 1 FROM person_order), (SELECT person.id FROM person WHERE person.name LIKE 'Denis'),
        (SELECT menu.id FROM menu WHERE menu.pizza_name LIKE 'sicilian pizza'), '2022-02-24'),
    ((SELECT MAX(id) + 2 FROM person_order), (SELECT person.id FROM person WHERE person.name LIKE 'Irina'),
        (SELECT menu.id FROM menu WHERE menu.pizza_name LIKE 'sicilian pizza'), '2022-02-24');