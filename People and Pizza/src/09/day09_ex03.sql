DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;

DROP FUNCTION fnc_trg_person_insert_audit();
DROP FUNCTION fnc_trg_person_delete_audit();
DROP FUNCTION fnc_trg_person_update_audit();

TRUNCATE person_audit;

--Database Trigger Function for DELETE
CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS
$$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (default, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    ELSEIF TG_OP = 'UPDATE' THEN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (default, 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    ELSE
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (default, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

--Database Trigger for DML
CREATE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

--SQL statement for checking from readme
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;
DELETE
FROM person
WHERE id = 10;