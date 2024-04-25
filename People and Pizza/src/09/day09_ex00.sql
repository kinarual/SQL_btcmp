CREATE TABLE person_audit
(
    created    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp,
    type_event CHAR(1)                  NOT NULL DEFAULT 'I',
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D')),
    row_id     BIGINT                   NOT NULL,
    name       VARCHAR,
    age        INTEGER,
    gender     VARCHAR,
    address    VARCHAR
);

--Database Trigger Function for INSERT
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (default, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

--Database Trigger for INSERT
CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

--SQL statement for checking from readme
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');