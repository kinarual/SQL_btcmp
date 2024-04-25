SELECT name, SUM(count) AS total_count
FROM ((SELECT pizzeria.name, COUNT(*) AS count
       FROM person_order
                JOIN menu ON person_order.menu_id = menu.id
                JOIN pizzeria on pizzeria.id = menu.pizzeria_id
       GROUP BY pizzeria.name
       ORDER BY count DESC)
      UNION
      (SELECT pizzeria.name, COUNT(visit_date) AS count
       FROM person_visits
                JOIN pizzeria on pizzeria.id = person_visits.pizzeria_id
       GROUP BY pizzeria.name
       ORDER BY count DESC)) AS cte
GROUP BY name
ORDER BY 2 DESC, 1 ASC;