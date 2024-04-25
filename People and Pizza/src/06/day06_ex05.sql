COMMENT ON TABLE person_discounts IS 'A table with data on personal discounts at different pizzerias.';
COMMENT ON COLUMN person_discounts.id IS 'Primary key ID';
COMMENT ON COLUMN person_discounts.person_id IS 'Person ID number';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria ID number';
COMMENT ON COLUMN person_discounts.discount IS 'Personal discount at pizzeria';