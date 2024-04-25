CREATE SEQUENCE IF NOT EXISTS seq_person_discounts
    START WITH 1;
ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', COALESCE(MAX(id), 0) + 1) FROM person_discounts;