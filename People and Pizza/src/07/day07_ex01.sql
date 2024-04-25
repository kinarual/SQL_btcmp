SELECT person.name, COUNT(visit_date) AS count_of_visits
FROM person_visits
JOIN public.person on person.id = person_visits.person_id
GROUP BY person.name
ORDER BY count_of_visits DESC, person.name ASC
LIMIT 4;