SELECT person.name, COUNT(visit_date) AS count_of_visits
FROM person_visits
JOIN public.person on person.id = person_visits.person_id
GROUP BY person.name
HAVING COUNT(visit_date) > 3;