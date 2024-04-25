(SELECT pizzeria.name, COUNT (*) AS count, 'order' AS action_type
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria on pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY count DESC
LIMIT 3)
UNION
(SELECT pizzeria.name, COUNT (visit_date) AS count, 'visit' AS action_type
FROM person_visits
JOIN pizzeria on pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name
ORDER BY count DESC
LIMIT 3)
ORDER BY 3 ASC, 2 DESC;