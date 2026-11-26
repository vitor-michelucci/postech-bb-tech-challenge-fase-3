-- POSTECH - BB - Tech Challenge - Fase 3
-- Athena engine 3. Execute uma instrução por vez no console.
-- Mediana exata: média das posições centrais (divisão inteira BIGINT no Athena).
-- Consultas de mediana pressupõem ausência de nulos, ver script 05.

-- query_01
SELECT
    COUNT(*) AS total_registros,
    COUNT(DISTINCT customer_id) AS total_clientes
FROM bank_churn_db.customers;

-- query_02
SELECT
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    COUNT(*) - SUM(churn) AS clientes_retidos,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM bank_churn_db.customers;

-- query_03
SELECT
    country AS pais,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    COUNT(*) - SUM(churn) AS clientes_retidos,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM bank_churn_db.customers
GROUP BY country
ORDER BY taxa_churn_pct DESC;

-- query_04
SELECT
    gender AS genero,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    COUNT(*) - SUM(churn) AS clientes_retidos,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM bank_churn_db.customers
GROUP BY gender
ORDER BY taxa_churn_pct DESC;

-- query_05
WITH clientes_faixa AS (
    SELECT
        customer_id,
        churn,
        CASE
            WHEN age < 30 THEN 'Até 29 anos'
            WHEN age < 40 THEN '30 a 39 anos'
            WHEN age < 50 THEN '40 a 49 anos'
            WHEN age < 60 THEN '50 a 59 anos'
            ELSE '60 anos ou mais'
        END AS faixa_etaria,
        CASE
            WHEN age < 30 THEN 1
            WHEN age < 40 THEN 2
            WHEN age < 50 THEN 3
            WHEN age < 60 THEN 4
            ELSE 5
        END AS ordem
    FROM bank_churn_db.customers
)

SELECT
    faixa_etaria,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    COUNT(*) - SUM(churn) AS clientes_retidos,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM clientes_faixa
GROUP BY faixa_etaria, ordem
ORDER BY ordem;

-- query_06a
WITH ranked AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY churn ORDER BY balance, customer_id) AS rn,
        COUNT(*) OVER (PARTITION BY churn) AS n
    FROM bank_churn_db.customers
    WHERE balance IS NOT NULL
)
SELECT
    CASE
        WHEN churn = 0 THEN 'Retidos'
        ELSE 'Churn'
    END AS situacao,
    COUNT(*) AS total_clientes,
    ROUND(AVG(balance), 2) AS saldo_medio,
    ROUND(AVG(CASE WHEN rn IN ((n + 1) / 2, (n + 2) / 2) THEN CAST(balance AS DOUBLE) END), 2) AS saldo_mediano
FROM ranked
GROUP BY churn
ORDER BY churn;

-- query_06b
WITH clientes_saldo AS (
    SELECT
        churn,
        CASE
            WHEN balance = 0 THEN 'Saldo zero'
            WHEN balance <= 50000 THEN 'Até 50 mil'
            WHEN balance <= 100000 THEN '50 a 100 mil'
            WHEN balance <= 150000 THEN '100 a 150 mil'
            WHEN balance <= 200000 THEN '150 a 200 mil'
            ELSE 'Acima de 200 mil'
        END AS faixa_saldo,
        CASE
            WHEN balance = 0 THEN 1
            WHEN balance <= 50000 THEN 2
            WHEN balance <= 100000 THEN 3
            WHEN balance <= 150000 THEN 4
            WHEN balance <= 200000 THEN 5
            ELSE 6
        END AS ordem
    FROM bank_churn_db.customers
)

SELECT
    faixa_saldo,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    COUNT(*) - SUM(churn) AS clientes_retidos,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM clientes_saldo
GROUP BY faixa_saldo, ordem
ORDER BY ordem;

-- query_07
SELECT
    products_number AS quantidade_produtos,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    COUNT(*) - SUM(churn) AS clientes_retidos,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM bank_churn_db.customers
GROUP BY products_number
ORDER BY products_number;

-- query_08
SELECT
    CASE
        WHEN active_member = 1 THEN 'Ativo'
        ELSE 'Inativo'
    END AS situacao_atividade,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    COUNT(*) - SUM(churn) AS clientes_retidos,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM bank_churn_db.customers
GROUP BY active_member
ORDER BY taxa_churn_pct DESC;

-- query_09b
WITH clientes_score AS (
    SELECT
        churn,
        CASE
            WHEN credit_score < 500 THEN '350 a 499'
            WHEN credit_score < 600 THEN '500 a 599'
            WHEN credit_score < 700 THEN '600 a 699'
            WHEN credit_score < 800 THEN '700 a 799'
            ELSE '800 a 850'
        END AS faixa_score
    FROM bank_churn_db.customers
)

SELECT
    faixa_score,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    COUNT(*) - SUM(churn) AS clientes_retidos,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM clientes_score
GROUP BY faixa_score
ORDER BY faixa_score;

-- query_10
WITH ranked AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY churn ORDER BY estimated_salary, customer_id) AS rn,
        COUNT(*) OVER (PARTITION BY churn) AS n
    FROM bank_churn_db.customers
    WHERE estimated_salary IS NOT NULL
)
SELECT
    CASE
        WHEN churn = 0 THEN 'Retidos'
        ELSE 'Churn'
    END AS situacao,
    COUNT(*) AS total_clientes,
    ROUND(AVG(estimated_salary), 2) AS salario_medio,
    ROUND(AVG(CASE WHEN rn IN ((n + 1) / 2, (n + 2) / 2) THEN CAST(estimated_salary AS DOUBLE) END), 2) AS salario_mediano,
    ROUND(STDDEV_SAMP(estimated_salary), 2) AS desvio_padrao
FROM ranked
GROUP BY churn
ORDER BY churn;
