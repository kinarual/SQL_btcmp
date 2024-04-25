CREATE INDEX idx_person_name
ON person (upper(name));

SET enable_seqscan=off
EXPLAIN ANALYZE
SELECT person_visits.visit_date, person.name
FROM person_visits
         JOIN public.person on person_visits.person_id = person.id;