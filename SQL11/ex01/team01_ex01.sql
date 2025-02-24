WITH cte AS (
    SELECT
        balance.user_id,
        currency.id,
        currency.name AS name,
        balance.money AS money,
        (SELECT currency.rate_to_usd 
		 FROM currency
		 WHERE currency.id = balance.currency_id AND currency.updated < balance.updated
		 ORDER BY rate_to_usd LIMIT 1) AS min_rate,
        (SELECT currency.rate_to_usd 
		 FROM currency
		 WHERE currency.id = balance.currency_id AND currency.updated > balance.updated
		 ORDER BY rate_to_usd LIMIT 1) AS max_rate
    FROM 
		currency
    		JOIN 
		balance ON currency.id = balance.currency_id
    GROUP BY
            balance.money,
            currency.name,
            currency.id,
            balance.updated,
            balance.currency_id,
            balance.user_id
    ORDER BY min_rate DESC, max_rate
)

SELECT
	CASE 
		WHEN "user".name IS NULL 
		THEN 'not defined' 
		ELSE "user".name 
	END AS name,
	CASE
		WHEN "user".lastname IS NULL 
		THEN 'not defined' 
		ELSE "user".lastname 
	END AS lastname,
	cte.name AS currency_name,
	cte.money * (CASE 
				 WHEN cte.min_rate IS NULL 
				 THEN cte.max_rate 
				 ELSE cte.min_rate 
				 END) AS currency_in_usd
FROM cte
LEFT JOIN "user" ON cte.user_id = "user".id
ORDER BY 
	name DESC, 
	lastname, 
	currency_name