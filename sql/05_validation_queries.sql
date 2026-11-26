-- POSTECH - BB - Tech Challenge - Fase 3
-- Athena engine 3. Execute uma instrução por vez no console.
-- Esperado: 10000 registros, 10000 IDs, 2037 churn, 7963 retidos, 20.37%.
SELECT COUNT(*) AS total_registros, COUNT(DISTINCT customer_id) AS total_clientes,
 SUM(churn) AS clientes_churn, SUM(CASE WHEN churn = 0 THEN 1 ELSE 0 END) AS clientes_retidos,
 ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM bank_churn_db.customers;

-- Esperado: zero nulos em cada coluna.
SELECT
 COUNT(*) - COUNT(customer_id) AS nulos_customer_id,
 COUNT(*) - COUNT(credit_score) AS nulos_credit_score,
 COUNT(*) - COUNT(country) AS nulos_country,
 COUNT(*) - COUNT(gender) AS nulos_gender,
 COUNT(*) - COUNT(age) AS nulos_age,
 COUNT(*) - COUNT(tenure) AS nulos_tenure,
 COUNT(*) - COUNT(balance) AS nulos_balance,
 COUNT(*) - COUNT(products_number) AS nulos_products_number,
 COUNT(*) - COUNT(credit_card) AS nulos_credit_card,
 COUNT(*) - COUNT(active_member) AS nulos_active_member,
 COUNT(*) - COUNT(estimated_salary) AS nulos_estimated_salary,
 COUNT(*) - COUNT(churn) AS nulos_churn
FROM bank_churn_db.customers;

-- Esperado: nenhuma linha.
SELECT customer_id, COUNT(*) AS quantidade FROM bank_churn_db.customers
GROUP BY customer_id HAVING COUNT(*) > 1;

-- Esperado: zero registros inválidos.
SELECT COUNT(*) AS invalidos FROM bank_churn_db.customers
WHERE churn IS NULL OR churn NOT IN (0,1) OR active_member IS NULL OR active_member NOT IN (0,1)
 OR credit_card IS NULL OR credit_card NOT IN (0,1);

-- Esperado: OK.
SELECT CASE WHEN COUNT(*) = 10000 AND COUNT(DISTINCT customer_id) = 10000
 AND SUM(churn) = 2037 AND SUM(CASE WHEN churn = 0 THEN 1 ELSE 0 END) = 7963
 AND ROUND(100.0 * AVG(churn),2) = 20.37 THEN 'OK' ELSE 'ERRO' END AS status
FROM bank_churn_db.customers;
