WITH total_orders AS
		(SELECT
			person.gender, pizzeria.name
		FROM
			person
		INNER JOIN
			person_order ON person_order.person_id = person.id
		INNER JOIN
		 	menu ON menu.id = person_order.menu_id
		INNER JOIN
			pizzeria ON pizzeria.id = menu.pizzeria_id

		),
	female_orders AS
		(SELECT
		 	name AS pizzeria_name
		 FROM
		 	total_orders
		 WHERE
		 	gender = 'female'
		),
	male_orders AS
		(SELECT
			name AS pizzeria_name
		FROM
			total_orders
		WHERE
			gender = 'male'
		),
	only_female_orders AS
		(SELECT
			pizzeria_name
		FROM
			female_orders
		EXCEPT
			(SELECT
			 	pizzeria_name
			 FROM
			 	male_orders
			)
		),
	only_male_orders AS
		(SELECT
			pizzeria_name
		FROM
			male_orders
		EXCEPT
			(SELECT
			 	pizzeria_name
			 FROM
			 	female_orders
			)
		)
SELECT
	pizzeria_name
FROM
	only_female_orders
UNION
SELECT
	pizzeria_name
FROM
	only_male_orders
ORDER BY 1;