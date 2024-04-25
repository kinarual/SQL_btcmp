CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy', pprice numeric DEFAULT 500,
                                                   pdate DATE DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                name VARCHAR
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT pizzeria.name
        FROM menu
                 JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
                 JOIN person_visits ON menu.pizzeria_id = person_visits.pizzeria_id
                 JOIN person ON person_visits.person_id = person.id
        WHERE person.name = pperson
          AND menu.price < pprice
          AND visit_date = pdate;
END;
$$
    LANGUAGE plpgsql;

--queries from readme for checking
--query #1
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

--query #2
select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');