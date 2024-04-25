WITH total_visits AS (
    SELECT pizzeria.name, COUNT(person.gender) AS total_visits_count
    FROM person
    INNER JOIN person_visits ON person_visits.person_id = person.id
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.name
),
female_visits AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person_visits.person_id = person.id AND person.gender = 'female'
),
male_visits AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person_visits.person_id = person.id AND person.gender = 'male'
),
only_women_visits AS (
    SELECT pizzeria_name
    FROM female_visits
    EXCEPT ALL
    SELECT pizzeria_name
    FROM male_visits
),
only_men_visits AS (
    SELECT pizzeria_name
    FROM male_visits
    EXCEPT ALL
    SELECT pizzeria_name
    FROM female_visits
)
SELECT pizzeria_name
FROM only_women_visits
UNION ALL
SELECT pizzeria_name
FROM only_men_visits
ORDER BY 1;