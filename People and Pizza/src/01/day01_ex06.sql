(SELECT person_order.order_date AS action_date, name AS person_name
 FROM person_order
          INNER JOIN person
                     ON person.id = person_order.person_id)
INTERSECT
(SELECT person_visits.visit_date as action_date, name AS person_name
 FROM person_visits
          INNER JOIN person ON person.id = person_visits.person_id)
ORDER BY action_date ASC, person_name DESC