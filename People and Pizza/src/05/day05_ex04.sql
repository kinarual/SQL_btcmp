CREATE UNIQUE INDEX idx_menu_unique
    ON menu (pizzeria_id, pizza_name);

SET enable_seqscan =off;
EXPLAIN ANALYZE
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 1, 'cheese pizza', 900);