SELECT person_order.order_date, CONCAT(name, ' ', '(age:', age, ')') AS person_information
FROM person_order
         NATURAL JOIN (SELECT person.id AS person_id, name, age FROM person)
ORDER BY order_date ASC, person_information ASC